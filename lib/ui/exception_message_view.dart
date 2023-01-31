import 'package:flutter/material.dart';

class ExceptionMessageView extends StatelessWidget {
  const ExceptionMessageView({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('error')),
      body: Text(message),
    );
  }
}
