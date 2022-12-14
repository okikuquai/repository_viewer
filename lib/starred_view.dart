import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/starred_repositories.dart';

import './graphql/getRepositoryInfoFromMultipleIDs.graphql.dart';
import './graphql/getStarredRepositories.graphql.dart';
import 'loadingAnimation.dart';
import 'repository_card.dart';

class StarredRepositories extends HookConsumerWidget {
  const StarredRepositories({Key? key}) : super(key: key);
  final _tab = const <Tab>[
    Tab(text: 'Local'),
    Tab(text: 'Github'),
    Tab(text: 'Local&Github'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$getStarredRepositories(
      Options$Query$getStarredRepositories(fetchPolicy: FetchPolicy.noCache),
    );

    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return LoadingAnimation();
    }
    //例外スローした場合
    else if (qryResult.result.hasException) {
      return Text(qryResult.result.exception.toString());
    }

    if (qryResult.result.parsedData?.viewer.starredRepositories.edges != null) {
      final githubStarredRepositories =
          qryResult.result.parsedData!.viewer.starredRepositories.edges!;
      final starredIDs = <String>[];
      for (final edge in githubStarredRepositories) {
        if (edge == null) continue;
        starredIDs.add(edge.node.id);
      }

      return DefaultTabController(
        length: _tab.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Starred Repositories'),
            bottom: TabBar(tabs: _tab),
          ),
          body: TabBarView(
            children: <Widget>[
              const Center(child: Scaffold(body: LocalFavoriteCardList())),
              Center(
                  child: Scaffold(
                      body:
                          GithubStarredCardList(githubStarredIds: starredIDs))),
              Center(
                  child: Scaffold(
                      body: GithubAndLocalFavoriteCardList(
                          githubStarredIds: starredIDs))),
            ],
          ),
        ),
      );
    }
    return const Text("no Repositories");
  }
}

class LocalFavoriteCardList extends HookConsumerWidget {
  const LocalFavoriteCardList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteRepositoriesState =
        ref.read(FavoriteRepositoryProvider.notifier);

    final favoriteRepositoriesvalueinfo =
        useMemoized(() => favoriteRepositoriesState.value);
    final favoriteRepositoriesvalue = useFuture(favoriteRepositoriesvalueinfo);
    if (!favoriteRepositoriesvalue.hasData) {
      return LoadingAnimation();
    }

    final qryResult = useQuery$getRepositoryInfoFromMultipleIDs(
      Options$Query$getRepositoryInfoFromMultipleIDs(
          variables: Variables$Query$getRepositoryInfoFromMultipleIDs(
              ids: favoriteRepositoriesvalue.data!)),
    );

    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return LoadingAnimation();
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
            final description = repository.description ?? "No Description";

            return RepositoryCard(
                id: id, title: name, description: description);
          });
    }
    return const Text("no Repositories");
  }
}

class GithubStarredCardList extends HookConsumerWidget {
  const GithubStarredCardList({Key? key, required this.githubStarredIds})
      : super(key: key);
  final List<String> githubStarredIds;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$getRepositoryInfoFromMultipleIDs(
      Options$Query$getRepositoryInfoFromMultipleIDs(
          variables: Variables$Query$getRepositoryInfoFromMultipleIDs(
              ids: githubStarredIds)),
    );

    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return LoadingAnimation();
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
            final description = repository.description ?? "No Description";
            return RepositoryCard(
                id: repository.id,
                title: name,
                description: description,
                isStarredinGithub: true);
          });
    }
    return const Text("no Repositories");
  }
}

class GithubAndLocalFavoriteCardList extends HookConsumerWidget {
  const GithubAndLocalFavoriteCardList(
      {Key? key, required this.githubStarredIds})
      : super(key: key);
  final List<String> githubStarredIds;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteRepositoriesState =
        ref.read(FavoriteRepositoryProvider.notifier);

    final favoriteRepositoriesvalueinfo =
        useMemoized(() => favoriteRepositoriesState.value);
    final favoriteRepositoriesvalue = useFuture(favoriteRepositoriesvalueinfo);
    if (!favoriteRepositoriesvalue.hasData) {
      return LoadingAnimation();
    }

    List<String> ids = List.from(githubStarredIds)
      ..addAll(favoriteRepositoriesvalue.data!);
    //重複を削除（LocalとGithubどちらもお気に入り登録するとどちらも表示されるため）
    ids = ids.toSet().toList();
    final qryResult = useQuery$getRepositoryInfoFromMultipleIDs(
      Options$Query$getRepositoryInfoFromMultipleIDs(
          variables:
              Variables$Query$getRepositoryInfoFromMultipleIDs(ids: ids)),
    );

    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return LoadingAnimation();
    }
    //例外スローした場合
    else if (qryResult.result.hasException) {
      return Text(qryResult.result.exception.toString());
    }

    if (qryResult.result.parsedData?.nodes != null) {
      final repositories = qryResult.result.parsedData!.nodes;
      //再構築は不要だけどあたいが欲しいのでref.watchで宣言
      final favStates = favoriteRepositoriesvalue.data!;
      return ListView.builder(
          itemCount: ids.length,
          itemBuilder: (context, index) {
            final repository = repositories[index] as Fragment$RepositoryData;
            final name = repository.name;
            final description = repository.description ?? "No Description";
            final favState =
                favStates.where((element) => element == repository.id).isEmpty;
            return RepositoryCard(
                id: repository.id,
                title: name,
                description: description,
                isStarredinGithub: favState);
          });
    }
    return const Text("no Repositories");
  }
}

class SideStarIconButton extends StatelessWidget {
  const SideStarIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 48,
      height: 48,
      child: Icon(Icons.star, color: Colors.yellow),
    );
  }
}
