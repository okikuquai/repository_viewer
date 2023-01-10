import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GithubSetting {
  GithubSetting({this.initialToken, this.initialOrganization}) {
    loadToken();
    if (initialToken != null) {
      _token = initialToken!;
    }
  }
  static const String saveKeyToken = "githubtoken";
  static const String saveKeyOrganization = "githuborganization";

  final String? initialToken;
  final String? initialOrganization;
  String _token = "";

  Future<String> loadToken() async {
    var env = const String.fromEnvironment('Github_DefaultToken');
    if (env != "") {
      _token = env;
      return _token;
    }
    var local = await _load(saveKeyToken);
    if (local != null) {
      _token = local;
      return _token;
    }
    return "";
  }

  setToken(String tokenval) {
    _save(saveKeyToken, tokenval);
    updateToken(tokenval);
  }

  Future<String> loadOrganization() async {
    var val = await _load(saveKeyOrganization);
    if (val == null) {
      return "nml-nakameguro";
    }
    return val;
  }

  setOrganization(String orgval) {
    _save(saveKeyOrganization, orgval);
  }

  /// save list from prefs
  Future<void> _save(String key, String saveString) async {
    //重複を削除
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, saveString);
  }

  /// load list from prefs
  Future<String?> _load(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}

Link getGraphQLAuthLink(String token) {
  //エンドポイント
  final HttpLink httpLink = HttpLink(
    'https://api.github.com/graphql',
  );

  //token (githubから取得)
  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer ${token}',
  );
  return authLink.concat(httpLink);
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
    link:
        getGraphQLAuthLink(const String.fromEnvironment('Github_DefaultToken')),
    cache: GraphQLCache(store: HiveStore()),
  ),
);

Future<void> updateToken(String token) async {
  client.value = GraphQLClient(
    defaultPolicies: DefaultPolicies(
      watchMutation: Policies(
        fetch: FetchPolicy.cacheOnly,
        error: ErrorPolicy.none,
        cacheReread: CacheRereadPolicy.ignoreAll,
      ),
    ),
    link: getGraphQLAuthLink(token),
    cache: GraphQLCache(store: HiveStore()),
  );
}
