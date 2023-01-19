import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/provider/github_account_setting_provider.dart';
import 'package:repositoryviewer/provider/bookmarked_git_repository_provider.dart';
import 'package:repositoryviewer/user_info_view.dart';

import './graphql/get_organization_list.graphql.dart';
import './graphql/get_viewer_id.graphql.dart';
import 'loading_animation.dart';

class SettingsView extends HookConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bookmarkedGitRepositoryState =
        ref.read(bookmarkedGitRepositoriesProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(
          children: [
            ListTile(
                title: Text(
                  'Favoriteリストのクリア',
                  style: textTheme.headline5,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: const Text(
                  'Favoriteしたリストの全削除',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  bookmarkedGitRepositoryState.clear();
                }),
            ListTile(
                title: Text(
                  'OSS License',
                  style: textTheme.headline5,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: const Text(
                  'ライセンス情報',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {}),
            ListTile(
                title: Text(
                  'github token',
                  style: textTheme.headline5,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: const Text(
                  '閲覧するユーザーのトークンを入力',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => const TokenInputDialog());
                }),
            ListTile(
                title: Text(
                  'Viewer Infomation',
                  style: textTheme.headline5,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: const Text(
                  '設定しているトークンのユーザー情報',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Navigate2UserInfoView(),
                    ),
                  );
                }),
            ListTile(
                title: Text(
                  'Select Organization',
                  style: textTheme.headline5,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: const Text(
                  '表示するOrganizationを選択します',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => const OrganizationSelectDialog());
                }),
          ],
        ));
  }
}

class TokenInputDialog extends HookConsumerWidget {
  const TokenInputDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ghTokenNotifier = ref.read(githubTokenProvider.notifier);
    String valueText = '';
    return AlertDialog(
      title: const Text('Tokenを入力して下さい'),
      content: TextField(
        decoration: const InputDecoration(hintText: 'ここに入力'),
        onChanged: (value) {
          valueText = value;
        },
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('キャンセル'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
            child: const Text('OK'),
            onPressed: () {
              ghTokenNotifier.setValue(valueText);
              Navigator.pop(context);
            }),
      ],
    );
  }
}

class OrganizationSelectDialog extends HookConsumerWidget {
  const OrganizationSelectDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ghOrganizationNotifier = ref.read(githubOrganizationProvider.notifier);

    final qryResult = useQuery$getOrganizationList(
        Options$Query$getOrganizationList(
            fetchPolicy: FetchPolicy.noCache,
            variables: Variables$Query$getOrganizationList(first: 100)));
    if (qryResult.result.isLoading) {
      return const AlertDialog(title: Text('ロード中'));
    } else if (qryResult.result.hasException) {
      return AlertDialog(
          title: const Text('エラー'),
          content: Text(qryResult.result.exception.toString()));
    } else if (qryResult.result.parsedData?.viewer.organizations.edges !=
        null) {
      final organizationNames =
          qryResult.result.parsedData?.viewer.organizations.edges;
      return SimpleDialog(
          title: const Text('選択'),
          children: organizationNames!
              .map((e) => SimpleDialogOption(
                    onPressed: () {
                      ghOrganizationNotifier.setValue(e.node!.name ?? '');
                      Navigator.pop(context, 1);
                    },
                    child: Text(e!.node!.name ?? 'no Name'),
                  ))
              .toList());
    }
    return const AlertDialog(
        title: Text('エラー'), content: Text('所属しているOrganizationがありません'));
  }
}

class Navigate2UserInfoView extends HookConsumerWidget {
  const Navigate2UserInfoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$getViewerID();
    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return const LoadingAnimationWithAppbar();
    } else if (qryResult.result.hasException) {
      //例外スローした場合
      return AlertDialog(
        title: const Text('エラー'),
        content: Text(qryResult.result.exception.toString()),
        actions: <Widget>[
          MaterialButton(
              color: Colors.white,
              textColor: Colors.blue,
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      );
    } else if (qryResult.result.parsedData?.viewer.id != null) {
      return UserInfoView(userId: qryResult.result.parsedData!.viewer.id);
    }
    return AlertDialog(
      title: const Text('エラー'),
      content: const Text('ユーザー情報を取得できませんでした'),
      actions: <Widget>[
        MaterialButton(
            color: Colors.white,
            textColor: Colors.blue,
            child: const Text('OK'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );
  }
}
