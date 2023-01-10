import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GithubSetting {
  static const String _saveKey_token = "githubtoken";
  static const String _saveKey_organization = "githuborganization";

  static Future<String> get token async {
    var val = await _load(_saveKey_token);
    if (val == null) {
      return getTokenFromJson();
    }
    return val;
  }

  static setToken(String tokenval) {
    _save(_saveKey_token, tokenval);
    updateToken();
  }

  static Future<String> get organization async {
    var val = await _load(_saveKey_organization);
    if (val == null) {
      return "nml-nakameguro";
    }
    return val;
  }

  static setOrganization(String orgval) {
    _save(_saveKey_organization, orgval);
  }

  /// save list from prefs
  static Future<void> _save(String key, String saveString) async {
    //重複を削除
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, saveString);
  }

  /// load list from prefs
  static Future<String?> _load(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    defaultPolicies: DefaultPolicies(
      watchMutation: Policies(
        fetch: FetchPolicy.cacheOnly,
        error: ErrorPolicy.none,
        cacheReread: CacheRereadPolicy.ignoreAll,
      ),
    ),
    link: getGraphQLAuthLink(),
    cache: GraphQLCache(store: HiveStore()),
  ),
);

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
    getToken: () async => 'Bearer ${await GithubSetting.token}',
  );
  return authLink.concat(httpLink);
}

Future<void> updateToken() async {
  client.value = GraphQLClient(
    defaultPolicies: DefaultPolicies(
      watchMutation: Policies(
        fetch: FetchPolicy.cacheOnly,
        error: ErrorPolicy.none,
        cacheReread: CacheRereadPolicy.ignoreAll,
      ),
    ),
    link: getGraphQLAuthLink(),
    cache: GraphQLCache(store: HiveStore()),
  );
}
