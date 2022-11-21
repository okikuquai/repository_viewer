import 'package:flutter/material.dart';

class RepositoryView extends StatelessWidget {
  const RepositoryView({Key? key, required this.repositoryName}) : super(key: key);
  final String repositoryName;

  @override
  Widget build(BuildContext context) {
    return Text(repositoryName);
  }
}