import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/provider/bookmarked_git_repository_provider.dart';
import 'package:repositoryviewer/ui/exception_message_view.dart';

import '../graphql/get_repository_info_from_multiple_ids.graphql.dart';
import '../graphql/get_starred_repository.graphql.dart';
import '../graphql/repository_data.graphql.dart';
import '../type/github_node_id_type.dart';
import 'module/git_repository_card_view.dart';
import 'module/loading_animation.dart';

class BookmarkedGitRepositoryView extends HookConsumerWidget {
  const BookmarkedGitRepositoryView({Key? key}) : super(key: key);
  final _tab = const <Tab>[
    Tab(text: 'Local'),
    Tab(text: 'Github'),
    Tab(text: 'Local&Github'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bookmarks'),
          bottom: TabBar(tabs: _tab),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(child: Scaffold(body: LocalFavoriteCardList())),
            Center(child: Scaffold(body: GithubStarredCardList())),
            Center(child: Scaffold(body: GithubAndLocalFavoriteCardList())),
          ],
        ),
      ),
    );
  }
}

class LocalFavoriteCardList extends HookConsumerWidget {
  const LocalFavoriteCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkedGitRepositoryAsyncState =
        ref.watch(bookmarkedRepositoryProvider);

    return bookmarkedGitRepositoryAsyncState.when(
        data: (bookmarkedRepos) {
          final qryResult = useQuery$getRepositoryInfoFromMultipleIds(
            Options$Query$getRepositoryInfoFromMultipleIds(
                variables: Variables$Query$getRepositoryInfoFromMultipleIds(
                    ids: bookmarkedRepos.map((e) => e.nodeId).toList())),
          );
          //ロード完了していない場合
          if (qryResult.result.isLoading) {
            return const LoadingAnimation();
          }
          //例外スローした場合
          else if (qryResult.result.hasException) {
            return Text(qryResult.result.exception.toString());
          }

          if (qryResult.result.parsedData?.nodes != null) {
            return RepositoryCardsView(
                repositoryDataList: qryResult.result.parsedData!.nodes
                    .map((e) => e as Fragment$RepositoryData)
                    .toList(),
                bookmarkedNodeIds:
                    bookmarkedRepos.map((e) => e.nodeId).toSet());
          }
          return const Text('no Repositories');
        },
        loading: () => const LoadingAnimation(),
        error: (Object error, StackTrace stackTrace) =>
            ExceptionMessageView(message: error.toString()));
  }
}

class GithubStarredCardList extends HookConsumerWidget {
  const GithubStarredCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final githubStarredReposQryResult = useQuery$getStarredRepository(
      Options$Query$getStarredRepository(fetchPolicy: FetchPolicy.noCache),
    );

    //ロード完了していない場合
    if (githubStarredReposQryResult.result.isLoading) {
      return const LoadingAnimation();
    }
    //例外スローした場合
    else if (githubStarredReposQryResult.result.hasException) {
      return Text(githubStarredReposQryResult.result.exception.toString());
    }

    if (githubStarredReposQryResult
            .result.parsedData?.viewer.starredRepositories.edges !=
        null) {
      final githubStarredRepositories = githubStarredReposQryResult
          .result.parsedData!.viewer.starredRepositories.edges!
          .whereNotNull()
          .toList();
      final starredIds =
          githubStarredRepositories.map((e) => e.node.id).toList();

      final repositoryDataQryResult = useQuery$getRepositoryInfoFromMultipleIds(
        Options$Query$getRepositoryInfoFromMultipleIds(
            variables: Variables$Query$getRepositoryInfoFromMultipleIds(
                ids: starredIds)),
      );

      //ロード完了していない場合
      if (repositoryDataQryResult.result.isLoading) {
        return const LoadingAnimation();
      }
      //例外スローした場合
      else if (repositoryDataQryResult.result.hasException) {
        return Text(repositoryDataQryResult.result.exception.toString());
      }

      if (repositoryDataQryResult.result.parsedData?.nodes != null) {
        return RepositoryCardsView(
            repositoryDataList: repositoryDataQryResult.result.parsedData!.nodes
                .map((e) => e as Fragment$RepositoryData)
                .toList());
      }
    }
    return const Text('no Repositories');
  }
}

class GithubAndLocalFavoriteCardList extends HookConsumerWidget {
  const GithubAndLocalFavoriteCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final githubStarredReposQryResult = useQuery$getStarredRepository(
      Options$Query$getStarredRepository(fetchPolicy: FetchPolicy.noCache),
    );

    //ロード完了していない場合
    if (githubStarredReposQryResult.result.isLoading) {
      return const LoadingAnimation();
    }
    //例外スローした場合
    else if (githubStarredReposQryResult.result.hasException) {
      return Text(githubStarredReposQryResult.result.exception.toString());
    }

    if (githubStarredReposQryResult
            .result.parsedData?.viewer.starredRepositories.edges !=
        null) {
      final bookmarkedGitRepositoryAsyncState =
          ref.watch(bookmarkedRepositoryProvider);
      final githubStarredRepositories = githubStarredReposQryResult
          .result.parsedData!.viewer.starredRepositories.edges!
          .whereNotNull()
          .toList();
      final starredIds =
          githubStarredRepositories.map((e) => e.node.id).toList();

      return bookmarkedGitRepositoryAsyncState.when(
          data: (bookmarkedRepos) {
            List<GithubNodeId> ids = List.from(starredIds)
              ..addAll(bookmarkedRepos.map((e) => e.nodeId));
            //重複を削除（LocalとGithubどちらもお気に入り登録するとどちらも表示されるため）
            ids = ids.toSet().toList();
            final qryResult = useQuery$getRepositoryInfoFromMultipleIds(
              Options$Query$getRepositoryInfoFromMultipleIds(
                  variables: Variables$Query$getRepositoryInfoFromMultipleIds(
                      ids: ids)),
            );

            //ロード完了していない場合
            if (qryResult.result.isLoading) {
              return const LoadingAnimation();
            }
            //例外スローした場合
            else if (qryResult.result.hasException) {
              return Text(qryResult.result.exception.toString());
            }

            if (qryResult.result.parsedData?.nodes != null) {
              return RepositoryCardsView(
                  repositoryDataList: qryResult.result.parsedData!.nodes
                      .map((e) => e as Fragment$RepositoryData)
                      .toList(),
                  bookmarkedNodeIds:
                      bookmarkedRepos.map((e) => e.nodeId).toSet());
            }
            return const Text('no Repositories');
          },
          loading: () => const LoadingAnimation(),
          error: (Object error, StackTrace stackTrace) =>
              ExceptionMessageView(message: error.toString()));
    } else {
      return const Text('no Repositories');
    }
  }
}

class RepositoryCardsView extends HookConsumerWidget {
  const RepositoryCardsView(
      {super.key, required this.repositoryDataList, this.bookmarkedNodeIds});

  final List<Fragment$RepositoryData> repositoryDataList;
  final Set<GithubNodeId>? bookmarkedNodeIds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: repositoryDataList.length,
        itemBuilder: (context, index) {
          final repository = repositoryDataList[index];
          final name = repository.name;
          final description = repository.description ?? 'No Description';
          final favState = bookmarkedNodeIds
                  ?.where((element) => element == repository.id)
                  .isEmpty ??
              true;
          return GitRepositoryCardView(
              id: repository.id,
              title: name,
              description: description,
              isStarredInGithub: favState);
        });
  }
}
