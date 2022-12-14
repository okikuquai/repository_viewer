import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/client.dart';
import 'package:repositoryviewer/starred_repositories.dart';
import 'package:repositoryviewer/user_view.dart';

import './graphql/getOrganizationList.graphql.dart';
import './graphql/getViewerID.graphql.dart';
import 'loadingAnimation.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final favoriteRepositoriesState = ref.read(FavoriteRepositoryProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(
          children: [
            ListTile(
                title: Text(
                  "Favoriteリストのクリア",
                  style: textTheme.headline5,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: const Text(
                  "Favoriteしたリストの全削除",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  favoriteRepositoriesState.clear();
                }),
            ListTile(
                title: Text(
                  "OSS License",
                  style: textTheme.headline5,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: const Text(
                  "ライセンス情報",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {}),
            ListTile(
                title: Text(
                  "github token",
                  style: textTheme.headline5,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: const Text(
                  "閲覧するユーザーのトークンを入力",
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
                  "Viewer Infomation",
                  style: textTheme.headline5,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: const Text(
                  "設定しているトークンのユーザー情報",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Navigate2UserView(),
                    ),
                  );
                }),
            ListTile(
                title: Text(
                  "Select Organization",
                  style: textTheme.headline5,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: const Text(
                  "表示するOrganizationを選択します",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => const SelectOrganizationView());
                }),
          ],
        ));
  }
}

class TokenInputDialog extends HookConsumerWidget {
  const TokenInputDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ghTokenNotifer = ref.read(githubTokenProvider.notifier);
    String valueText = "";
    return AlertDialog(
      title: const Text("Tokenを入力して下さい"),
      content: TextField(
        decoration: const InputDecoration(hintText: "ここに入力"),
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
              ghTokenNotifer.setValue(valueText);
              Navigator.pop(context);
            }),
      ],
    );
  }
}

class SelectOrganizationView extends HookConsumerWidget {
  const SelectOrganizationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ghOrganizationNotifer = ref.read(githubOrganizationProvider.notifier);

    final qryResult = useQuery$getOrganizationList(
        Options$Query$getOrganizationList(
            fetchPolicy: FetchPolicy.noCache,
            variables: Variables$Query$getOrganizationList(first: 100)));
    if (qryResult.result.isLoading) {
      return const AlertDialog(title: Text("ロード中"));
    } else if (qryResult.result.hasException) {
      return AlertDialog(
          title: const Text("エラー"),
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
                      ghOrganizationNotifer.setValue(e.node!.name ?? "");
                      Navigator.pop(context, 1);
                    },
                    child: Text(e!.node!.name ?? "no Name"),
                  ))
              .toList());
    }
    return const AlertDialog(
        title: Text("エラー"), content: Text("所属しているOrganizationがありません"));
  }
}

class Navigate2UserView extends HookConsumerWidget {
  const Navigate2UserView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$getViewerID();
    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return LoadingAnimationWithAppbar();
    } else if (qryResult.result.hasException) {
      //例外スローした場合
      return AlertDialog(
        title: const Text("エラー"),
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
      final String viewerID = qryResult.result.parsedData!.viewer.id.toString();
      return UserView(userID: viewerID);
    }
    return AlertDialog(
      title: const Text("エラー"),
      content: const Text("ユーザー情報を取得できませんでした"),
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
