import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FavoriteRepositoryProvider =
    StateNotifierProvider<FavoriteRepositoriesNotifier, List<String>>(
  (ref) => FavoriteRepositoriesNotifier(),
);

class FavoriteRepositoriesNotifier extends StateNotifier<List<String>> {
  FavoriteRepositoriesNotifier() : super(FavoriteRepositories.value);

  void addId(String id) {
    final source = [...state, id];
    _changeState(source);
  }

  void removeId(String id) {
    if (state.contains(id)) {
      final source = [
        for (final val in FavoriteRepositories.value)
          if (val != id) val,
      ];
      _changeState(source);
    }
  }

  void toggle(String id) {
    if (FavoriteRepositories.value
        .where((element) => element == id)
        .isNotEmpty) {
      removeId(id);
    } else {
      addId(id);
    }
  }

  void _changeState(List<String> source) {
    state = FavoriteRepositories.value = source;
  }
}

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
