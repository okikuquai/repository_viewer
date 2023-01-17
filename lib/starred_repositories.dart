import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './graphql/type/custom_id.dart';

final favoriteRepositoryProvider =
    StateNotifierProvider<FavoriteRepositoriesNotifier, List<GithubAPIID>>(
  (ref) => FavoriteRepositoriesNotifier(),
);

class FavoriteRepositoriesNotifier extends StateNotifier<List<GithubAPIID>> {
  FavoriteRepositoriesNotifier() : super(<GithubAPIID>[]);
  Future<List<GithubAPIID>> get value => _load();

  void addId(GithubAPIID id) {
    final value = [...state, id];
    _changeState(value);
  }

  void removeId(GithubAPIID id) async {
    final list = await _load();
    if (state.contains(id)) {
      list.remove(id);
      final removedValue = List.of(list);
      _changeState(removedValue);
    }
  }

  void clear() {
    _changeState(<GithubAPIID>[]);
  }

  void toggle(GithubAPIID id) async {
    final list = await _load();
    if (list.where((element) => element == id).isNotEmpty) {
      removeId(id);
    } else {
      addId(id);
    }
  }

  void _changeState(List<GithubAPIID> value) {
    state = value;
    _save(value);
  }

  final String _saveKey = 'favoriteRepositories';
  Future<void> _save(List<GithubAPIID> value) async {
    //重複を削除
    final saveValue = value.map((e) => e.idString).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_saveKey, saveValue);
  }

  Future<List<GithubAPIID>> _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final loadedGithubAPIIDList = prefs.getStringList(_saveKey)?.map((e) => GithubAPIID(e)).toList() ?? [];

    return loadedGithubAPIIDList;
  }
}