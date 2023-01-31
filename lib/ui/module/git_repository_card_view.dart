import 'package:flutter/material.dart';
import 'package:repositoryviewer/ui/module/list_card_right_icon_button.dart';

import '../../type/github_node_id_type.dart';
import '../git_repository_info_view.dart';

class GitRepositoryCardView extends StatelessWidget {
  const GitRepositoryCardView(
      {super.key,
      required this.id,
      required this.title,
      required this.description,
      this.isStarredInGithub = false});

  final GithubNodeId id;
  final String title;
  final String description;
  final bool isStarredInGithub;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Card(
      child: ListTile(
          trailing: ListCardRightIconButton(
              id: id, isStarredInGithub: isStarredInGithub),
          title: Text(
            title,
            style: textTheme.headlineSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => GitRepositoryInfoView(repositoryId: id),
              ),
            );
          }),
    );
  }
}
