import 'package:flutter/material.dart';
import './repository_view.dart';


class TeamRepositoryList extends StatelessWidget {
  const TeamRepositoryList({Key? key, required this.repositorynode}) : super(key: key);
  final Map repositorynode;

  @override
  Widget build(BuildContext context) {
    final List repositories = repositorynode['repositories']['edges'];
    return Scaffold(
      appBar: AppBar(
        title: Text(repositorynode['name']),
      ),
      body: ListView.builder(
        itemCount: repositories.length,
        itemBuilder: (context, index) {
          final TextTheme textTheme = Theme.of(context).textTheme;
          final repository = repositories[index];
          return Card(
              child: ListTile(
                title: Text(
                  repository['node']['name'] ?? "no name",
                  style: textTheme.headline5,
                ),
                subtitle: Text(repository['node']["description"] ?? "no description"),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => RepositoryView(repositoryinfo: repository['node']),
                  ),
                )
              ),
          );
        }
     )
    );
  }
}