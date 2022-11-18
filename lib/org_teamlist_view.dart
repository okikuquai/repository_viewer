import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import './team_repository_list.dart';
import './graphql/organization.graphql.dart';
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
    final qryresult = useQuery$ReadOrgRepositories(
      Options$Query$ReadOrgRepositories(variables: Variables$Query$ReadOrgRepositories(orgName: "nml-nakameguro")),
    );
    if (qryresult.result.isLoading) {
      return Text("Loading");
    }
    else if (qryresult.result.hasException) {
      return Text(qryresult.result.exception.toString());
    }

    final teams = qryresult.result.parsedData?.organization?.teams.edges;
    final teamsCount = teams?.length;

    return ListView.builder(
        itemCount: teamsCount,
        itemBuilder: (context, index) {
          final TextTheme textTheme = Theme.of(context).textTheme;
          final team = teams?[index];
          return Card(
              child: ListTile(
                title: Text(
                  team?.node?.name ?? "no team name",
                  style: textTheme.headline5,
                ),
                subtitle: Text(team?.node?.description ?? "no description"),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TeamRepositoryList(teamrepositories: team!.node!),
                  ),
                ),
              )
          );
        }
    );

  }
}