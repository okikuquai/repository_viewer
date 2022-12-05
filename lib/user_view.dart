import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/repository_view.dart';
import 'package:repositoryviewer/starred_repositories.dart';

import './graphql/getUserInfoFromID.graphql.dart';
import 'graphql/getRepositoryInfoFromMultipleIDs.graphql.dart';
import 'loadingAnimation.dart';

class UserView extends HookConsumerWidget {
  const UserView({super.key, required this.userID});
  final String userID;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = Theme.of(context).primaryColor;
    final qryResult = useQuery$getUserInfoFromID(
      Options$Query$getUserInfoFromID(
          fetchPolicy: FetchPolicy.noCache,
          variables: Variables$Query$getUserInfoFromID(id: userID)),
    );

    if (qryResult.result.isLoading) {
      return Scaffold(
          appBar: AppBar(title: const Text("Loading...")),
          body: loadingAnimation());
    } else if (qryResult.result.hasException) {
      return Text(qryResult.result.exception.toString());
    } else if (qryResult.result.parsedData?.node != null) {
      final user = qryResult.result.parsedData!.node! as Fragment$UserInfo;
      final starredRepositories = user.starredRepositories.edges;
      List<String> ids = [];
      starredRepositories?.forEach((element) {
        ids.add(element!.node.id.toString());
      });

      if (user.isViewer) {
        ids.addAll(FavoriteRepositories.value);
        //重複消去
        ids = ids.toSet().toList();
      }

      if (user.isViewer) {}
      return Scaffold(
          body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                  ],
                  title: Text(user.name ?? user.login),
                  background: DecoratedBox(
                      position: DecorationPosition.foreground,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: <Color>[colorTheme, Colors.transparent],
                        ),
                      ),
                      child: Image.network(
                        user.avatarUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )))),
          UserStarredRepositoriesList(ids: ids),
        ],
      ));
    }
    return const Text("null");
  }
}

class UserStarredRepositoriesList extends HookConsumerWidget {
  const UserStarredRepositoriesList({super.key, required this.ids});
  final List<String> ids;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$getRepositoryInfoFromMultipleIDs(
      Options$Query$getRepositoryInfoFromMultipleIDs(
          variables:
              Variables$Query$getRepositoryInfoFromMultipleIDs(ids: ids)),
    );

    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return SliverList(delegate: SliverChildBuilderDelegate((context, index) {
        return loadingAnimation();
      }));
    }
    //例外スローした場合
    else if (qryResult.result.hasException) {
      return SliverList(delegate: SliverChildBuilderDelegate((context, index) {
        return Text(qryResult.result.exception.toString());
      }));
    }

    if (qryResult.result.parsedData?.nodes != null) {
      final repositories = qryResult.result.parsedData!.nodes;

      return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        final TextTheme textTheme = Theme.of(context).textTheme;
        final repository = repositories[index] as Fragment$RepositoryData;
        final name = repository.name;
        final description = repository.description;
        return Card(
            child: ListTile(
          title: Text(
            name,
            style: textTheme.headline5,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(description ?? "no description",
              maxLines: 1, overflow: TextOverflow.ellipsis),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RepositoryView(repositoryID: repository.id),
            ),
          ),
        ));
      }, childCount: repositories.length));
    }
    return const Text("null");
  }
}
