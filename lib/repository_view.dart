import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/starred_repositories.dart';
import 'package:url_launcher/url_launcher.dart';

import './graphql/getRepositoryCollaboratorFromID.graphql.dart';
import './graphql/getRepositoryInfoFromID.graphql.dart';
import './graphql/getRepositoryReadmeFromID.graphql.dart';
import 'loadingAnimation.dart';

class RepositoryView extends HookConsumerWidget {
  const RepositoryView({Key? key, required this.repositoryID})
      : super(key: key);
  final String repositoryID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repoData = useQuery$getRepositoryDataFromID(
      Options$Query$getRepositoryDataFromID(
          variables: Variables$Query$getRepositoryDataFromID(id: repositoryID)),
    );
    if (repoData.result.isLoading) {
      return loadingAnimation();
    } else if (repoData.result.hasException) {}

    if (repoData.result.parsedData != null) {
      final parsedData =
          repoData.result.parsedData?.node! as Fragment$RepositoryData;
      return Scaffold(
          appBar: RepositoryViewAppbar(
              repositoryID: repositoryID, repositoryName: parsedData.name),
          body: RepositoryViewBody(
              repositoryID: repositoryID, repositoryName: parsedData.name));
    } else {
      return const Scaffold(
        body: Text("error"),
      );
      //リポジトリのデータを取得できなかった場合
      //うっすら出るダイアログと一緒にpopする
    }
  }
}

class RepositoryViewAppbar extends StatefulWidget with PreferredSizeWidget {
  const RepositoryViewAppbar(
      {Key? key, required this.repositoryID, required this.repositoryName})
      : super(key: key);
  final String repositoryID;
  final String repositoryName;

  @override
  createState() => _RepositoryViewAppbar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _RepositoryViewAppbar extends State<RepositoryViewAppbar> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = favoriteRepositoryIDs
        .where((element) => element == widget.repositoryID)
        .isNotEmpty;
    void setFavorite() {
      setState(() {
        isFavorite != isFavorite;
      });
      if (isFavorite) {
        favoriteRepositoryIDs
            .removeWhere((element) => element == widget.repositoryID);
      } else {
        favoriteRepositoryIDs.add(widget.repositoryID);
      }
    }

    return AppBar(
      title: Text(widget.repositoryName),
      actions: [
        IconButton(
            onPressed: () {
              setFavorite();
            },
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            color: isFavorite ? Colors.red : Colors.white)
      ],
    );
  }
}

class RepositoryViewBody extends StatefulWidget {
  const RepositoryViewBody(
      {Key? key, required this.repositoryID, required this.repositoryName})
      : super(key: key);
  final String repositoryID;
  final String repositoryName;

  @override
  createState() => _RepositoryViewBody();
}

class _RepositoryViewBody extends State<RepositoryViewBody> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return ListView(
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            child: Text(widget.repositoryName, style: textTheme.headline4)),
        ExpansionTile(
          initiallyExpanded: true,
          title: Text("Collaborator", style: textTheme.headline5),
          children: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: CollaboratorsView(
                  repositoryID: widget.repositoryID,
                )),
          ],
        ),
        const Divider(),
        ExpansionTile(
          title: Text("Readme", style: textTheme.headline5),
          children: [
            MarkDownView(
              repositoryID: widget.repositoryID,
            )
          ],
        )
      ],
    );
  }
}

class MarkDownView extends HookConsumerWidget {
  const MarkDownView({Key? key, required this.repositoryID}) : super(key: key);
  final String repositoryID;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mdData = useQuery$getRepositoryReadmeFromID(
      Options$Query$getRepositoryReadmeFromID(
          fetchPolicy: FetchPolicy.noCache,
          variables:
              Variables$Query$getRepositoryReadmeFromID(id: repositoryID)),
    );

    if (mdData.result.isLoading) {
      return loadingAnimation();
    } else if (mdData.result.hasException) {
      return const Text("exception");
    } else if (mdData.result.parsedData?.node != null) {
      final parsedmdData = mdData.result.parsedData?.node! as Fragment$Readme;
      final mdString = parsedmdData.object as Fragment$ReadmeMDString;
      return MarkdownBody(
          fitContent: false, shrinkWrap: true, data: mdString.text.toString());
    }
    return const Text("null");
  }
}

class CollaboratorsView extends HookConsumerWidget {
  const CollaboratorsView({Key? key, required this.repositoryID})
      : super(key: key);
  final String repositoryID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$getRepositoryCollaboratorFromID(
      Options$Query$getRepositoryCollaboratorFromID(
          fetchPolicy: FetchPolicy.noCache,
          variables: Variables$Query$getRepositoryCollaboratorFromID(
              id: repositoryID)),
    );

    if (qryResult.result.isLoading) {
      return loadingAnimation();
    } else if (qryResult.result.hasException) {
      return const Text("閲覧権限がありません！");
    } else if (qryResult.result.parsedData?.node != null) {
      final repository =
          qryResult.result.parsedData!.node! as Fragment$Collaborator;
      final collaborators = repository.collaborators!.edges!;
      return Wrap(
        spacing: 5,
        children: collaborators
            .map((e) => GestureDetector(
                  onTap: () => launchUrl(Uri.parse(e.node.url)),
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(e!.node.avatarUrl))),
                    ),
                  ),
                ))
            .toList(),
      );
    }
    return const Text("null");
  }
}
