import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RepositoryView extends HookConsumerWidget {
  const RepositoryView({Key? key, required this.repositoryName}) : super(key: key);
  final String repositoryName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(repositoryName),
        actions: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.groups)
          )
        ],
      ),
      body: Text(repositoryName)
    );
  }
}