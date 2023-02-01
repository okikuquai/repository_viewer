import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/graphql/get_repository_info_from_multiple_ids.graphql.dart';
import 'package:repositoryviewer/graphql/repository_data.graphql.dart';
import 'package:repositoryviewer/provider/bookmarked_git_repository_provider.dart';
import 'package:repositoryviewer/ui/git_repository_info_view.dart';

import '../graphql/get_user_info_from_id.graphql.dart';
import '../type/github_node_id_type.dart';
import 'exception_message_view.dart';
import 'module/loading_animation.dart';

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
    if (qryResult.result.isLoading && qryResult.result.parsedData == null) {
      return const LoadingAnimationWithAppbar();
    } else if (qryResult.result.hasException) {
      return ExceptionMessageView(
          message: qryResult.result.exception.toString());
    } else if (qryResult.result.parsedData?.node != null) {
      try {
        return UserInfoSliverView(qryResult: qryResult);
      } catch (e) {
        return ExceptionMessageView(message: e.toString());
      }
    } else {
      return ExceptionMessageView(message: TypeError().toString());
    }
  }
}

class UserInfoSliverView extends HookConsumerWidget {
  const UserInfoSliverView({super.key, required this.qryResult});

  final QueryHookResult<Query$getUserInfoFromId> qryResult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = qryResult.result.parsedData!.node as Fragment$UserInfo;
    final List<Fragment$RepositoryData> repositoryList = userInfo
            .starredRepositories.edges
            ?.map((e) => e?.node)
            .whereNotNull()
            .toList() ??
        [];
    if (userInfo.isViewer) {
      try {
        //empty:loading, catch:例外をスローした時
        final bookmarkedRepositoryData = getBookmarkedRepositoryData(ref);
        if (bookmarkedRepositoryData.isEmpty) {
          return const LoadingAnimationWithAppbar();
        }
        repositoryList.insertAll(0, bookmarkedRepositoryData);
      } catch (e) {
        rethrow;
      }
    }
    return Scaffold(
        body: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollNotification) {
              return onScrollNotification(scrollNotification, qryResult);
            },
            child: SliverCustomScrollView(
                appBarTitle: userInfo.name ?? userInfo.login,
                avatarUrl: userInfo.avatarUrl,
                repositoryList: repositoryList,
                isLoading: qryResult.result.isLoading)));
  }

  bool onScrollNotification(ScrollNotification scrollNotification,
      QueryHookResult<Query$getUserInfoFromId> qryResult) {
    final userInfo = qryResult.result.parsedData!.node! as Fragment$UserInfo;

    if (scrollNotification is ScrollEndNotification) {
      final before = scrollNotification.metrics.extentBefore;
      final max = scrollNotification.metrics.maxScrollExtent;
      if (before == max) {
        final pageInfo = userInfo.starredRepositories.pageInfo;
        if (!pageInfo.hasNextPage) return false;

        qryResult.fetchMore(FetchMoreOptions$Query$getUserInfoFromId(
            variables: Variables$Query$getUserInfoFromId(
                id: userInfo.id, first: 15, after: pageInfo.endCursor),
            updateQuery: (previousResultData, fetchMoreResultData) {
              final List<dynamic> items = <dynamic>[
                ...previousResultData?['node']['starredRepositories']['edges']
                        as List<dynamic>? ??
                    [],
                ...fetchMoreResultData?['node']['starredRepositories']['edges']
                        as List<dynamic>? ??
                    [],
              ];
              fetchMoreResultData?['node']['starredRepositories']['edges'] =
                  items;
              return fetchMoreResultData;
            }));
        return true;
      }
    }
    return false;
  }

  List<Fragment$RepositoryData> getBookmarkedRepositoryData(WidgetRef ref) {
    final bookmarkedGitRepositoryAsyncState =
        ref.read(bookmarkedRepositoryProvider);
    return bookmarkedGitRepositoryAsyncState.when(
        data: (bookmarkedRepos) {
          final bookmarkedRepositoryDataQryResult =
          useQuery$getRepositoryInfoFromMultipleIds(
              Options$Query$getRepositoryInfoFromMultipleIds(
                  fetchPolicy: FetchPolicy.cacheFirst,
                  variables: Variables$Query$getRepositoryInfoFromMultipleIds(
                      ids: bookmarkedRepos
                          .map((e) => e.nodeId)
                          .toList())));

          if (bookmarkedRepositoryDataQryResult.result.isLoading) {
            return <Fragment$RepositoryData>[];
          }
          if (bookmarkedRepositoryDataQryResult.result.hasException) {
            throw Exception(bookmarkedRepositoryDataQryResult.result.exception);
          }
          if (bookmarkedRepositoryDataQryResult.result.parsedData != null &&
              bookmarkedRepositoryDataQryResult.result.parsedData!.nodes.isNotEmpty) {
            return bookmarkedRepositoryDataQryResult.result.parsedData!.nodes
                .whereNotNull()
                .map((e) => e as Fragment$RepositoryData)
                .toList();
          } else {
            throw Exception("Values is null");
          }
        },
        loading: () => <Fragment$RepositoryData>[],
        error: (Object error, StackTrace stackTrace) => throw Exception(error.toString()));
  }
}

class SliverCustomScrollView extends StatelessWidget {
  const SliverCustomScrollView(
      {super.key,
      required this.appBarTitle,
      required this.avatarUrl,
      required this.repositoryList,
      required this.isLoading});

  final String appBarTitle;
  final Uri avatarUrl;
  final List<Fragment$RepositoryData> repositoryList;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        UserStarredRepositorySliverAppBar(
          appBarTitle: appBarTitle,
          avatarUrl: avatarUrl,
        ),
        UserStarredRepositorySliverList(
          repositoryList: repositoryList,
        ),
        if (isLoading)
          SliverList(
              delegate: SliverChildListDelegate([
            const Padding(
                padding: EdgeInsets.all(30), child: LoadingAnimation())
          ])),
      ],
    );
  }
}

class UserStarredRepositorySliverAppBar extends StatelessWidget {
  const UserStarredRepositorySliverAppBar(
      {super.key, required this.appBarTitle, required this.avatarUrl});

  final String appBarTitle;
  final Uri avatarUrl;

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
            title: Text(appBarTitle),
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
                  avatarUrl.toString(),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ))));
  }
}

class UserStarredRepositorySliverList extends HookConsumerWidget {
  const UserStarredRepositorySliverList(
      {super.key, required this.repositoryList});

  final List<Fragment$RepositoryData> repositoryList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      final TextTheme textTheme = Theme.of(context).textTheme;
      final repository = repositoryList[index];
      final name = repository.name;
      final description = repository.description;

      return Card(
          child: ListTile(
        title: Text(
          name,
          style: textTheme.headlineSmall,
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
