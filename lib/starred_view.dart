import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/repository_view.dart';
import 'package:repositoryviewer/starred_repositories.dart';

import './graphql/getRepositoryInfoFromMultipleIDs.graphql.dart';
import './graphql/getStarredRepositories.graphql.dart';
import 'loadingAnimation.dart';

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
      return loadingAnimation();
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
    final qryResult = useQuery$getRepositoryInfoFromMultipleIDs(
      Options$Query$getRepositoryInfoFromMultipleIDs(
          variables: Variables$Query$getRepositoryInfoFromMultipleIDs(
              ids: FavoriteRepositories.value)),
    );

    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return loadingAnimation();
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
            final TextTheme textTheme = Theme.of(context).textTheme;
            final repository = repositories[index] as Fragment$RepositoryData;
            final name = repository.name;
            final description = repository.description;
            return Card(
              child: ListTile(
                  trailing: SideFavoriteIconButton(
                      id: FavoriteRepositories.value
                          .firstWhere((element) => element == repository.id)),
                  title: Text(
                    name,
                    style: textTheme.headline5,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(description ?? "no description",
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            RepositoryView(repositoryID: repository.id),
                      ),
                    );
                    useState(() {});
                  }),
            );
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
      return loadingAnimation();
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
            final TextTheme textTheme = Theme.of(context).textTheme;
            final repository = repositories[index] as Fragment$RepositoryData;
            final name = repository.name;
            final description = repository.description;
            return Card(
              child: ListTile(
                  trailing: const SideStarIconButton(),
                  title: Text(
                    name,
                    style: textTheme.headline5,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(description ?? "no description",
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            RepositoryView(repositoryID: repository.id),
                      ),
                    );
                    useState(() {});
                  }),
            );
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
    List<String> ids = List.from(githubStarredIds)
      ..addAll(FavoriteRepositories.value);
    //重複を削除（LocalとGithubどちらもお気に入り登録するとどちらも表示されるため）
    ids = ids.toSet().toList();
    final qryResult = useQuery$getRepositoryInfoFromMultipleIDs(
      Options$Query$getRepositoryInfoFromMultipleIDs(
          variables:
              Variables$Query$getRepositoryInfoFromMultipleIDs(ids: ids)),
    );

    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return loadingAnimation();
    }
    //例外スローした場合
    else if (qryResult.result.hasException) {
      return Text(qryResult.result.exception.toString());
    }

    if (qryResult.result.parsedData?.nodes != null) {
      final repositories = qryResult.result.parsedData!.nodes;

      return ListView.builder(
          itemCount: ids.length,
          itemBuilder: (context, index) {
            final TextTheme textTheme = Theme.of(context).textTheme;
            final repository = repositories[index] as Fragment$RepositoryData;
            final name = repository.name;
            final description = repository.description;
            return Card(
              child: ListTile(
                  trailing: FavoriteRepositories.value
                          .where((element) => element == repository.id)
                          .isEmpty
                      ? const SideStarIconButton()
                      : SideFavoriteIconButton(
                          id: ids.firstWhere(
                              (element) => element == repository.id)),
                  title: Text(
                    name,
                    style: textTheme.headline5,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(description ?? "no description",
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            RepositoryView(repositoryID: repository.id),
                      ),
                    );
                    useState(() {});
                  }),
            );
          });
    }
    return const Text("no Repositories");
  }
}

class SideFavoriteIconButton extends StatefulWidget {
  const SideFavoriteIconButton({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  createState() => _SideFavoriteIconButton();
}

class _SideFavoriteIconButton extends State<SideFavoriteIconButton> {
  @override
  Widget build(BuildContext context) {
    var dispIcon = Icons.favorite;
    Color? dispColor = Colors.red;
    if (FavoriteRepositories.value
        .where((element) => element == widget.id)
        .isEmpty) {
      dispIcon = Icons.favorite_border;
      dispColor = null;
    }

    void setUnFavorite() {
      setState(() {
        dispIcon = Icons.favorite_border;
        dispColor = Colors.white;
      });
      FavoriteRepositories.value.removeWhere((element) => element == widget.id);
    }

    return GestureDetector(
        child: Icon(dispIcon, color: dispColor),
        onTap: () {
          //starを外した時の動作はカードが消えるだけなのでfalseの処理はない
          setUnFavorite();
        });
  }
}

class SideStarIconButton extends StatefulWidget {
  const SideStarIconButton({Key? key}) : super(key: key);
  @override
  createState() => _SideStarIconButton();
}

class _SideStarIconButton extends State<SideStarIconButton> {
  var dispIcon = Icons.star;
  Color? dispColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    void toggleIconColor() {
      setState(() {
        if (dispIcon == Icons.star) {
          dispIcon = Icons.star_border;
          dispColor = null;
        } else {
          dispIcon = Icons.star;
          dispColor = Colors.yellow;
        }
      });
    }

    return GestureDetector(
        child: Icon(dispIcon, color: dispColor),
        onTap: () {
          //starを外した時の動作はカードが消えるだけなのでfalseの処理はない
          toggleIconColor();
        });
  }
}

// class SideStarIconButton extends StatelessWidget {
//   const SideStarIconButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Icon(Icons.star, color: Colors.yellow);
//   }
// }
