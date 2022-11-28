import 'package:flutter/material.dart';
// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/starred_repositories.dart';
import 'package:url_launcher/url_launcher.dart';

import './graphql/getStarredRepositories.graphql.dart';
import 'loadingAnimation.dart';
import 'repository_view.dart';

class StarredRepositories extends HookConsumerWidget {
  const StarredRepositories({Key? key, required this.orgName})
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
          title: const Text('Starred Repositories'),
          bottom: TabBar(tabs: _tab),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
                child: Scaffold(body: InAppstarredCardList(orgName: orgName))),
            Center(
                child: Scaffold(
                    body: StarList(
                        orgName: orgName, isMixLocalStarredList: false))),
            Center(
                child: Scaffold(
                    body: StarList(
              orgName: orgName,
              isMixLocalStarredList: true,
            ))),
          ],
        ),
      ),
    );
  }
}

class InAppstarredCardList extends StatefulWidget {
  const InAppstarredCardList({Key? key, required this.orgName})
      : super(key: key);
  final String orgName;
  @override
  createState() => _InAppstarredCardList();
}

class _InAppstarredCardList extends State<InAppstarredCardList> {
  @override
  Widget build(BuildContext context) {
    var isstarred = List.generate(starredRepository.length, (index) => true);
    void setstarred(int index) {
      setState(() {
        isstarred[index] != isstarred[index];
      });
    }

    return ListView.builder(
        itemCount: starredRepository.length,
        itemBuilder: (context, index) {
          final TextTheme textTheme = Theme.of(context).textTheme;
          final starredrepository = starredRepository[index];
          return Card(
            child: ListTile(
              trailing: GestureDetector(
                child: Icon(isstarred[index] ? Icons.star : Icons.star_border,
                    color: isstarred[index] ? Colors.yellow : null),
                onTap: () {
                  setstarred(index);
                  if (isstarred[index]) {
                    starredRepository.removeWhere(
                        (element) => element.name == starredrepository.name);
                  } else {
                    starredRepository.add(starredrepository);
                  }
                },
              ),
              title: Text(
                starredrepository.name,
                style: textTheme.headline5,
              ),
              subtitle: Text(starredrepository.description ?? "no description"),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RepositoryView(
                      repository: starredrepository, orgName: widget.orgName),
                ),
              ),
            ),
          );
        });
  }
}

class StarList extends HookConsumerWidget {
  const StarList(
      {Key? key, required this.orgName, required this.isMixLocalStarredList})
      : super(key: key);
  final String orgName;
  final bool isMixLocalStarredList;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$getStarredRepositories(
      Options$Query$getStarredRepositories(),
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
      final starredRepositories =
          qryResult.result.parsedData!.viewer.starredRepositories.edges!;

      //localのstarredリストとgithubのstarをまとめて表示するため、localのstarredリストを追加
      //typenameとはなんぞや
      if (isMixLocalStarredList) {
        for (var tmp in starredRepository) {
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  starredRepository.description ?? "no description",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () => launchUrl(Uri.parse(starredRepository.url)),
              ),
            );
          });
    }
    return const Text("No starred repository in your account");
  }
}
