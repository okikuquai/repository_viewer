import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'graphql/organization.graphql.dart';

class RepositoryView extends StatelessWidget {
  const RepositoryView({Key? key, required this.repositoryinfo}) : super(key: key);
  final Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node? repositoryinfo;

  @override
  Widget build(BuildContext context) {
    if (repositoryinfo == null) {
      const snackBar = SnackBar(
        content: Text('Selected repository has no contains!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
      return const Text('Selected repository has no contains!');
    }
    else {
      //名前とURLはあるはず...
      return Scaffold(
          appBar: AppBar(
            title: Text(repositoryinfo!.name),
          ),
          body: Column(
            children: [
              Text(repositoryinfo?.description ?? "No Description"),
              InkWell(
                child: const Text("Jump to repository page"),
                onTap: () async {
                  var link = Uri.parse(repositoryinfo!.url);
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
}