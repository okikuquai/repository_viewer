import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_validator/string_validator.dart';

import '../graphql/type/github_node_id_type.dart';

//旧favoriteRepositoryProvider (diffが汚れてしまったのでメモ)
final bookmarkedGitRepositoryProvider =
    StateNotifierProvider<BookmarkedRepositoryNotifier, List<BookmarkedGitRepository>>(
  (ref) => BookmarkedRepositoryNotifierImpl(),
);


class BookmarkedRepositoryNotifierImpl extends StateNotifier<List<BookmarkedGitRepository>> implements BookmarkedRepositoryNotifier  {
  BookmarkedRepositoryNotifierImpl() : super(<BookmarkedGitRepository>[]) {
    () async {
      _changeState(await value);
    };
  }

  @override
  Future<List<BookmarkedGitRepository>> get value => _load();

  final String _saveKey = 'bookmarkedGitRepository';

  @override
  void addId(BookmarkedGitRepository id) {
    final value = [...state, id];
    _changeState(value);
  }

  @override
  void removeId(BookmarkedGitRepository id) async {
    final list = await _load();
    if (state.where((element) => element.toString() == id.toString()).isNotEmpty) {
      //idをそのまま渡すと削除されないのでfirstWhereで同じisStringのlistを抽出している
      list.remove(list.firstWhere((element) => element.toString() == id.toString()));
      final removedValue = List.of(list);
      _changeState(removedValue);
    }
  }

  @override
  void clear() {
    _changeState(<BookmarkedGitRepository>[]);
  }

  @override
  void toggle(BookmarkedGitRepository id) async {
    final list = await _load();
    if (list.where((element) => element.toString() == id.toString()).isNotEmpty) {
      removeId(id);
    } else {
      addId(id);
    }
  }

  void _changeState(List<BookmarkedGitRepository> value) {
    state = value;
    _save(value);
  }

  Future<void> _save(List<BookmarkedGitRepository> value) async {
    //重複を削除
    final saveValue = value.map((e) => e.toString()).toSet().toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_saveKey, saveValue);
  }

  Future<List<BookmarkedGitRepository>> _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final loadedBookmarkedGitRepositoryList =
        prefs.getStringList(_saveKey)?.map((e) => BookmarkedGitRepository(e)).toList() ??
            [];

    return loadedBookmarkedGitRepositoryList;
  }
}

abstract class BookmarkedRepositoryNotifier extends StateNotifier<List<BookmarkedGitRepository>> {
  BookmarkedRepositoryNotifier(super.state);

  Future<List<BookmarkedGitRepository>> get value;

  void addId(BookmarkedGitRepository id);

  void removeId(BookmarkedGitRepository id);

  void clear();

  void toggle(BookmarkedGitRepository id);

}

class BookmarkedGitRepository extends GithubNodeID {
  BookmarkedGitRepository(super.idString);

}