import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:repositoryviewer/type/git_repository_contributor.dart';

Future<List<GitRepositoryContributor>> getContributor(
    String repo, String token, String orgName) async {
  try {
    var res = await Dio()
        .get('https://api.github.com/repos/$orgName/$repo/contributors',
            options: Options(headers: {
              'Accept': 'application/vnd.github+json',
              'Authorization': 'Bearer $token',
              'X-GitHub-Api-Version': '2022-11-28'
            }));
    if (res.statusCode == 200 && res.data != null) {
      try {
        final data = jsonDecode(res.data!);
        return data.map((e) => GitRepositoryContributor.fromJson(e)).toList();
      } catch (e) {
        debugPrint(e.toString());
        rethrow;
      }
    }
  } catch (e) {
    debugPrint(e.toString());
    rethrow;
  }
  throw NullThrownError();
}