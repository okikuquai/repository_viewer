import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/bookmarked_git_repository_provider.dart';
import '../../type/github_node_id_type.dart';

class ListCardRightIconButton extends HookConsumerWidget {
  const ListCardRightIconButton(
      {super.key, required this.id, this.isStarredInGithub = false});

  final GithubNodeId id;
  final bool isStarredInGithub;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //SharedPreferenceで保存したBookmarkデータを読み込む
    final bookmarkedGitRepositoryAsyncState =
        ref.watch(bookmarkedRepositoryNotifierImplProvider);

    return bookmarkedGitRepositoryAsyncState.when(
        data: (bookmarkedRepos) {
          final favState = bookmarkedRepos
              .where((element) => element.nodeId == id)
              .isNotEmpty;

          final iconEnable = isStarredInGithub ? Icons.star : Icons.favorite;
          final iconDisable =
              isStarredInGithub ? Icons.star : Icons.favorite_border;
          final color = isStarredInGithub ? Colors.yellow : Colors.red;

          return InkWell(
              child: SizedBox(
                width: 48,
                height: 48,
                child: Icon(favState ? iconEnable : iconDisable, color: color),
              ),
              onTap: () {
                if (!isStarredInGithub) {
                  ref
                      .read(bookmarkedRepositoryNotifierImplProvider.notifier)
                      .toggle(id);
                }
              });
        },
        loading: () => const SizedBox(
              width: 48,
              height: 48,
              child: Icon(Icons.sync),
            ),
        error: (Object error, StackTrace stackTrace) =>
            const SizedBox(width: 48, height: 48, child: Icon(Icons.error)));
  }
}
