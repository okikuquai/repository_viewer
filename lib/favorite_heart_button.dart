import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'graphql/type/custom_id.dart';
import 'starred_repositories.dart';

class StarredButton extends HookConsumerWidget {
  const StarredButton(
      {super.key, required this.id, this.isStarredinGithub = false});

  final GithubAPIID id;
  final bool isStarredinGithub;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favState = ref
        .watch(favoriteRepositoryProvider)
        .where((element) => element == id)
        .isNotEmpty;
    final favStateNotifier = ref.watch(favoriteRepositoryProvider.notifier);
    final iconEnable = isStarredinGithub ? Icons.star : Icons.favorite;
    final iconDisable = isStarredinGithub ? Icons.star : Icons.favorite_border;
    final color = isStarredinGithub ? Colors.yellow : Colors.red;

    return InkWell(
        child: SizedBox(
          width: 48,
          height: 48,
          child: Icon(favState ? iconEnable : iconDisable, color: color),
        ),
        onTap: () {
          if (!isStarredinGithub) {
            favStateNotifier.toggle(id);
          }
        });
  }
}
