import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

Future<List<Contributor>?> getContributor(
    String repo, String token, String organization) async {
  try {
    var res = await Dio()
        .get('https://api.github.com/repos/$organization/$repo/contributors',
            options: Options(headers: {
        'Accept': 'application/vnd.github+json',
        'Authorization': 'Bearer $token',
        'X-GitHub-Api-Version': '2022-11-28'
            }));
    if (res.statusCode == 200 && res.data != null) {
      try {
        final data = res.data! as List<dynamic>;

        return data
            .map((e) =>
                Contributor(avatarURL: e['avatar_url'], nodeID: e['node_id']))
            .toList();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return <Contributor>[];
}

class Contributor {
  String? nodeID;
  String? avatarURL;

  Contributor({required this.avatarURL, required this.nodeID});
}
