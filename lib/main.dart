import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/starred_repositories.dart';

import 'organization_teamlist_view.dart';

void main() async {
  //終了を待たないとHive.Openbox()を呼ぶ前にMyAppの方でクエリを呼び出してしまうのでawaitをつける
  await initHiveForFlutter();
  await FavoriteRepositories.load();
  runApp(const AppEntry());
}

//disposeの検知用
class AppEntry extends StatefulWidget {
  const AppEntry({super.key});

  @override
  State<StatefulWidget> createState() => _AppEntry();
}

class _AppEntry extends State<AppEntry> {
  @override
  Widget build(BuildContext context) {
    //   return FutureBuilder(
    //       future: githubSetting.organization,
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           return ProviderScope(child: OrgTeamList(orgName: snapshot.data!));
    //         } else {
    //           return loadingAnimation();
    //         }
    //       });
    // }

    return const ProviderScope(child: OrgTeamList());
  }
}
