import 'package:dio/dio.dart';
import 'package:repositoryviewer/client.dart';

Future<List<dynamic>> getContributor(String repo) async {
  try {
    var res = await Dio().get(
        "https://api.github.com/repos/${await GithubSetting.organization}/$repo/contributors",
        options: Options(headers: {
          "Accept": "application/vnd.github+json",
          "Authorization": "Bearer ${await GithubSetting.token}",
          "X-GitHub-Api-Version": "2022-11-28"
        }));
    if (res.statusCode == 200) {
      try {
        final data = res.data as List<dynamic>?;
        return data ?? <dynamic>[];
      } catch (e) {
        print(e);
      }
    }
  } catch (e) {
    print(e);
  }
  return <dynamic>[];
}
