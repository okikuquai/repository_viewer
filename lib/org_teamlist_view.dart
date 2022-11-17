import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import './query.dart' show readOrgRepositories;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import './team_repository_list.dart';

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
      //getToken: () async => 'Bearer ${await getTokenFromJson()}',
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

    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Repository View'),
        ),
        //GraphQLProviderでラップすることで使える
        body: GraphQLProvider(
          client: client,
          child: const MainPage(),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget{
  const MainPage({Key? key}) : super(key: key);

  Widget _repositoryListView(QueryResult result){
    List? repositories = result.data?['organization']?['teams']?['edges'];
    //受信データがnull
    if (repositories == null) {
      return const Text('No repositories');
    }

    return ListView.builder(
        itemCount: repositories.length,
        itemBuilder: (context, index) {
          final TextTheme textTheme = Theme.of(context).textTheme;
          final repository = repositories[index];
          return Card(
            child: ListTile(
              title: Text(
                repository['node']['name'] ?? "no name",
                style: textTheme.headline5,
              ),
              subtitle: Text(repository['node']["description"] ?? "no description"),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => TeamRepositoryList(repositorynode: repository['node']),
                ),
              ),
            )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    const String orgName = "nml-nakameguro";
    final QueryOptions options = QueryOptions(
      document: gql(readOrgRepositories),
      variables: const <String, dynamic>{
        // 'nRepositories': nRepositories,
        'orgName': orgName
      },
    );
    //クエリ結果をListViewにしてReturn
    return Query(
      options: options,
      builder: (QueryResult result, { VoidCallback? refetch, FetchMore? fetchMore }) {
        //例外処理
        if (result.hasException) {
          return Text(result.exception.toString());
        }
        //取得中
        if (result.isLoading) {
          return const Text('Loading');
        }
        return _repositoryListView(result);
      },
    );
  }
}