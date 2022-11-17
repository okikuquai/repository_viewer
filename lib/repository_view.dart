import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryView extends StatelessWidget {
  const RepositoryView({Key? key, required this.repositoryinfo}) : super(key: key);
  final Map repositoryinfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(repositoryinfo['name']),
      ),
      body: Column(
        children: [
          Text(repositoryinfo['description']),
          InkWell(
            child: Text("ページはこちら！"),
            onTap: () async {
              var link = Uri.parse(repositoryinfo['url']);
              await launchUrl(link);

              //なぜかfalseになる
              // if (await canLaunchUrl(link)) {
              //   await launchUrl(link);
              // }
            },
          ),
        ],
      )

    );
  }
}