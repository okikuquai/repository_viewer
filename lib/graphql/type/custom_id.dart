import 'package:string_validator/string_validator.dart';

class GithubAPIID {
  final String idString;
  GithubAPIID(this.idString){
    assert(isBase64(idString) || RegExp('^._[!-~]{10}\$').hasMatch(idString));
  }
}

GithubAPIID githubAPIIDFromJson(dynamic data) => GithubAPIID(data as String);
dynamic githubAPIIDToJson(GithubAPIID id) => id.idString;