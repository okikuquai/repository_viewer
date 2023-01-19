import 'package:string_validator/string_validator.dart';

class GithubNodeID {
  final String _idString;
  GithubNodeID(this._idString) {
    assert(isBase64(_idString) || RegExp('^._[!-~]{10}\$').hasMatch(_idString));
  }

}

GithubNodeID githubNodeIDFromJson(dynamic data) => GithubNodeID(data as String);
dynamic githubNodeIDToJson(GithubNodeID id) => id.toString();
