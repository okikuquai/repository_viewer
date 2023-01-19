import 'package:string_validator/string_validator.dart';

class GithubNodeId {
  final String _idString;
  GithubNodeId(this._idString) {
    assert(isBase64(_idString) || RegExp('^._[!-~]{10}\$').hasMatch(_idString));
  }
  @override
  String toString() => _idString;

  @override
  bool operator ==(Object other) =>
      identical(other, this) || other is GithubNodeId && _idString == other._idString;

  @override
  int get hashCode => Object.hashAll([_idString]);
}

GithubNodeId githubNodeIdFromJson(dynamic data) => GithubNodeId(data as String);
dynamic githubNodeIdToJson(GithubNodeId id) => id.toString();