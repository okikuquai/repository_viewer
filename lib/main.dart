import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/starred_repositories.dart';

import 'toppage_view.dart';

void main() async {
  //終了を待たないとHive.Openbox()を呼ぶ前にMyAppの方でクエリを呼び出してしまうのでawaitをつける
  await initHiveForFlutter();
  await FavoriteRepositories.load();
  runApp(const ProviderScope(child: TopPage()));
}
