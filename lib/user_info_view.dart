import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/git_repository_info_view.dart';
import 'package:repositoryviewer/provider/bookmarked_git_repository_provider.dart';

import './graphql/get_user_info_from_id.graphql.dart';
import 'graphql/get_repository_info_from_multiple_ids.graphql.dart';
import 'type/github_node_id_type.dart';
import 'loading_animation.dart';

class UserInfoView extends HookConsumerWidget {
  const UserInfoView({super.key, required this.userId});
  final GithubNodeId userId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = Theme.of(context).primaryColor;
    final bookmarkedGitRepositoryState =
        ref.read(bookmarkedGitRepositoriesProvider.notifier);

    final bookmarkedGitRepositoryValueInfo =
        useMemoized(() => bookmarkedGitRepositoryState.value);
    final bookmarkedGitRepositoryValue =
        useFuture(bookmarkedGitRepositoryValueInfo);
    if (!bookmarkedGitRepositoryValue.hasData) {
      return const LoadingAnimation();
    }

    final qryResult = useQuery$getUserInfoFromId(
      Options$Query$getUserInfoFromId(
          fetchPolicy: FetchPolicy.noCache,
          variables: Variables$Query$getUserInfoFromId(id: userId)),
    );

    if (qryResult.result.isLoading) {
      return Scaffold(
          appBar: AppBar(title: const Text('Loading...')),
          body: const LoadingAnimation());
    } else if (qryResult.result.hasException) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Exception'),
          ),
          body: Text(qryResult.result.exception.toString()));
    } else if (qryResult.result.parsedData?.node != null) {
      final user = qryResult.result.parsedData!.node! as Fragment$UserInfo;
      final starredRepositories = user.starredRepositories.edges;
      List<GithubNodeId> ids = starredRepositories!.map((e) => GithubNodeId(e!.node.id.toString())).toList();


      if (user.isViewer) {
        ids.addAll(bookmarkedGitRepositoryValue.data!.map((e) => e.nodeId).toList());
        //重複消去
        ids = ids.toSet().toList();
      }

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
                        user.avatarUrl.toString(),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )))),
          UserStarredRepositoriesList(ids: ids),
        ],
      ));
    }
    return const Text('null');
  }
}

class UserStarredRepositoriesList extends HookConsumerWidget {
  const UserStarredRepositoriesList({super.key, required this.ids});
  final List<GithubNodeId> ids;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$getRepositoryInfoFromMultipleIds(
      Options$Query$getRepositoryInfoFromMultipleIds(
          variables:
              Variables$Query$getRepositoryInfoFromMultipleIds(ids: ids)),
    );

    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return SliverList(delegate: SliverChildBuilderDelegate((context, index) {
        return const LoadingAnimation();
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
          subtitle: Text(description ?? 'no description',
              maxLines: 1, overflow: TextOverflow.ellipsis),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  GitRepositoryInfoView(repositoryId: repository.id),
            ),
          ),
        ));
      }, childCount: repositories.length));
    }
    return const Text('null');
  }
}
