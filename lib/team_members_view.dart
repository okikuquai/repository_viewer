import 'package:flutter/material.dart';
// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/user_view.dart';

import './graphql/searchMemberInTeam.graphql.dart';
import 'loadingAnimation.dart';

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
      return loadingAnimation();
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
            return GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UserView(userID: member.id),
                ),
              ),
              child: Card(
                child: Row(
                  children: [
                    SizedBox(
                      height: 80.0,
                      width: 80.0,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(member.avatarUrl))),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              member.name ?? "",
                              style: textTheme.headline6,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              member.login,
                              style: textTheme.labelLarge!
                                  .apply(color: Colors.black45),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              member.bio ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }
    return const Text("This Team has no members");
  }
}
