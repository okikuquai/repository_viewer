import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

//String.fromEnviromentはconstにしないと正しく読み取らない
final githubTokenProvider = StateNotifierProvider<GithubSetting, String>(
  (ref) => GithubSetting(
      defaultValue: const String.fromEnvironment('Github_DefaultToken'),
      key: 'Github_DefaultToken'),
);

final githubOrganizationProvider = StateNotifierProvider<GithubSetting, String>(
  (ref) => GithubSetting(
      defaultValue: const String.fromEnvironment('Github_DefaultOrganization'),
      key: 'Github_DefaultOrganization'),
);

class GithubSetting extends StateNotifier<String> {
  GithubSetting({required this.defaultValue, required this.key})
      : super(defaultValue) {
    sharedPreferencesUtil = SharedPreferencesUtil(key: key);
  }
  final String key;
  final String defaultValue;
  late final SharedPreferencesUtil sharedPreferencesUtil;

  Future<void> setFromPreference() async {
    final local = await sharedPreferencesUtil.load();
    if (local != null) {
      state = local;
    }
  }

  void setValue(String orgname) {
    assert(orgname.isNotEmpty);
    sharedPreferencesUtil.save(orgname);
    state = orgname;
  }
}

class SharedPreferencesUtil {
  SharedPreferencesUtil({required this.key});
  final String key;

  /// save list from prefs
  Future<void> save(String saveString) async {
    //重複を削除
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, saveString);
  }

  /// load list from prefs
  Future<String?> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
