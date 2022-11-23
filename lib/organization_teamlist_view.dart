import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:graphql_flutter/graphql_flutter.dart';
// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/organization_members_view.dart';

import './graphql/searchTeamsInOrganization.graphql.dart';
import './team_repository_view.dart';

class OrgTeamList extends StatelessWidget {
  const OrgTeamList({super.key});

  //JsonファイルからTokenを取得
  Future<String> getTokenFromJson() async {
    String loadData =
        await rootBundle.loadString('assets/secret_settings.json');
    final jsonResponse = json.decode(loadData);
    return jsonResponse["Token"] ?? "";
  }

  Future<String> getOrganizationNameFromJson() async {
    String loadData =
        await rootBundle.loadString('assets/secret_settings.json');
    final jsonResponse = json.decode(loadData);
    return jsonResponse["OrganizationName"] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    //エンドポイント
    final HttpLink httpLink = HttpLink(
      'https://api.github.com/graphql',
    );

    //token (githubから取得)
    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer ${await getTokenFromJson()}',
    );

    final Link link = authLink.concat(httpLink);

    //接続用のclientクラスを作成
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(store: HiveStore()),
      ),
    );
    //GraphQLProviderでラップすることで使える
    return GraphQLProvider(
      client: client,
      child: const MaterialApp(
        home: MainPage(orgName: "nml-nakameguro"),
      ),
    );
  }
}

//HookConsumerWidgetを継承
//クラス名が”MainPage”なのはおかしいので変更する
class MainPage extends HookConsumerWidget {
  const MainPage({Key? key, required this.orgName}) : super(key: key);
  final String orgName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        body: _body(context));
  }

  Widget _body(BuildContext context) {
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

      return ListView.builder(
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
          });
    }

    return const Text("no Teams in this Organization");
  }
}
