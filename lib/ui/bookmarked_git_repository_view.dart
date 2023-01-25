import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/provider/bookmarked_git_repository_provider.dart';
import 'package:collection/collection.dart';

import '../graphql/get_repository_info_from_multiple_ids.graphql.dart';
import '../graphql/get_starred_repository.graphql.dart';
import '../graphql/repository_data.graphql.dart';
import '../type/github_node_id_type.dart';
import 'module/loading_animation.dart';
import 'module/git_repository_card_view.dart';

class BookmarkedGitRepositoryView extends HookConsumerWidget {
  const BookmarkedGitRepositoryView({Key? key}) : super(key: key);
  final _tab = const <Tab>[
    Tab(text: 'Local'),
    Tab(text: 'Github'),
    Tab(text: 'Local&Github'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$getStarredRepository(
      Options$Query$getStarredRepository(fetchPolicy: FetchPolicy.noCache),
    );

    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return const LoadingAnimation();
    }
    //例外スローした場合
    else if (qryResult.result.hasException) {
      return Text(qryResult.result.exception.toString());
    }

    if (qryResult.result.parsedData?.viewer.starredRepositories.edges != null) {
      final githubStarredRepositories =
          qryResult.result.parsedData!.viewer.starredRepositories.edges!.whereNotNull().toList();
      final starredIds = githubStarredRepositories.map((e) => e.node.id).toList();

      return DefaultTabController(
        length: _tab.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Bookmarks'),
            bottom: TabBar(tabs: _tab),
          ),
          body: TabBarView(
            children: <Widget>[
              const Center(child: Scaffold(body: LocalFavoriteCardList())),
              Center(
                  child: Scaffold(
                      body:
                          GithubStarredCardList(githubStarredIds: starredIds))),
              Center(
                  child: Scaffold(
                      body: GithubAndLocalFavoriteCardList(
                          githubStarredIds: starredIds))),
            ],
          ),
        ),
      );
    }
    return const Text('no Repositories');
  }
}

class LocalFavoriteCardList extends HookConsumerWidget {
  const LocalFavoriteCardList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkedGitRepositoryState =
        ref.read(bookmarkedGitRepositoriesProvider.notifier);

    final bookmarkedGitRepositoryValueInfo =
        useMemoized(() => bookmarkedGitRepositoryState.value);
    final bookmarkedGitRepositoryValue =
        useFuture(bookmarkedGitRepositoryValueInfo);
    if (!bookmarkedGitRepositoryValue.hasData) {
      return const LoadingAnimation();
    }

    final qryResult = useQuery$getRepositoryInfoFromMultipleIds(
      Options$Query$getRepositoryInfoFromMultipleIds(
          variables: Variables$Query$getRepositoryInfoFromMultipleIds(
              ids: bookmarkedGitRepositoryValue.data!.map((e) => e.nodeId).toList())),
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
      final repositories = qryResult.result.parsedData!.nodes;
      return ListView.builder(
          itemCount: repositories.length,
          itemBuilder: (context, index) {
            final repository = repositories[index] as Fragment$RepositoryData;
            final id = repository.id;
            final name = repository.name;
            final description = repository.description ?? 'No Description';

            return GitRepositoryCardView(
                id: id, title: name, description: description);
          });
    }
    return const Text('no Repositories');
  }
}

class GithubStarredCardList extends HookConsumerWidget {
  const GithubStarredCardList({Key? key, required this.githubStarredIds})
      : super(key: key);
  final List<GithubNodeId> githubStarredIds;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$getRepositoryInfoFromMultipleIds(
      Options$Query$getRepositoryInfoFromMultipleIds(
          variables: Variables$Query$getRepositoryInfoFromMultipleIds(
              ids: githubStarredIds)),
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
      final repositories = qryResult.result.parsedData!.nodes;

      return ListView.builder(
          itemCount: repositories.length,
          itemBuilder: (context, index) {
            final repository = repositories[index] as Fragment$RepositoryData;
            final name = repository.name;
            final description = repository.description ?? 'No Description';
            return GitRepositoryCardView(
                id: repository.id,
                title: name,
                description: description,
                isStarredInGithub: true);
          });
    }
    return const Text('no Repositories');
  }
}

class GithubAndLocalFavoriteCardList extends HookConsumerWidget {
  const GithubAndLocalFavoriteCardList(
      {Key? key, required this.githubStarredIds})
      : super(key: key);
  final List<GithubNodeId> githubStarredIds;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkedGitRepositoryState =
        ref.read(bookmarkedGitRepositoriesProvider.notifier);

    final bookmarkedGitRepositoryValueInfo =
        useMemoized(() => bookmarkedGitRepositoryState.value);
    final bookmarkedGitRepositoryValue =
        useFuture(bookmarkedGitRepositoryValueInfo);
    if (!bookmarkedGitRepositoryValue.hasData) {
      return const LoadingAnimation();
    }

    List<GithubNodeId> ids = List.from(githubStarredIds)
      ..addAll(bookmarkedGitRepositoryValue.data!.map((e) => e.nodeId));
    //重複を削除（LocalとGithubどちらもお気に入り登録するとどちらも表示されるため）
    ids = ids.toSet().toList();
    final qryResult = useQuery$getRepositoryInfoFromMultipleIds(
      Options$Query$getRepositoryInfoFromMultipleIds(
          variables:
              Variables$Query$getRepositoryInfoFromMultipleIds(ids: ids)),
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
      final repositories = qryResult.result.parsedData!.nodes;
      //再構築は不要だけどあたいが欲しいのでref.watchで宣言
      final favStates = bookmarkedGitRepositoryValue.data!;
      return ListView.builder(
          itemCount: ids.length,
          itemBuilder: (context, index) {
            final repository = repositories[index] as Fragment$RepositoryData;
            final name = repository.name;
            final description = repository.description ?? 'No Description';
            final favState =
                favStates.where((element) => element.nodeId == repository.id).isEmpty;
            return GitRepositoryCardView(
                id: repository.id,
                title: name,
                description: description,
                isStarredInGithub: favState);
          });
    }
    return const Text('no Repositories');
  }
}