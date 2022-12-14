import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/client.dart';
import 'package:repositoryviewer/orgnization_repository_view.dart';
import 'package:repositoryviewer/settings_view.dart';
import 'package:repositoryviewer/starred_view.dart';

class TopPage extends HookConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = useState(0);
    final ghTokenProvider = ref.watch(githubTokenProvider);
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
    //updateToken(githubTokenLoadingState.data!);
    //GraphQLProviderでラップすることで使える
    final screens = [
      const OrganizationRepositoryListHome(),
      const StarredRepositories(),
      const SettingsScreen()
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
                      icon: Icon(Icons.star), label: 'Star'),
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
      getToken: () async => 'Bearer ${token}',
    );
    return authLink.concat(httpLink);
  }
}
