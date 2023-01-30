import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/restapi/get_contributer.dart';
import 'package:repositoryviewer/ui/user_info_view.dart';

import '../graphql/get_repository_info_from_id.graphql.dart';
import '../graphql/get_repository_readme_from_id.graphql.dart';
import '../graphql/repository_data.graphql.dart';
import 'module/list_card_right_icon_button.dart';
import '../provider/github_account_setting_provider.dart';
import '../type/github_node_id_type.dart';
import 'module/loading_animation.dart';

class GitRepositoryInfoView extends HookConsumerWidget {
  const GitRepositoryInfoView({Key? key, required this.repositoryId})
      : super(key: key);
  final GithubNodeId repositoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repoData = useQuery$getRepositoryInfoFromId(
      Options$Query$getRepositoryInfoFromId(
          variables: Variables$Query$getRepositoryInfoFromId(id: repositoryId)),
    );
    if (repoData.result.isLoading) {
      //loading時はappbarがないのでここでつける
      return const LoadingAnimationWithAppbar();
    } else if (repoData.result.hasException) {}

    if (repoData.result.parsedData != null) {
      final parsedData =
          repoData.result.parsedData?.node! as Fragment$RepositoryData;
      return Scaffold(
          appBar: RepositoryViewAppbar(
              repositoryId: repositoryId, repositoryName: parsedData.name),
          body: RepositoryViewBody(
              repositoryId: repositoryId, repositoryName: parsedData.name));
    } else {
      return const Scaffold(
        body: Text('error'),
      );
      //リポジトリのデータを取得できなかった場合
      //うっすら出るダイアログと一緒にpopする
    }
  }
}

class RepositoryViewAppbar extends StatelessWidget with PreferredSizeWidget {
  const RepositoryViewAppbar(
      {Key? key, required this.repositoryId, required this.repositoryName})
      : super(key: key);
  final GithubNodeId repositoryId;
  final String repositoryName;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(repositoryName),
      actions: [
        ListCardRightIconButton(id: repositoryId),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class RepositoryViewBody extends StatefulWidget {
  const RepositoryViewBody(
      {Key? key, required this.repositoryId, required this.repositoryName})
      : super(key: key);
  final GithubNodeId repositoryId;
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
          title: Text('Contributors', style: textTheme.headline5),
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
          title: Text('Readme', style: textTheme.headline5),
          children: [
            MarkDownView(
              repositoryId: widget.repositoryId,
            )
          ],
        )
      ],
    );
  }
}

class MarkDownView extends HookConsumerWidget {
  const MarkDownView({Key? key, required this.repositoryId}) : super(key: key);
  final GithubNodeId repositoryId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mdData = useQuery$getRepositoryReadmeFromId(
      Options$Query$getRepositoryReadmeFromId(
          fetchPolicy: FetchPolicy.noCache,
          variables:
              Variables$Query$getRepositoryReadmeFromId(id: repositoryId)),
    );

    if (mdData.result.isLoading) {
      return const LoadingAnimation();
    } else if (mdData.result.hasException) {
      return const Text('exception');
    } else if (mdData.result.parsedData?.node != null) {
      final parsedmdData = mdData.result.parsedData?.node! as Fragment$Readme;
      if (parsedmdData.object != null) {
        final mdString = parsedmdData.object as Fragment$ReadmeMDString;
        return MarkdownBody(
            fitContent: false,
            shrinkWrap: true,
            data: mdString.text ?? '表示できません');
      }
      return const Text('表示できません');
    }
    return const Text('表示できません');
  }
}

class ContributorsView extends HookConsumerWidget {
  const ContributorsView({Key? key, required this.repositoryName})
      : super(key: key);
  final String repositoryName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ghTokenProvider = ref.read(githubTokenProvider);
    final ghOrganizationProvider = ref.read(githubOrganizationProvider);

    return FutureBuilder(
        future: getContributor(
            repositoryName, ghTokenProvider, ghOrganizationProvider),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Wrap(
              spacing: 5,
              children: snapshot.data!
                  .map((e) => GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UserInfoView(userId: e.nodeId),
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
                                    image:
                                        NetworkImage(e.avatarUri.toString()))),
                          ),
                        ),
                      ))
                  .toList(),
            );
          }
          return const LoadingAnimation();
        });
  }
}
