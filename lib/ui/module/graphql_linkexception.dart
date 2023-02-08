
import 'package:flutter/cupertino.dart';
import 'package:graphql/client.dart';
import 'package:repositoryviewer/type/error_type.dart';

import '../exception_message_view.dart';

class GraphQLLinkException extends StatelessWidget {
  const GraphQLLinkException({super.key, this.exception});

  final LinkException? exception;
  @override
  Widget build(BuildContext context) {
    if (exception?.runtimeType == ServerException) {
      //https://pub.dev/documentation/gql_link/latest/link/ServerException-class.html
      return const ExceptionMessageView(errorType: ErrorType.networkError,);
    } else if (exception?.runtimeType == ContextReadException) {
      //https://pub.dev/documentation/gql_link/latest/link/ContextReadException-class.html
      return const ExceptionMessageView(errorType: ErrorType.internalError);
    } else if (exception?.runtimeType == ContextWriteException) {
      // https://pub.dev/documentation/gql_link/latest/link/ContextWriteException-class.html
      return const ExceptionMessageView(errorType: ErrorType.internalError);
    } else if (exception?.runtimeType == RequestFormatException) {
      //https://pub.dev/documentation/gql_link/latest/link/RequestFormatException-class.html
      return const ExceptionMessageView(errorType: ErrorType.internalError);
    } else if (exception?.runtimeType == ResponseFormatException) {
      //https://pub.dev/documentation/gql_link/latest/link/ResponseFormatException-class.html
      return const ExceptionMessageView(errorType: ErrorType.internalError);
    }
    return const ExceptionMessageView(errorType: ErrorType.unknown,);
  }

}