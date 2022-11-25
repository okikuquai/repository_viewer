import 'package:flutter/material.dart';
// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/favorite_repositories.dart';
import 'package:url_launcher/url_launcher.dart';

import './graphql/getStarredRepositories.graphql.dart';
import 'repository_view.dart';

class FavoriteRepositories extends HookConsumerWidget {
  const FavoriteRepositories({Key? key, required this.orgName})
      : super(key: key);
  final String orgName;
  final _tab = const <Tab>[
    Tab(text: 'Local'),
    Tab(text: 'Github'),
    Tab(text: 'Local&Github'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorite Repositories'),
          bottom: TabBar(tabs: _tab),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
                child: Scaffold(body: InAppFavoriteCardList(orgName: orgName))),
            Center(
                child: Scaffold(
                    body: StarList(
                        orgName: orgName, isMixLocalFavorites: false))),
            Center(
                child: Scaffold(
                    body: StarList(
              orgName: orgName,
              isMixLocalFavorites: true,
            ))),
          ],
        ),
      ),
    );
  }
}

class InAppFavoriteCardList extends StatefulWidget {
  const InAppFavoriteCardList({Key? key, required this.orgName})
      : super(key: key);
  final String orgName;
  @override
  createState() => _InAppFavoriteCardList();
}

class _InAppFavoriteCardList extends State<InAppFavoriteCardList> {
  @override
  Widget build(BuildContext context) {
    var isFavorite = List.generate(favoriteRepository.length, (index) => true);
    void setFavorite(int index) {
      setState(() {
        isFavorite[index] != isFavorite[index];
      });
    }

    return ListView.builder(
        itemCount: favoriteRepository.length,
        itemBuilder: (context, index) {
          final TextTheme textTheme = Theme.of(context).textTheme;
          final favrepository = favoriteRepository[index];
          return Card(
            child: ListTile(
              trailing: GestureDetector(
                child: Icon(
                    isFavorite[index]
                        ? Icons.favorite
                        : Icons.favorite_border_rounded,
                    color: isFavorite[index] ? Colors.red : null),
                onTap: () {
                  setFavorite(index);
                  if (isFavorite[index]) {
                    favoriteRepository.removeWhere(
                        (element) => element.name == favrepository.name);
                  } else {
                    favoriteRepository.add(favrepository);
                  }
                },
              ),
              title: Text(
                favrepository.name,
                style: textTheme.headline5,
              ),
              subtitle: Text(favrepository.description ?? "no description"),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RepositoryView(
                      repository: favrepository, orgName: widget.orgName),
                ),
              ),
            ),
          );
        });
  }
}

class StarList extends HookConsumerWidget {
  const StarList(
      {Key? key, required this.orgName, required this.isMixLocalFavorites})
      : super(key: key);
  final String orgName;
  final bool isMixLocalFavorites;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$getStarredRepositories(
      Options$Query$getStarredRepositories(),
    );

    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return const Text("Loading");
    }
    //例外スローした場合
    else if (qryResult.result.hasException) {
      return Text(qryResult.result.exception.toString());
    }

    if (qryResult.result.parsedData?.viewer.starredRepositories.edges != null) {
      final starredRepositories =
          qryResult.result.parsedData!.viewer.starredRepositories.edges!;

      //localのfavoriteリストとgithubのstarをまとめて表示するため、localのfavoriteリストを追加
      //typenameとはなんぞや
      if (isMixLocalFavorites) {
        for (var tmp in favoriteRepository) {
          starredRepositories.add(
              Query$getStarredRepositories$viewer$starredRepositories$edges(
                  node:
                      Query$getStarredRepositories$viewer$starredRepositories$edges$node(
                          name: tmp.name,
                          description: tmp.description,
                          url: tmp.url,
                          $__typename: ''),
                  $__typename: ''));
        }
      }

      return ListView.builder(
          itemCount: starredRepositories.length,
          itemBuilder: (context, index) {
            final TextTheme textTheme = Theme.of(context).textTheme;
            final starredRepository = starredRepositories[index]!.node;
            return Card(
              child: ListTile(
                title: Text(
                  starredRepository.name,
                  style: textTheme.headline5,
                ),
                subtitle:
                    Text(starredRepository.description ?? "no description"),
                onTap: () => launchUrl(Uri.parse(starredRepository.url)),
              ),
            );
          });
    }
    return const Text("No starred repository in your account");
  }
}
