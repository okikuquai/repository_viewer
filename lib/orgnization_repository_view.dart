import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/client.dart';
import 'package:repositoryviewer/organization_members_view.dart';
import 'package:repositoryviewer/repository_view.dart';

import './graphql/getRepositoriesInOrganization.graphql.dart';
import 'loadingAnimation.dart';
import 'starred_repositories.dart';

class OrganizationRepositoryListHome extends StatefulWidget {
  const OrganizationRepositoryListHome({super.key});
  @override
  createState() => _OrganizationRepositoryListHome();
}

class _OrganizationRepositoryListHome
    extends State<OrganizationRepositoryListHome> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GithubSetting.organization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final orgName = snapshot.data ?? "nml-nakameguro";
            return Scaffold(
                appBar: AppBar(
                  title: Text(orgName),
                  actions: [
                    IconButton(
                        onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => OrgMemberList(
                                  orgName: orgName,
                                ),
                              ),
                            ),
                        icon: const Icon(Icons.groups))
                  ],
                ),
                body: OrganizationRepositoryCardList(
                  orgName: orgName,
                ));
          }
          return loadingAnimation();
        });
  }
}

class OrganizationRepositoryCardList extends HookConsumerWidget {
  const OrganizationRepositoryCardList({super.key, required this.orgName});
  final String orgName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$getRepositoriesInOrganization(
        Options$Query$getRepositoriesInOrganization(
            variables: Variables$Query$getRepositoriesInOrganization(
                orgName: orgName, first: 100)));

    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return loadingAnimation();
    }
    //例外スローした場合
    else if (qryResult.result.hasException) {
      return Text(qryResult.result.exception.toString());
    }

    if (qryResult.result.parsedData?.organization?.repositories.edges != null) {
      //ハートの状態を変えるためにStatefulWidgetでリポジトリのリストを表示させる
      return FavoriteCardList(qryResult: qryResult, orgName: orgName);
    }
    return const Text("no Teams in this Organization");
  }
}

class FavoriteCardList extends StatefulWidget {
  const FavoriteCardList(
      {Key? key, required this.qryResult, required this.orgName})
      : super(key: key);
  final QueryHookResult<Query$getRepositoriesInOrganization> qryResult;
  final String orgName;

  @override
  createState() => _FavoriteCardList();
}

class _FavoriteCardList extends State<FavoriteCardList> {
  @override
  Widget build(BuildContext context) {
    //nullじゃないことが確定しているので!を使う
    final repositories =
        widget.qryResult.result.parsedData!.organization!.repositories.edges!;
    final repositoriesCount = repositories.length;
    var isFavorite = List.generate(
        repositoriesCount,
        (index) => FavoriteRepositories.value
            .where((element) => element == repositories[index]!.node!.id)
            .isNotEmpty);

    void setFavorite(int index) {
      setState(() {
        isFavorite[index] != isFavorite[index];
      });
    }

    return ListView.builder(
        itemCount: repositoriesCount,
        itemBuilder: (context, index) {
          final TextTheme textTheme = Theme.of(context).textTheme;
          final repository = repositories[index]!.node!;
          return Card(
            child: ListTile(
                trailing: GestureDetector(
                  child: Icon(
                      isFavorite[index]
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isFavorite[index] ? Colors.red : null),
                  onTap: () {
                    setFavorite(index);
                    if (isFavorite[index]) {
                      FavoriteRepositories.value
                          .removeWhere((element) => element == repository.id);
                    } else {
                      FavoriteRepositories.addItem(repository.id);
                    }
                  },
                ),
                title: Text(
                  repository.name,
                  style: textTheme.headline5,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  repository.description ?? "no description",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          RepositoryView(repositoryID: repository.id),
                    ),
                  );
                  setState(() {});
                }),
          );
        });
  }
}
