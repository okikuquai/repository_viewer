import 'package:flutter/cupertino.dart';
import 'package:graphql/client.dart';
import 'package:repositoryviewer/type/error_type.dart';

import '../exception_message_view.dart';

class HttpResponseError extends StatelessWidget {
  const HttpResponseError({super.key, required this.httpResponse});

  final HttpLinkServerException httpResponse;

  @override
  Widget build(BuildContext context) {
    return ExceptionMessageView(
      errorType: ErrorType.httpResponseError,
      message:
          '${httpResponse.response.statusCode.toString()}: ${httpResponse.response.reasonPhrase}',
    );
  }
}
