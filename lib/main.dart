import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'toppage_view.dart';

void main(List<String> arguments) async {
  //終了を待たないとHive.Openbox()を呼ぶ前にMyAppの方でクエリを呼び出してしまうのでawaitをつける
  await initHiveForFlutter();
  runApp(const ProviderScope(child: TopPageView()));
}
