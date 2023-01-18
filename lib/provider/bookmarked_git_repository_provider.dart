import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../graphql/type/github_node_id_type.dart';

//旧favoriteRepositoryProvider (diffが汚れてしまったのでメモ)
final bookmarkedGitRepositoryProvider =
    StateNotifierProvider<BookmarkedRepositoryNotifier, List<GithubNodeID>>(
  (ref) => BookmarkedRepositoryNotifierImpl(),
);


class BookmarkedRepositoryNotifierImpl extends StateNotifier<List<GithubNodeID>> implements BookmarkedRepositoryNotifier  {
  BookmarkedRepositoryNotifierImpl() : super(<GithubNodeID>[]) {
    () async {
      _changeState(await value);
    };
  }

  @override
  Future<List<GithubNodeID>> get value => _load();

  @override
  void addId(GithubNodeID id) {
    final value = [...state, id];
    _changeState(value);
  }

  @override
  void removeId(GithubNodeID id) async {
    final list = await _load();
    if (state.where((element) => element.idString == id.idString).isNotEmpty) {
      //idをそのまま渡すと削除されないのでfirstWhereで同じisStringのlistを抽出している
      list.remove(list.firstWhere((element) => element.idString == id.idString));
      final removedValue = List.of(list);
      _changeState(removedValue);
    }
  }

  @override
  void clear() {
    _changeState(<GithubNodeID>[]);
  }

  @override
  void toggle(GithubNodeID id) async {
    final list = await _load();
    if (list.where((element) => element.idString == id.idString).isNotEmpty) {
      removeId(id);
    } else {
      addId(id);
    }
  }

  @override
  void _changeState(List<GithubNodeID> value) {
    state = value;
    _save(value);
  }

  final String _saveKey = 'bookmarkedGitRepository';

  @override
  Future<void> _save(List<GithubNodeID> value) async {
    //重複を削除
    final saveValue = value.map((e) => e.idString).toSet().toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_saveKey, saveValue);
  }

  @override
  Future<List<GithubNodeID>> _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final loadedGithubNodeIDList =
        prefs.getStringList(_saveKey)?.map((e) => GithubNodeID(e)).toList() ??
            [];

    return loadedGithubNodeIDList;
  }
}

abstract class BookmarkedRepositoryNotifier extends StateNotifier<List<GithubNodeID>> {
  BookmarkedRepositoryNotifier(super.state);

  Future<List<GithubNodeID>> get value => _load();

  void addId(GithubNodeID id);

  void removeId(GithubNodeID id);

  void clear();

  void toggle(GithubNodeID id);

  void _changeState(List<GithubNodeID> value);

  Future<void> _save(List<GithubNodeID> value);

  Future<List<GithubNodeID>> _load();
}
