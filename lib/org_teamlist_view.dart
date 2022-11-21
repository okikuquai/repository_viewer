import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import './graphql/searchTeamsInOrganization.graphql.dart';
import 'dart:convert';
import './team_repository_list.dart';
// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrgTeamList extends StatelessWidget {
  const OrgTeamList({super.key});

  //JsonファイルからTokenを取得
  Future<String> getTokenFromJson() async {
    String loadData = await rootBundle.loadString('assets/secret_token.json');
    final jsonResponse = json.decode(loadData);
    return jsonResponse["Token"] ?? "";
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
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Repository View'),
              actions: [
                IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.groups)
                )
              ],
            ),
            body: const MainPage(),
          ),
        ),
    );
  }
}
//HookConsumerWidgetを継承
class MainPage extends HookConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final qryResult = useQuery$searchTeamsInOrganization(
      Options$Query$searchTeamsInOrganization(
          variables: Variables$Query$searchTeamsInOrganization(orgName: "nml-nakameguro", first: 15)
      ),
    );
    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return const Text("Loading");
    }
    //例外スローした場合
    else if (qryResult.result.hasException) {
      return Text(qryResult.result.exception.toString());
    }

    if (qryResult.result.parsedData?.organization?.teams.edges != null){
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
                      builder: (context) => TeamRepositoryList(teamName: team.name),
                    ),
                  ),
                )
            );
          }
      );
    }
    else{
      return const Text("no Teams in this Organization");
    }


  }
}