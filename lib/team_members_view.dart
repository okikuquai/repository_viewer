import 'package:flutter/material.dart';
import './graphql/searchMemberInTeam.graphql.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TeamMemberList extends HookConsumerWidget {
  const TeamMemberList(
      {Key? key, required this.teamName, required this.orgName})
      : super(key: key);
  final String orgName;
  final String teamName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$teamName Members'),
        ),
        body: _body(context));
  }

  Widget _body(BuildContext context) {
    final qryResult = useQuery$searchMemberInTeam(
      Options$Query$searchMemberInTeam(
          variables: Variables$Query$searchMemberInTeam(
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

    if (qryResult.result.parsedData?.organization?.team?.members.edges !=
        null) {
      final members =
          qryResult.result.parsedData!.organization!.team!.members.edges!;
      members.removeWhere((element) => element?.node == null);

      final membersCount = members.length;
      return ListView.builder(
          itemCount: membersCount,
          itemBuilder: (context, index) {
            final TextTheme textTheme = Theme.of(context).textTheme;
            final member = members[index]!.node;
            return Card(
                child: ListTile(
              title: Text(
                member.name ?? "no name",
                style: textTheme.headline5,
              ),
              subtitle: Text(member.bio ?? "no description"),
            ));
          });
    } else {
      return const Text("This Team has no members");
    }
  }
}
