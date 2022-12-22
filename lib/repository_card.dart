import 'package:flutter/material.dart';
import 'package:repositoryviewer/favorite_heart_button.dart';

import 'repository_view.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard(
      {super.key,
      required this.id,
      required this.title,
      required this.description,
      this.isStarredinGithub = false});

  final String id;
  final String title;
  final String description;
  final bool isStarredinGithub;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Card(
      child: ListTile(
          trailing: StarredButton(id: id, isStarredinGithub: isStarredinGithub),
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
                builder: (context) => RepositoryView(repositoryID: id),
              ),
            );
          }),
    );
  }
}
