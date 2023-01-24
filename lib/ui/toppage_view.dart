import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/ui/module/loading_animation.dart';
import 'package:repositoryviewer/provider/bookmarked_git_repository_provider.dart';
import 'package:repositoryviewer/provider/github_account_setting_provider.dart';
import 'package:repositoryviewer/ui/settings_view.dart';
import 'package:repositoryviewer/ui/bookmarked_git_repository_view.dart';

import 'org_repository_list_view.dart';

class TopPageView extends HookConsumerWidget {
  const TopPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = useState(0);
    final ghTokenProvider = ref.watch(githubTokenProvider);

    final bookmarkedGitRepositoryInitialized = useFuture(useMemoized(() => ref.watch(bookmarkedGitRepositoriesProvider.notifier).initialized));
    if (!bookmarkedGitRepositoryInitialized.hasData) {
      return const MaterialApp(home: LoadingAnimationWithAppbar());
    }

    //接続用のclientクラスのtokenを更新
    final client = ValueNotifier(
      GraphQLClient(
        defaultPolicies: DefaultPolicies(
          watchMutation: Policies(
            fetch: FetchPolicy.cacheOnly,
            error: ErrorPolicy.none,
            cacheReread: CacheRereadPolicy.ignoreAll,
          ),
        ),
        link: getGraphQLAuthLink(ghTokenProvider),
        cache: GraphQLCache(store: HiveStore()),
      ),
    );
    final screens = [
      const OrganizationRepositoryListView(),
      const BookmarkedGitRepositoryView(),
      const SettingsView()
    ];
    return GraphQLProvider(
        client: client,
        child: MaterialApp(
          home: Scaffold(
              body: screens[pageState.value],
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.bookmarks), label: 'Bookmarks'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings')
                ],
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.blueAccent,
                currentIndex: pageState.value,
                onTap: (index) {
                  pageState.value = index;
                },
              )),
        ));
  }

  Link getGraphQLAuthLink(String token) {
    //エンドポイント
    final HttpLink httpLink = HttpLink(
      'https://api.github.com/graphql',
    );

    //token (githubから取得)
    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer $token',
    );
    return authLink.concat(httpLink);
  }
}
