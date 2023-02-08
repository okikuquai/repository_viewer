import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/provider/bookmarked_git_repository_provider.dart';
import 'package:repositoryviewer/type/error_type.dart';
import 'package:repositoryviewer/ui/exception_message_view.dart';
import 'package:repositoryviewer/ui/module/graphql_linkexception.dart';

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
            Center(child: Scaffold(body: BookmarkedRepositoryCardList())),
            Center(child: Scaffold(body: GithubStarredRepositoryCardList())),
            Center(
                child: Scaffold(
                    body: GithubStarredAndBookmarkedRepositoryCardList())),
          ],
        ),
      ),
    );
  }
}

class BookmarkedRepositoryCardList extends HookConsumerWidget {
  const BookmarkedRepositoryCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkedGitRepositoryAsyncState =
        ref.watch(bookmarkedRepositoryProvider);

    return bookmarkedGitRepositoryAsyncState.when(
        data: (bookmarkedReposId) {
          final qryResult = useQuery$getRepositoryInfoFromMultipleIds(
            Options$Query$getRepositoryInfoFromMultipleIds(
                variables: Variables$Query$getRepositoryInfoFromMultipleIds(
                    ids: bookmarkedReposId.map((e) => e.nodeId).toList())),
          );
          //ロード完了していない場合
          if (qryResult.result.isLoading) {
            return const LoadingAnimation();
          }
          //例外スローした場合
          else if (qryResult.result.hasException) {
            return GraphQLLinkException(
                exception: qryResult.result.exception?.linkException);
          }

          return RepositoryCardsView(
              repositoryDataList: qryResult.result.parsedData?.nodes
                      .map((e) => e as Fragment$RepositoryData)
                      .toSet() ??
                  {},
              bookmarkedNodeIds:
                  bookmarkedReposId.map((e) => e.nodeId).toSet());
        },
        loading: () => const LoadingAnimation(),
        error: (Object error, StackTrace stackTrace) =>
            const ExceptionMessageView(errorType: ErrorType.internalError));
  }
}

class GithubStarredRepositoryCardList extends HookConsumerWidget {
  const GithubStarredRepositoryCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final githubStarredReposQryResult =
        useQuery$getRepositoryFromStarredAndMultipleIds(
      Options$Query$getRepositoryFromStarredAndMultipleIds(
        variables:
            Variables$Query$getRepositoryFromStarredAndMultipleIds(ids: []),
        fetchPolicy: FetchPolicy.noCache,
      ),
    );

    if (githubStarredReposQryResult.result.isLoading) {
      return const LoadingAnimation();
    } else if (githubStarredReposQryResult.result.hasException) {
      return Text(githubStarredReposQryResult.result.exception.toString());
    }

    //starしてない場合はそのまま空配列を渡す
    final githubStarredRepositories = githubStarredReposQryResult
            .result.parsedData?.viewer.starredRepositories.edges
            ?.toList() ??
        [];

    return RepositoryCardsView(
        repositoryDataList: githubStarredRepositories
            .map((e) => e?.node)
            .whereNotNull()
            .toSet());
  }
}

class GithubStarredAndBookmarkedRepositoryCardList extends HookConsumerWidget {
  const GithubStarredAndBookmarkedRepositoryCardList({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkedGitRepositoryAsyncState =
        ref.watch(bookmarkedRepositoryProvider);

    return bookmarkedGitRepositoryAsyncState.when(
        data: (bookmarkedReposId) {
          final qryResult = useQuery$getRepositoryFromStarredAndMultipleIds(
            Options$Query$getRepositoryFromStarredAndMultipleIds(
              variables: Variables$Query$getRepositoryFromStarredAndMultipleIds(
                  ids: bookmarkedReposId.map((e) => e.nodeId).toList()),
              fetchPolicy: FetchPolicy.noCache,
            ),
          );

          //ロード完了していない場合
          if (qryResult.result.isLoading) {
            return const LoadingAnimation();
          }
          //例外スローした場合
          else if (qryResult.result.hasException) {
            return Text(qryResult.result.exception.toString());
          }
          final starredRepos = qryResult
                  .result.parsedData?.viewer.starredRepositories.edges
                  ?.map((e) => e?.node)
                  .whereNotNull()
                  .toList() ??
              [];
          final bookmarkedRepos = qryResult.result.parsedData?.nodes
                  .map((e) => e as Fragment$RepositoryData) ??
              [];

          return RepositoryCardsView(
            repositoryDataList: {...starredRepos, ...bookmarkedRepos},
            bookmarkedNodeIds: bookmarkedReposId.map((e) => e.nodeId).toSet(),
          );
        },
        loading: () => const LoadingAnimation(),
        error: (Object error, StackTrace stackTrace) =>
            const ExceptionMessageView(errorType: ErrorType.internalError));
  }
}

class RepositoryCardsView extends HookConsumerWidget {
  const RepositoryCardsView(
      {super.key, required this.repositoryDataList, this.bookmarkedNodeIds});

  final Set<Fragment$RepositoryData> repositoryDataList;
  final Set<GithubNodeId>? bookmarkedNodeIds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: repositoryDataList.length,
        itemBuilder: (context, index) {
          final repository = repositoryDataList.toList()[index];
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
