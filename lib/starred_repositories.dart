import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final favoriteRepositoryProvider =
    StateNotifierProvider<FavoriteRepositoriesNotifier, List<String>>(
  (ref) => FavoriteRepositoriesNotifier(),
);

class FavoriteRepositoriesNotifier extends StateNotifier<List<String>> {
  FavoriteRepositoriesNotifier() : super(<String>[]);
  Future<List<String>> get value => _load();

  void addId(String id) {
    final value = [...state, id];
    _changeState(value);
  }

  void removeId(String id) async {
    final list = await _load();
    if (state.contains(id)) {
      list.remove(id);
      final removedvalue = List.of(list);
      _changeState(removedvalue);
    }
  }

  void clear() {
    _changeState(<String>[]);
  }

  void toggle(String id) async {
    final list = await _load();
    if (list.where((element) => element == id).isNotEmpty) {
      removeId(id);
    } else {
      addId(id);
    }
  }

  void _changeState(List<String> value) {
    state = value;
    _save(value);
  }

  final String _saveKey = 'favoriteRepositories';
  Future<void> _save(List<String> value) async {
    //重複を削除
    value = value.toSet().toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_saveKey, value);
  }

  Future<List<String>> _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_saveKey) ?? [];
  }
}
