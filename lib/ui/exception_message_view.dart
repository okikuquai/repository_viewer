import 'dart:io';

import 'package:flutter/material.dart';
import 'package:repositoryviewer/type/error_type.dart';

class ExceptionMessageView extends StatelessWidget {
  const ExceptionMessageView(
      {super.key, required this.errorType, this.message});

  final ErrorType errorType;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Error'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            if (errorType == ErrorType.networkError)
              const Text('データを取得できませんでした。ネットワーク接続を確認してください'),
            if (errorType == ErrorType.unknown) const Text('原因不明のエラーです'),
            if (errorType == ErrorType.httpResponseError)
              Text('Http Response Error\n$message'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            if (ModalRoute.of(context)?.settings.name == '/') {
              exit(0);
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
