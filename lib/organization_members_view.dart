import 'package:flutter/material.dart';
// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import './graphql/searchMemberInOrganization.graphql.dart';

class OrgMemberList extends HookConsumerWidget {
  const OrgMemberList({Key? key, required this.orgName}) : super(key: key);
  final String orgName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$orgName Members'),
        ),
        body: _body(context));
  }

  Widget _body(BuildContext context) {
    final qryResult = useQuery$searchMemberInOrganization(
      Options$Query$searchMemberInOrganization(
          variables: Variables$Query$searchMemberInOrganization(
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

    if (qryResult.result.parsedData?.organization?.membersWithRole.edges !=
        null) {
      final members =
          qryResult.result.parsedData!.organization!.membersWithRole.edges!;
      members.removeWhere((element) => element?.node == null);

      final membersCount = members.length;
      return ListView.builder(
          itemCount: membersCount,
          itemBuilder: (context, index) {
            final TextTheme textTheme = Theme.of(context).textTheme;
            final member = members[index]!.node!;
            return GestureDetector(
              onTap: () => launchUrl(Uri.parse(member.url)),
              child: Card(
                child: Row(
                  children: [
                    SizedBox(
                      height: 80.0,
                      width: 80.0,
                      child: Image.network(
                        member.avatarUrl,
                        fit: BoxFit.cover,
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
                            ),
                            Text(member.login,
                                style: textTheme.labelLarge!
                                    .apply(color: Colors.black45)),
                            const SizedBox(height: 10.0),
                            Text(member.bio ?? ""),
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
    return const Text("This Organization has no members");
  }
}
