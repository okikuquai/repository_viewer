import 'package:flutter/material.dart';
import './repository_view.dart';
import './graphql/organization.graphql.dart';

class TeamRepositoryList extends StatelessWidget {
  const TeamRepositoryList({Key? key, required this.teamrepositories})
      : super(key: key);
  final Query$ReadOrgRepositories$organization$teams$edges$node? teamrepositories;

  @override
  Widget build(BuildContext context) {
    //Team情報がなかった時はpopしてメッセージを表示する
    //Widgetに関してのretuenはこれでいいのだろうか...
    if (teamrepositories == null) {
      const snackBar = SnackBar(
        content: Text('Selected repository has no contains!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
      return const Text('Selected repository has no contains!');
    }
    else {

      final repositories = teamrepositories!.repositories.edges;
      final repositoriesCount = repositories!.length;
      return Scaffold(
          appBar: AppBar(
            title: Text(teamrepositories!.name),
          ),
          body: ListView.builder(
              itemCount: repositoriesCount,
              itemBuilder: (context, index) {
                final TextTheme textTheme = Theme
                    .of(context)
                    .textTheme;
                final repository = repositories[index];
                return Card(
                  child: ListTile(
                      title: Text(
                        repository?.node.name ?? "No Name",
                        style: textTheme.headline5,
                      ),
                      subtitle: Text(repository?.node.name ?? "No Description"),
                      onTap: () =>
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  RepositoryView(
                                      repositoryinfo: repository?.node),
                            ),
                          )
                  ),
                );
              }
          )
      );
    }
  }
}