import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/organization_members_view.dart';

import './graphql/searchTeamsInOrganization.graphql.dart';
import './team_repository_view.dart';
import 'favorite_view.dart';
import 'readSettings.dart';

class OrgTeamList extends HookConsumerWidget {
  const OrgTeamList({Key? key, required this.orgName}) : super(key: key);

  final String orgName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = useState(0);
    final screens = [
      _OrgTeamList_screen(
        orgName: orgName,
      ),
      FavoriteRepositories(orgName: orgName)
    ];
    //接続用のclientクラスを作成
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: getGraphQLAuthLink(),
        cache: GraphQLCache(store: HiveStore()),
      ),
    );
    //GraphQLProviderでラップすることで使える
    return GraphQLProvider(
        client: client,
        child: MaterialApp(
          home: Scaffold(
              body: screens[pageState.value],
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'Favorite')
                ],
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.blueAccent,
                currentIndex: pageState.value,
                onTap: (index) {
                  pageState.value = index;
                },
              )),
        ));
  }
}

class _OrgTeamList_screen extends HookConsumerWidget {
  const _OrgTeamList_screen({Key? key, required this.orgName})
      : super(key: key);
  final String orgName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$searchTeamsInOrganization(
      Options$Query$searchTeamsInOrganization(
          variables: Variables$Query$searchTeamsInOrganization(
              orgName: orgName, first: 100)),
    );
    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return const Text("Loading");
    }
    //例外スローした場合
    else if (qryResult.result.hasException) {
      return Text(qryResult.result.exception.toString());
    }
    if (qryResult.result.parsedData?.organization?.teams.edges != null) {
      //nullじゃないことが確定しているので!を使う
      final teams = qryResult.result.parsedData!.organization!.teams.edges!;
      //ListViewでnullを表示させないためにnodeの中のチーム名がnullの場合はリストから除外する（名前なしのチームが作成できるかは要確認）
      teams.removeWhere((element) => element?.node?.name == null);
      final teamsCount = teams.length;

      return Scaffold(
          appBar: AppBar(
            title: const Text("Repository Viewer"),
            actions: [
              IconButton(
                  onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OrgMemberList(orgName: orgName),
                        ),
                      ),
                  icon: const Icon(Icons.groups))
            ],
          ),
          body: ListView.builder(
              itemCount: teamsCount,
              itemBuilder: (context, index) {
                final TextTheme textTheme = Theme.of(context).textTheme;
                final team = teams[index]!.node!;
                return Card(
                    child: ListTile(
                  title: Text(
                    team.name,
                    style: textTheme.headline5,
                  ),
                  subtitle: Text(team.description ?? "no description"),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TeamRepositoryList(
                        teamName: team.name,
                        orgName: orgName,
                      ),
                    ),
                  ),
                ));
              }));
    }
    return const Text("no Teams in this Organization");
  }
}
