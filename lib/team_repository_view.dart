import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/team_members_view.dart';

import './graphql/searchRepositoriesInTeam.graphql.dart';
import './repository_view.dart';

class TeamRepositoryList extends HookConsumerWidget {
  const TeamRepositoryList(
      {Key? key, required this.teamName, required this.orgName})
      : super(key: key);
  final String teamName;
  final String orgName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(teamName),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TeamMemberList(
                        teamName: teamName,
                        orgName: orgName,
                      ),
                    ),
                  ),
              icon: const Icon(Icons.groups))
        ],
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    final qryResult = useQuery$searchRepositoriesInTeam(
      Options$Query$searchRepositoriesInTeam(
          variables: Variables$Query$searchRepositoriesInTeam(
              orgName: orgName, first: 100, TeamName: teamName)),
    );

    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return const Text("Loading");
    }
    //例外スローした場合
    else if (qryResult.result.hasException) {
      return Text(qryResult.result.exception.toString());
    }

    if (qryResult.result.parsedData?.organization?.team?.repositories.edges !=
        null) {
      //nullじゃないことが確定しているので!を使う
      final repositories =
          qryResult.result.parsedData!.organization!.team!.repositories.edges!;
      final teamsCount = repositories.length;

      return ListView.builder(
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
                  builder: (context) => RepositoryView(
                      repositoryName: repository.name,
                      orgName: orgName,
                      teamName: teamName),
                ),
              ),
            ));
          });
    }
    return const Text("no Teams in this Organization");
  }
}
