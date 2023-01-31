import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:repositoryviewer/type/git_repository_contributor.dart';

Future<List<GitRepositoryContributor>> getContributor(
    String repo, String token, String orgName) async {
  try {
    final Response<String> res = await Dio()
        .get('https://api.github.com/repos/$orgName/$repo/contributors',
            options: Options(headers: {
              'Accept': 'application/vnd.github+json',
              'Authorization': 'Bearer $token',
              'X-GitHub-Api-Version': '2022-11-28'
            }));
    if (res.statusCode == 200 && res.data != null) {
      final List responseBody = json.decode(res.data!);
      return responseBody
          .map((e) => GitRepositoryContributor.fromJson(e))
          .toList();
    } else {
      return <GitRepositoryContributor>[];
    }
  } catch (e) {
    debugPrint(e.toString());
    rethrow;
  }
}
