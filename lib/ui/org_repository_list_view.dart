import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/provider/github_account_setting_provider.dart';

import 'module/git_repository_card_view.dart';
import 'org_members_list_view.dart';
import '../graphql/get_repository_list_from_organization.graphql.dart';


class OrganizationRepositoryListView extends HookConsumerWidget {
  const OrganizationRepositoryListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ghOrganizationProvider = ref.watch(githubOrganizationProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text(ghOrganizationProvider),
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => OrgMemberListView(
                          orgName: ghOrganizationProvider,
                        ),
                      ),
                    ),
                icon: const Icon(Icons.groups))
          ],
        ),
        body: OrganizationRepositoryBody(
          orgName: ghOrganizationProvider,
        ));
  }
}

class OrganizationRepositoryBody extends HookConsumerWidget {
  const OrganizationRepositoryBody({super.key, required this.orgName});

  final String orgName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$getRepositoryListFromOrganization(
        Options$Query$getRepositoryListFromOrganization(
            variables: Variables$Query$getRepositoryListFromOrganization(
                orgName: orgName, first: 15)));

    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      // return loadingAnimation()
      // ;
      //例外スローした場合
    } else if (qryResult.result.hasException) {
      return Text(qryResult.result.exception.toString());
    }
    if (qryResult.result.parsedData?.organization?.repositories.edges != null) {
      //ハートの状態を変えるためにStatefulWidgetでリポジトリのリストを表示させる
      return OrganizationRepositoryCardList(
          qryResult: qryResult, orgName: orgName);
    }
    return const Text('no Teams in this Organization');
  }
}

class OrganizationRepositoryCardList extends HookConsumerWidget {
  const OrganizationRepositoryCardList(
      {Key? key, required this.qryResult, required this.orgName})
      : super(key: key);
  final QueryHookResult<Query$getRepositoryListFromOrganization> qryResult;
  final String orgName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //nullじゃないことが確定しているので!を使う
    final repositories =
        qryResult.result.parsedData!.organization!.repositories.edges!;
    final pageInfo =
        qryResult.result.parsedData!.organization!.repositories.pageInfo;
    final repositoriesCount = repositories.length;

    return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            final before = scrollNotification.metrics.extentBefore;
            final max = scrollNotification.metrics.maxScrollExtent;
            //下端に移動しきったか
            if (before == max) {
              //取得したコンテンツが最後のコンテンツではないか
              if (!pageInfo.hasNextPage) return false;
              //さらにリポジトリを取得
              qryResult.fetchMore(
                  FetchMoreOptions$Query$getRepositoryListFromOrganization(
                      variables:
                          Variables$Query$getRepositoryListFromOrganization(
                              orgName: orgName,
                              first: 15,
                              after: pageInfo.endCursor),
                      updateQuery: (previousResultData, fetchMoreResultData) {
                        final List<dynamic> items = <dynamic>[
                          ...previousResultData?['organization']['repositories']
                                  ['edges'] as List<dynamic>? ??
                              <dynamic>[],
                          ...fetchMoreResultData?['organization']
                                  ['repositories']['edges'] as List<dynamic>? ??
                              <dynamic>[],
                        ];
                        fetchMoreResultData?['organization']['repositories']
                            ['edges'] = items;
                        return fetchMoreResultData;
                      }));
            }
            return true;
          }
          return false;
        },
        child: ListView.builder(
            itemCount: repositoriesCount,
            itemBuilder: (context, index) {
              final repository = repositories[index]!.node!;
              return GitRepositoryCardView(
                  id: repository.id,
                  title: repository.name,
                  description: repository.description ?? 'No Description');
            }));
  }
}