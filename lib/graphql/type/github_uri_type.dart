//型はdartのUriを使用する
Uri uriFromJson(dynamic data) => Uri.parse(data as String);
dynamic uriToJson(Uri uri) => uri.toString();
