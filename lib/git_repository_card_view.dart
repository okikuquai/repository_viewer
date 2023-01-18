import 'package:flutter/material.dart';
import 'package:repositoryviewer/list_card_right_icon_button.dart';

import 'graphql/type/github_node_id_type.dart';
import 'repository_info_view.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard(
      {super.key,
      required this.id,
      required this.title,
      required this.description,
      this.isStarredinGithub = false});

  final GithubNodeID id;
  final String title;
  final String description;
  final bool isStarredinGithub;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Card(
      child: ListTile(
          trailing: ListCardRightIconButton(
              id: id, isStarredInGithub: isStarredinGithub),
          title: Text(
            title,
            style: textTheme.headline5,
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
                builder: (context) => RepositoryInfoView(repositoryID: id),
              ),
            );
          }),
    );
  }
}