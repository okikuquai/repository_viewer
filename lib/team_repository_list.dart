import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import './repository_view.dart';
import './graphql/searchRepositoriesInTeam.graphql.dart';

class TeamRepositoryList extends HookConsumerWidget {
  const TeamRepositoryList({Key? key, required this.teamName})
      : super(key: key);
  final String teamName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$searchRepositoriesInTeam(
      Options$Query$searchRepositoriesInTeam(
          variables: Variables$Query$searchRepositoriesInTeam(orgName: "nml-nakameguro", first: 100, TeamName: teamName)
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

    if (qryResult.result.parsedData?.organization?.team?.repositories.edges != null){
      //nullじゃないことが確定しているので!を使う
      final repositories = qryResult.result.parsedData!.organization!.team!.repositories.edges!;
      final teamsCount = repositories.length;

      return Scaffold(
          appBar: AppBar(
            title: Text(teamName),
            actions: [
              IconButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TeamRepositoryList(teamName: teamName),
                    ),
                  ),
                  icon: const Icon(Icons.groups)
              )
            ],
          ),
          body: ListView.builder(
            itemCount: teamsCount,
            itemBuilder: (context, index) {
              final TextTheme textTheme = Theme.of(context).textTheme;
              final repository = repositories[index]!.node;
              return Card(
                child: ListTile(
                  title: Text(
                    repository.name,
                    style: textTheme.headline5,
                  ),
                  subtitle: Text(repository.description ?? "no description"),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RepositoryView(repositoryName: repository.name),
                    ),
                  ),
                )
              );
            }
          ),
      );
    }
    else{
      return const Text("no Teams in this Organization");
    }
  }
}