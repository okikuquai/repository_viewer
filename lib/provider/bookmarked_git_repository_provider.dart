
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';

import '../type/github_node_id_type.dart';

final bookmarkedGitRepositoriesProvider =
    StateNotifierProvider<BookmarkedRepositoryNotifier, Set<BookmarkedGitRepository>>(
  (ref) => BookmarkedRepositoryNotifierImpl(),
);

class BookmarkedRepositoryNotifierImpl extends StateNotifier<Set<BookmarkedGitRepository>> implements BookmarkedRepositoryNotifier  {
  BookmarkedRepositoryNotifierImpl() : super(<BookmarkedGitRepository>{});

  @override
  Future<Set<BookmarkedGitRepository>> get value => _load();

  @override
  Future<bool> get initialized => _initialize();


  final String _saveKey = 'bookmarkedGitRepository';

  @override
  void addId(GithubNodeId id) {
    final value = {...state, BookmarkedGitRepository(id.toString())};
    _changeState(value.toSet());
  }

  @override
  void removeId(GithubNodeId id) async {
    final list = await value;
    if (state.where((element) => element.nodeId == id).isNotEmpty) {
      //idをそのまま渡すと削除されないのでfirstWhereで同じisStringのlistを抽出している
      list.remove(list.firstWhere((element) => element.nodeId == id));
      final removedValue = Set.of(list);
      _changeState(removedValue);
    }
  }

  @override
  void clear() {
    _changeState(<BookmarkedGitRepository>{});
  }

  @override
  void toggle(GithubNodeId id) async {
    final list = await value;
    if (list.where((element) => element.nodeId == id).isNotEmpty) {
      removeId(id);
    } else {
      addId(id);
    }
  }

  void _changeState(Set<BookmarkedGitRepository> value) {
    state = value;
    _save(value);
  }

  Future<void> _save(Set<BookmarkedGitRepository> value) async {
    //重複を削除
    final saveValue = value.map((e) => e.nodeId.toString()).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_saveKey, saveValue);
  }

  Future<Set<BookmarkedGitRepository>> _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final loadedBookmarkedGitRepositorySet =
        prefs.getStringList(_saveKey)?.whereNotNull().toSet() ?? <String>{};
    final returnValue = loadedBookmarkedGitRepositorySet.map((e) => BookmarkedGitRepository(e)).toSet();
    // _changeState(returnValue);
    return returnValue.toSet();
  }

  Future<bool> _initialize() async {
    _changeState(await value);
    return true;
  }
}

abstract class BookmarkedRepositoryNotifier extends StateNotifier<Set<BookmarkedGitRepository>> {
  BookmarkedRepositoryNotifier(super.state);

  Future<Set<BookmarkedGitRepository>> get value;

  Future<bool> get initialized;

  void addId(GithubNodeId id);

  void removeId(GithubNodeId id);

  void clear();

  void toggle(GithubNodeId id);

}

class BookmarkedGitRepository {
  BookmarkedGitRepository(String nodeIdString) : _nodeId = GithubNodeId(nodeIdString);

  BookmarkedGitRepository.fromGithubNodeId(GithubNodeId nodeId) : _nodeId = nodeId;

  final GithubNodeId _nodeId;
  GithubNodeId get nodeId => _nodeId;
}