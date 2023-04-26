import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/graphql/get_repository_info_from_multiple_ids.graphql.dart';
import 'package:repositoryviewer/restapi/get_contributor.dart';
import 'package:repositoryviewer/type/error_type.dart';
import 'package:repositoryviewer/ui/exception_message_view.dart';
import 'package:repositoryviewer/ui/module/graphql_linkexception.dart';
import 'package:repositoryviewer/ui/user_info_view.dart';

import '../graphql/get_repository_readme_from_id.graphql.dart';
import '../graphql/repository_data.graphql.dart';
import '../provider/github_account_setting_provider.dart';
import '../type/github_node_id_type.dart';
import 'module/http_response_error.dart';
import 'module/list_card_right_icon_button.dart';
import 'module/loading_animation.dart';

class GitRepositoryInfoView extends HookConsumerWidget {
  const GitRepositoryInfoView({Key? key, required this.repositoryId})
      : super(key: key);
  final GithubNodeId repositoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$getRepositoryInfoFromMultipleIds(
      Options$Query$getRepositoryInfoFromMultipleIds(
          variables: Variables$Query$getRepositoryInfoFromMultipleIds(
              ids: [repositoryId])),
    );
    if (qryResult.result.isLoading) {
      //loading時はappbarがないのでここでつける
      return const LoadingAnimationWithAppbar();
    } else if (qryResult.result.hasException) {
      return GraphQLLinkException(
          exception: qryResult.result.exception?.linkException);
    }

    final repositoryData = qryResult.result.parsedData?.nodes.firstOrNull
    as Fragment$RepositoryData?;
    if (repositoryData != null) {
      return Scaffold(
          appBar: AppBar(
            title: Text(repositoryData.name),
            actions: [
              ToggleableIconButton(id: repositoryId),
            ],
          ),
          body: RepositoryViewBody(
              repositoryId: repositoryId, repositoryName: repositoryData.name));
    } else {
      return const ExceptionMessageView(errorType: ErrorType.empty);
    }
  }
}

class RepositoryViewBody extends HookConsumerWidget {
  const RepositoryViewBody(
      {Key? key, required this.repositoryId, required this.repositoryName})
      : super(key: key);
  final GithubNodeId repositoryId;
  final String repositoryName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme
        .of(context)
        .textTheme;

    return ListView(
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            child: Text(repositoryName, style: textTheme.headlineMedium)),
        ExpansionTile(
          initiallyExpanded: true,
          title: Text('Contributors', style: textTheme.headlineSmall),
          children: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ContributorsView(
                  repositoryName: repositoryName,
                )),
          ],
        ),
        const Divider(),
        ExpansionTile(
          title: Text('Readme', style: textTheme.headlineSmall),
          children: [
            MarkDownView(
              repositoryId: repositoryId,
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
    }
    final mdString = (mdData.result.parsedData?.node as Fragment$Readme?)
        ?.object as Fragment$ReadmeMDString?;
    return MarkdownBody(
        fitContent: false, shrinkWrap: true, data: mdString?.text ?? '表示できません');
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

    try {
      useMemoized(() =>
          getContributor(
              repositoryName, ghTokenProvider, ghOrganizationProvider));
      final contributorsData = useFuture(useMemoized(() =>
          getContributor(
              repositoryName, ghTokenProvider, ghOrganizationProvider)));
      if (!contributorsData.hasData) {
        return const LoadingAnimation();
      } else if (contributorsData.hasError) {
        //contributorの取得の例外がここにこない(ドキュメントみる感じここで引っかかるはず)
        return const ExceptionMessageView(errorType: ErrorType.internalError);
      }

      return Wrap(
        spacing: 5,
        children: contributorsData.data
            ?.map((e) =>
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).push(
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
                          image: NetworkImage(e.avatarUri.toString()))),
                ),
              ),
            ))
            .toList() ??
            [Container()],
      );
    } on HttpLinkServerException catch (e) {
      //contributorの取得の例外がここにこない（useFutureの動き的にここに入らない気もするけど...）
      return HttpResponseError(
          httpResponse: e);
    }
  }
}
