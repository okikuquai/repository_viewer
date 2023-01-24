import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/git_repository_info_view.dart';
import 'package:repositoryviewer/graphql/get_repository_info_from_multiple_ids.graphql.dart';
import 'package:repositoryviewer/provider/bookmarked_git_repository_provider.dart';

import './graphql/get_user_info_from_id.graphql.dart';
import 'type/github_node_id_type.dart';
import 'loading_animation.dart';
import 'package:collection/collection.dart';

class UserInfoView extends HookConsumerWidget {
  const UserInfoView({super.key, required this.userId});

  final GithubNodeId userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$getUserInfoFromId(
      Options$Query$getUserInfoFromId(
          fetchPolicy: FetchPolicy.noCache,
          variables: Variables$Query$getUserInfoFromId(id: userId, first: 15)),
    );
    //初期fetchのみアニメーションを表示させる
    if (qryResult.result.isLoading && qryResult.result.parsedData == null) {
      return loading();
    } else if (qryResult.result.hasException) {
      return displayException(qryResult.result.exception.toString());
    } else if (qryResult.result.parsedData?.node != null) {
      final userInfo = qryResult.result.parsedData!.node! as Fragment$UserInfo;
      final starredRepository =
          userInfo.starredRepositories.edges?.toList().whereNotNull().toList();

      //viewer(token発行元のユーザー)の場合はlocalでbookmarkしたリポジトリをadd
      if (userInfo.isViewer) {
        final bookmarkedGitRepositoryState =
        ref.read(bookmarkedGitRepositoriesProvider.notifier);

        final bookmarkedGitRepositoryValueInfo =
        useMemoized(() => bookmarkedGitRepositoryState.value);
        final bookmarkedGitRepositoryValue =
        useFuture(bookmarkedGitRepositoryValueInfo);
        if (!bookmarkedGitRepositoryValue.hasData) {
          return loading();
        }

        final bookmarkedRepositoryDataQryResult =
            useQuery$getRepositoryInfoFromMultipleIds(
                Options$Query$getRepositoryInfoFromMultipleIds(
                    fetchPolicy: FetchPolicy.cacheFirst,
                    variables: Variables$Query$getRepositoryInfoFromMultipleIds(
                        ids: bookmarkedGitRepositoryValue.data!
                            .map((e) => e.nodeId)
                            .toList())));
        if (bookmarkedRepositoryDataQryResult.result.hasException) {
          return displayException(
              bookmarkedRepositoryDataQryResult.result.exception.toString());
        } else if (!bookmarkedRepositoryDataQryResult.result.isLoading) {
          starredRepository?.insertAll(
              0,
              bookmarkedRepositoryDataQryResult.result.parsedData!.nodes
                  .map((e) {
                final fragmentData = e as Fragment$RepositoryData;
                return Fragment$UserInfo$starredRepositories$edges(
                  node: Fragment$UserInfo$starredRepositories$edges$node(
                    id: fragmentData.id,
                    name: fragmentData.name,
                    url: fragmentData.url, $__typename: '',
                  ), $__typename: '',
                );
              }));
        }
      }

      return Scaffold(
          body: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollNotification) {
                if (scrollNotification is ScrollEndNotification) {
                  final before = scrollNotification.metrics.extentBefore;
                  final max = scrollNotification.metrics.maxScrollExtent;
                  if (before == max) {
                    final pageInfo = userInfo.starredRepositories.pageInfo;
                    if (!pageInfo.hasNextPage) return false;

                    qryResult.fetchMore(
                        FetchMoreOptions$Query$getUserInfoFromId(
                            variables: Variables$Query$getUserInfoFromId(
                                id: userInfo.id,
                                first: 15,
                                after: pageInfo.endCursor),
                            updateQuery:
                                (previousResultData, fetchMoreResultData) {
                              final List<dynamic> items = <dynamic>[
                                ...previousResultData?['node']
                                            ['starredRepositories']['edges']
                                        as List<dynamic>? ??
                                    <dynamic>[],
                                ...fetchMoreResultData?['node']
                                            ['starredRepositories']['edges']
                                        as List<dynamic>? ??
                                    <dynamic>[],
                              ];
                              fetchMoreResultData?['node']
                                  ['starredRepositories']['edges'] = items;
                              return fetchMoreResultData;
                            }));
                    return true;
                  }
                }
                return false;
              },
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  UserStarredRepositorySliverAppBer(
                    userName: userInfo.name,
                    userLogin: userInfo.login,
                    avatarUrlString: userInfo.avatarUrl.toString(),
                  ),
                  UserStarredRepositorySliverList(
                    repositoryList: starredRepository!,
                  ),
                  if (qryResult.result.isLoading)
                    SliverList(
                        delegate: SliverChildListDelegate([
                      const Padding(
                          padding: EdgeInsets.all(30),
                          child: LoadingAnimation())
                    ])),
                ],
              )));
    }
    return const Text('null');
  }

  Widget loading() {
    return Scaffold(
        appBar: AppBar(title: const Text('Loading...')),
        body: const LoadingAnimation());
  }

  Widget displayException(String exceptionMessage) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Exception'),
        ),
        body: Text(exceptionMessage));
  }
}

class UserStarredRepositorySliverAppBer extends StatelessWidget {
  const UserStarredRepositorySliverAppBer(
      {super.key,
      this.userName,
      required this.userLogin,
      required this.avatarUrlString});

  final String? userName;
  final String userLogin;
  final String avatarUrlString;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).primaryColor;
    return SliverAppBar(
        expandedHeight: 200,
        pinned: true,
        stretch: true,
        flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
            ],
            title: Text(userName ?? userLogin),
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
                  avatarUrlString,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ))));
  }
}

class UserStarredRepositorySliverList extends HookConsumerWidget {
  const UserStarredRepositorySliverList(
      {super.key, required this.repositoryList});

  final List<Fragment$UserInfo$starredRepositories$edges?> repositoryList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    repositoryList.removeWhere((element) => element == null);
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      final TextTheme textTheme = Theme.of(context).textTheme;
      final repository = repositoryList[index]!.node;
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
    }, childCount: repositoryList.length));
  }
}
