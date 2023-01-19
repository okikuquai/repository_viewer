import 'package:string_validator/string_validator.dart';

class GithubNodeId {
  final String _idString;
  GithubNodeId(this._idString) {
    assert(isBase64(_idString) || RegExp('^._[!-~]{10}\$').hasMatch(_idString));
  }

}

GithubNodeId githubNodeIDFromJson(dynamic data) => GithubNodeId(data as String);
dynamic githubNodeIDToJson(GithubNodeId id) => id.toString();
