import 'package:string_validator/string_validator.dart';

class CustomURI {
  final String uriString;
  late final Uri uri;
  CustomURI(this.uriString){
    assert(isURL(uriString));
    uri = Uri.parse(uriString);
  }
}

CustomURI customUriFromJson(dynamic data) => CustomURI(data as String);
dynamic customUriToJson(CustomURI uri) => uri.uriString;