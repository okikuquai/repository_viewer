import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'type/github_node_id_type.dart';
import 'provider/bookmarked_git_repository_provider.dart';

class ListCardRightIconButton extends HookConsumerWidget {
  const ListCardRightIconButton(
      {super.key, required this.id, this.isStarredInGithub = false});

  final GithubNodeId id;
  final bool isStarredInGithub;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //SharedPreferenceで保存したBookmarkデータを読み込む
    final bookmarkedGitRepositoryState =
    ref.read(bookmarkedGitRepositoriesProvider.notifier);

    final bookmarkedGitRepositoryValueInfo =
    useMemoized(() => bookmarkedGitRepositoryState.value);
    useFuture(bookmarkedGitRepositoryValueInfo);

    final favState = ref
        .watch(bookmarkedGitRepositoriesProvider)
        .where((element) => GithubNodeId(element.nodeId.toString()) == id)
        .isNotEmpty;

    final bookmarkStateNotifier =
    ref.watch(bookmarkedGitRepositoriesProvider.notifier);

    final iconEnable = isStarredInGithub ? Icons.star : Icons.favorite;
    final iconDisable = isStarredInGithub ? Icons.star : Icons.favorite_border;
    final color = isStarredInGithub ? Colors.yellow : Colors.red;

    return InkWell(
        child: SizedBox(
          width: 48,
          height: 48,
          child: Icon(favState ? iconEnable : iconDisable, color: color),
        ),
        onTap: () {
          if (!isStarredInGithub) {
            bookmarkStateNotifier.toggle(id);
          }
        });
  }
}