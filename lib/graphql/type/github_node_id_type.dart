import 'package:string_validator/string_validator.dart';

class GithubNodeID {
  final String idString;
  GithubNodeID(this.idString){
    assert(isBase64(idString) || RegExp('^._[!-~]{10}\$').hasMatch(idString));
  }
}

GithubNodeID githubNodeIDFromJson(dynamic data) => GithubNodeID(data as String);
dynamic githubAPIIDToJson(GithubNodeID id) => id.idString;