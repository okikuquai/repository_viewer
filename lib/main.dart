import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import './organization_teamlist_view.dart';

void main() async{
  //終了を待たないとHive.Openbox()を呼ぶ前にMyAppの方でクエリを呼び出してしまうのでawaitをつける
  await initHiveForFlutter();
  runApp(const OrgTeamList());
}

