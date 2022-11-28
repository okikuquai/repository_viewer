import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/repository_view.dart';
import 'package:repositoryviewer/team_members_view.dart';

import './graphql/searchRepositoriesInTeam.graphql.dart';
import 'loadingAnimation.dart';
import 'starred_repositories.dart';

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
      body: _body(context, ref),
    );
  }

  Widget _body(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$searchRepositoriesInTeam(
      Options$Query$searchRepositoriesInTeam(
          variables: Variables$Query$searchRepositoriesInTeam(
              orgName: orgName, first: 100, TeamName: teamName)),
    );

    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return loadingAnimation();
    }
    //例外スローした場合
    else if (qryResult.result.hasException) {
      return Text(qryResult.result.exception.toString());
    }

    if (qryResult.result.parsedData?.organization?.team?.repositories.edges !=
        null) {
      //ハートの状態を変えるためにStatefulWidgetでリポジトリのリストを表示させる
      return FavoriteCardList(
          qryResult: qryResult, orgName: orgName, teamName: teamName);
    }
    return const Text("no Teams in this Organization");
  }
}

class FavoriteCardList extends StatefulWidget {
  const FavoriteCardList(
      {Key? key,
      required this.qryResult,
      required this.orgName,
      required this.teamName})
      : super(key: key);
  final QueryHookResult<Query$searchRepositoriesInTeam> qryResult;
  final String orgName;
  final String teamName;

  @override
  createState() => _FavoriteCardList();
}

class _FavoriteCardList extends State<FavoriteCardList> {
  @override
  Widget build(BuildContext context) {
    //nullじゃないことが確定しているので!を使う
    final repositories = widget
        .qryResult.result.parsedData!.organization!.team!.repositories.edges!;
    final repositoriesCount = repositories.length;
    var isFavorite = List.generate(
        repositoriesCount,
        (index) => starredRepository
            .where((element) => element.name == repositories[index]!.node.name)
            .isNotEmpty);

    void setFavorite(int index) {
      setState(() {
        isFavorite[index] != isFavorite[index];
      });
    }

    return ListView.builder(
        itemCount: repositoriesCount,
        itemBuilder: (context, index) {
          final TextTheme textTheme = Theme.of(context).textTheme;
          final repository = repositories[index]!.node;
          return Card(
            child: ListTile(
              trailing: GestureDetector(
                child: Icon(isFavorite[index] ? Icons.star : Icons.star_border,
                    color: isFavorite[index] ? Colors.yellow : null),
                onTap: () {
                  setFavorite(index);
                  if (isFavorite[index]) {
                    starredRepository.removeWhere(
                        (element) => element.name == repository.name);
                  } else {
                    starredRepository.add(repository);
                  }
                },
              ),
              title: Text(
                repository.name,
                style: textTheme.headline5,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                repository.description ?? "no description",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RepositoryView(
                      repository: repository, orgName: widget.orgName),
                ),
              ),
            ),
          );
        });
  }
}
