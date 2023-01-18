import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../graphql/type/github_node_id_type.dart';

//旧favoriteRepositoryProvider (diffが汚れてしまったのでメモ)
final bookmarkedGitRepositoryProvider =
    StateNotifierProvider<BookmarkedRepositoryNotifier, List<GithubNodeID>>(
  (ref) => BookmarkedRepositoryNotifier(),
);

class BookmarkedRepositoryNotifier extends StateNotifier<List<GithubNodeID>> {
  BookmarkedRepositoryNotifier() : super(<GithubNodeID>[]);
  Future<List<GithubNodeID>> get value => _load();

  void addId(GithubNodeID id) {
    final value = [...state, id];
    _changeState(value);
  }

  void removeId(GithubNodeID id) async {
    final list = await _load();
    if (state.contains(id)) {
      list.remove(id);
      final removedValue = List.of(list);
      _changeState(removedValue);
    }
  }

  void clear() {
    _changeState(<GithubNodeID>[]);
  }

  void toggle(GithubNodeID id) async {
    final list = await _load();
    if (list.where((element) => element == id).isNotEmpty) {
      removeId(id);
    } else {
      addId(id);
    }
  }

  void _changeState(List<GithubNodeID> value) {
    state = value;
    _save(value);
  }

  final String _saveKey = 'bookmarkedGitRepository';
  Future<void> _save(List<GithubNodeID> value) async {
    //重複を削除
    final saveValue = value.map((e) => e.idString).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_saveKey, saveValue);
  }

  Future<List<GithubNodeID>> _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final loadedGithubNodeIDList =
        prefs.getStringList(_saveKey)?.map((e) => GithubNodeID(e)).toList() ??
            [];

    return loadedGithubNodeIDList;
  }
}
