import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:graphql/client.dart';

//JsonファイルからTokenを取得
Future<String> getTokenFromJson() async {
  String loadData = await rootBundle.loadString('assets/secret_settings.json');
  final jsonResponse = json.decode(loadData);
  return jsonResponse["Token"] ?? "";
}

Future<String> getOrganizationNameFromJson() async {
  String loadData = await rootBundle.loadString('assets/secret_settings.json');
  final jsonResponse = json.decode(loadData);
  return jsonResponse["OrganizationName"] ?? "";
}

Link getGraphQLAuthLink() {
  //エンドポイント
  final HttpLink httpLink = HttpLink(
    'https://api.github.com/graphql',
  );

  //token (githubから取得)
  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer ${await getTokenFromJson()}',
  );
  return authLink.concat(httpLink);
}
