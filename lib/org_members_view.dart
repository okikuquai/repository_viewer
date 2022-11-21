import 'package:flutter/material.dart';
import './graphql/searchMemberInOrganization.graphql.dart';
// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrgMemberList extends HookConsumerWidget {
  const OrgMemberList({Key? key, required this.orgName}) : super(key: key);
  final String orgName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$searchMemberInOrganization(
      Options$Query$searchMemberInOrganization(
          variables: Variables$Query$searchMemberInOrganization(
              orgName: "nml-nakameguro", first: 100)
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

    if (qryResult.result.parsedData?.organization?.membersWithRole.edges != null){
      final members = qryResult.result.parsedData!.organization!.membersWithRole.edges!;
      members.removeWhere((element) => element?.node == null);

      final membersCount = members.length;
      return Scaffold(
        appBar: AppBar(
          title: Text('$orgName Members'),
        ),
        body: ListView.builder(
            itemCount: membersCount,
            itemBuilder: (context, index) {
              final TextTheme textTheme = Theme
                  .of(context)
                  .textTheme;
              final member = members[index]!.node!;
              return Card(
                  child: ListTile(
                    title: Text(
                      member.name ?? "no name",
                      style: textTheme.headline5,
                    ),
                    subtitle: Text(member.bio ?? "no description"),
                  )
              );
            }
        ),
      );
    }
    else {
      return const Text("This Organizatino has no members");
    }
  }
}