import 'dart:async';

import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../type/github_node_id_type.dart';

part 'bookmarked_git_repository_provider.g.dart';

//generator使わず実装してみたかったけど断念...
@riverpod
class BookmarkedRepositoryNotifierImpl
    extends _$BookmarkedRepositoryNotifierImpl
    implements BookmarkedRepositoryNotifier {
  final String _saveKey = 'bookmarkedGitRepository';

  Future<Set<BookmarkedGitRepository>> _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final loadedBookmarkedGitRepositorySet =
        prefs.getStringList(_saveKey)?.whereNotNull().toSet() ?? <String>{};
    final returnValue = loadedBookmarkedGitRepositorySet
        .map((e) => BookmarkedGitRepository(nodeId: GithubNodeId(e)))
        .toSet();
    return returnValue;
  }

  Future<void> _save(Set<BookmarkedGitRepository> value) async {
    //重複を削除
    final saveValue = value.map((e) => e.nodeId.toString()).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_saveKey, saveValue);
  }

  @override
  FutureOr<Set<BookmarkedGitRepository>> build() async {
    // Load initial todo list from the remote repository
    return await _load();
  }

  @override
  Future<void> clear() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final setStateValue = <BookmarkedGitRepository>{};
      await _save(setStateValue);
      return setStateValue;
    });
  }

  Future<Set<BookmarkedGitRepository>> _addId(GithubNodeId id) async {
    final setStateValue = <BookmarkedGitRepository>{
      ...await _load(),
      BookmarkedGitRepository(nodeId: id)
    };
    await _save(setStateValue);
    return setStateValue;
  }

  Future<Set<BookmarkedGitRepository>> _removeId(GithubNodeId id) async {
    final setStateValue = await _load();
    if (setStateValue.where((element) => element.nodeId == id).isNotEmpty) {
      setStateValue.removeWhere((element) => element.nodeId == id);
      _save(setStateValue);
    }
    return setStateValue;
  }

  @override
  Future<void> toggle(GithubNodeId id) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final currentValue = await _load();
      if (currentValue.where((element) => element.nodeId == id).isNotEmpty) {
        return await _removeId(id);
      } else {
        return await _addId(id);
      }
    });
  }

}

abstract class BookmarkedRepositoryNotifier {
  BookmarkedRepositoryNotifier();

  void clear();

  void toggle(GithubNodeId id);
}

class BookmarkedGitRepository {
  BookmarkedGitRepository({required this.nodeId});

  final GithubNodeId nodeId;
}
