import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/restapi/contributer.dart';
import 'package:repositoryviewer/user_view.dart';

import './graphql/getRepositoryInfoFromID.graphql.dart';
import './graphql/getRepositoryReadmeFromID.graphql.dart';
import 'favorite_heart_button.dart';
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
      //loading時はappbarがないのでここでつける
      return loadingAnimationWithAppbar();
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

class RepositoryViewAppbar extends StatelessWidget with PreferredSizeWidget {
  const RepositoryViewAppbar(
      {Key? key, required this.repositoryID, required this.repositoryName})
      : super(key: key);
  final String repositoryID;
  final String repositoryName;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(repositoryName),
      actions: [
        StarredButton(id: repositoryID),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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
          title: Text("Contributors", style: textTheme.headline5),
          children: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ContributorsView(
                  repositoryName: widget.repositoryName,
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
      if (parsedmdData.object != null) {
        final mdString = parsedmdData.object as Fragment$ReadmeMDString;
        return MarkdownBody(
            fitContent: false,
            shrinkWrap: true,
            data: mdString.text ?? "表示できません");
      }
      return const Text("表示できません");
    }
    return const Text("表示できません");
  }
}

class ContributorsView extends StatelessWidget {
  const ContributorsView({Key? key, required this.repositoryName})
      : super(key: key);
  final String repositoryName;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getContributor(repositoryName),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Wrap(
              spacing: 5,
              children: snapshot.data!
                  .map((e) => GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                UserView(userID: e['node_id']),
                          ),
                        ),
                        child: SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(e['avatar_url']))),
                          ),
                        ),
                      ))
                  .toList(),
            );
          }
          return loadingAnimation();
        });
  }
}
