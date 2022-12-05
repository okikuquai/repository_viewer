import 'package:shared_preferences/shared_preferences.dart';

class FavoriteRepositories {
  static const String _saveKey = "favoriteRepositories";

  static List<String> value = <String>[];
  static void addItem(String item) {
    value.add(item);
    save();
  }

  /// save list from prefs
  static Future<void> save() async {
    //重複を削除
    value = value.toSet().toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_saveKey, value);
  }

  /// load list from prefs
  static Future<void> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getStringList(_saveKey) ?? [];
  }
}
