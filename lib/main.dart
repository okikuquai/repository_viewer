import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/client.dart';
import 'package:repositoryviewer/starred_repositories.dart';

import 'toppage_view.dart';

void main(List<String> arguments) async {
  GithubSetting.setToken(const String.fromEnvironment('Github_DefaultToken'));
  GithubSetting.setOrganization(
      const String.fromEnvironment('Github_DefaultOrganization'));

  //終了を待たないとHive.Openbox()を呼ぶ前にMyAppの方でクエリを呼び出してしまうのでawaitをつける
  await initHiveForFlutter();
  await FavoriteRepositories.load();
  runApp(const ProviderScope(child: TopPage()));
}
