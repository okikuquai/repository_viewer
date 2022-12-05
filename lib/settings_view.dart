import 'package:flutter/material.dart';
import 'package:repositoryviewer/starred_repositories.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(
          children: [
            ListTile(
                title: Text(
                  "Favoriteクリア",
                  style: textTheme.headline5,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: const Text(
                  "Favoriteしたリストの全削除",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  FavoriteRepositories.value.clear();
                }),
            ListTile(
                title: Text(
                  "OSS License",
                  style: textTheme.headline5,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: const Text(
                  "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {})
          ],
        ));
  }
}
