import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/starred_repositories.dart';

import './graphql/getReadmeFromRepository.graphql.dart';
import 'graphql/searchRepositoriesInTeam.graphql.dart';
import 'loadingAnimation.dart';

class RepositoryView extends HookConsumerWidget {
  const RepositoryView(
      {Key? key, required this.orgName, required this.repository})
      : super(key: key);
  final String orgName;
  final Query$searchRepositoriesInTeam$organization$team$repositories$edges$node
      repository;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String mdString = "Empty";
    final qryResult = useQuery$getReadmeFromRepository(
      Options$Query$getReadmeFromRepository(
          variables: Variables$Query$getReadmeFromRepository(
              orgName: orgName, repositoryName: repository.name)),
    );

    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return loadingAnimation();
    }
    //例外スローした場合
    else if (qryResult.result.hasException) {
      mdString = qryResult.result.exception.toString();
    } else {
      mdString = qryResult.result.parsedData?.organization?.repository?.object
              ?.toJson()['text'] ??
          "Empty";
    }
    return RepositoryViewBody(
        orgName: orgName, repository: repository, mdString: mdString);
  }

  //Widget _body(BuildContext context) {}
}

class RepositoryViewBody extends StatefulWidget {
  const RepositoryViewBody(
      {Key? key,
      required this.orgName,
      required this.repository,
      required this.mdString})
      : super(key: key);
  final String orgName;
  final Query$searchRepositoriesInTeam$organization$team$repositories$edges$node
      repository;
  final String mdString;

  @override
  createState() => _RepositoryViewBody();
}

class _RepositoryViewBody extends State<RepositoryViewBody> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = starredRepository
        .where((element) => element.name == widget.repository.name)
        .isNotEmpty;
    final TextTheme textTheme = Theme.of(context).textTheme;
    void setFavorite() {
      setState(() {
        isFavorite != isFavorite;
      });
      if (isFavorite) {
        starredRepository
            .removeWhere((element) => element.name == widget.repository.name);
      } else {
        starredRepository.add(widget.repository);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.repository.name),
          actions: [
            IconButton(
                onPressed: () {
                  setFavorite();
                },
                icon: Icon(isFavorite ? Icons.star : Icons.star_border),
                color: isFavorite ? Colors.yellow : Colors.white)
          ],
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    children: [
                      Text(widget.repository.name, style: textTheme.headline4),
                      Text("${widget.orgName} / ${widget.repository.name}",
                          style: textTheme.headline6)
                    ],
                  ),
                )),
            const Divider(),
            // ExpansionTile(
            //     title: Text(
            //       "Readme",
            //       style: textTheme.headline5,
            //     ),
            //     children: [
            //       ListView.builder(
            //           itemCount: widget.repository.collaborators!.edges!.length,
            //           itemBuilder: (context, index) {
            //             final collaborator = widget
            //                 .repository.collaborators!.edges![index]!.node;
            //             return SizedBox(
            //               height: 20.0,
            //               width: 20.0,
            //               child: Container(
            //                 decoration: BoxDecoration(
            //                     shape: BoxShape.circle,
            //                     image: DecorationImage(
            //                         fit: BoxFit.fill,
            //                         image:
            //                             NetworkImage(collaborator.avatarUrl))),
            //               ),
            //             );
            //           }),
            //     ]),
            // const Divider(),
            ExpansionTile(
              title: Text(
                "Readme",
                style: textTheme.headline5,
              ),
              children: [
                SingleChildScrollView(
                    // スクロールできるようにしておくのと、パッディングをいれてみやすくしておく
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: MarkdownBody(
                          data: widget.mdString,
                        ))),
              ],
            ),
          ],
        ));
  }
}
