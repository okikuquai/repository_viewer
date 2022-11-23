import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './graphql/getReadmeFromRepository.graphql.dart';

class RepositoryView extends HookConsumerWidget {
  const RepositoryView(
      {Key? key,
      required this.orgName,
      required this.teamName,
      required this.repositoryName})
      : super(key: key);
  final String orgName;
  final String teamName;
  final String repositoryName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String mdString = "Empty";
    final TextTheme textTheme = Theme.of(context).textTheme;
    final qryResult = useQuery$getReadmeFromRepository(
      Options$Query$getReadmeFromRepository(
          variables: Variables$Query$getReadmeFromRepository(
              orgName: orgName, repositoryName: repositoryName)),
    );

    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      mdString = "Loading";
    }
    //例外スローした場合
    else if (qryResult.result.hasException) {
      mdString = qryResult.result.exception.toString();
    } else {
      mdString = qryResult.result.parsedData?.organization?.repository?.object
              ?.toJson()['text'] ??
          "Empty";
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(repositoryName),
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    children: [
                      Text(orgName, style: textTheme.headline4),
                      Text("$teamName / $repositoryName",
                          style: textTheme.headline6)
                    ],
                  ),
                )),
            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () {/* ボタンがタップされた時の処理 */},
                  icon: const Icon(Icons.favorite),
                  label: const Text('favorite'),
                ),
              ],
            ),
            const Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Readme",
                style: textTheme.headline4,
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.white24,
              child: SingleChildScrollView(
                  // スクロールできるようにしておくのと、パッディングをいれてみやすくしておく
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: MarkdownBody(
                        data: mdString,
                      ))),
            ))
          ],
        ));
  }

  //Widget _body(BuildContext context) {}
}
