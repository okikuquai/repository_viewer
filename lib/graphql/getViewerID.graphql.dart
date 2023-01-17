import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:repositoryviewer/graphql/type/custom_id.dart';

class Query$getViewerID {
  Query$getViewerID({
    required this.viewer,
    required this.$__typename,
  });

  factory Query$getViewerID.fromJson(Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$__typename = json['__typename'];
    return Query$getViewerID(
      viewer:
          Query$getViewerID$viewer.fromJson((l$viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getViewerID$viewer viewer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$viewer = viewer;
    _resultData['viewer'] = l$viewer.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$viewer = viewer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$viewer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getViewerID) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$viewer = viewer;
    final lOther$viewer = other.viewer;
    if (l$viewer != lOther$viewer) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getViewerID on Query$getViewerID {
  CopyWith$Query$getViewerID<Query$getViewerID> get copyWith =>
      CopyWith$Query$getViewerID(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getViewerID<TRes> {
  factory CopyWith$Query$getViewerID(
    Query$getViewerID instance,
    TRes Function(Query$getViewerID) then,
  ) = _CopyWithImpl$Query$getViewerID;

  factory CopyWith$Query$getViewerID.stub(TRes res) =
      _CopyWithStubImpl$Query$getViewerID;

  TRes call({
    Query$getViewerID$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Query$getViewerID$viewer<TRes> get viewer;
}

class _CopyWithImpl$Query$getViewerID<TRes>
    implements CopyWith$Query$getViewerID<TRes> {
  _CopyWithImpl$Query$getViewerID(
    this._instance,
    this._then,
  );

  final Query$getViewerID _instance;

  final TRes Function(Query$getViewerID) _then;

  static const _undefined = {};

  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getViewerID(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Query$getViewerID$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getViewerID$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Query$getViewerID$viewer(
        local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Query$getViewerID<TRes>
    implements CopyWith$Query$getViewerID<TRes> {
  _CopyWithStubImpl$Query$getViewerID(this._res);

  TRes _res;

  call({
    Query$getViewerID$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getViewerID$viewer<TRes> get viewer =>
      CopyWith$Query$getViewerID$viewer.stub(_res);
}

const documentNodeQuerygetViewerID = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getViewerID'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'viewer'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$getViewerID _parserFn$Query$getViewerID(Map<String, dynamic> data) =>
    Query$getViewerID.fromJson(data);

class Options$Query$getViewerID
    extends graphql.QueryOptions<Query$getViewerID> {
  Options$Query$getViewerID({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerygetViewerID,
          parserFn: _parserFn$Query$getViewerID,
        );
}

class WatchOptions$Query$getViewerID
    extends graphql.WatchQueryOptions<Query$getViewerID> {
  WatchOptions$Query$getViewerID({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQuerygetViewerID,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getViewerID,
        );
}

class FetchMoreOptions$Query$getViewerID extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getViewerID({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerygetViewerID,
        );
}

extension ClientExtension$Query$getViewerID on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getViewerID>> query$getViewerID(
          [Options$Query$getViewerID? options]) async =>
      await this.query(options ?? Options$Query$getViewerID());
  graphql.ObservableQuery<Query$getViewerID> watchQuery$getViewerID(
          [WatchOptions$Query$getViewerID? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getViewerID());
  void writeQuery$getViewerID({
    required Query$getViewerID data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQuerygetViewerID)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getViewerID? readQuery$getViewerID({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerygetViewerID)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getViewerID.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getViewerID> useQuery$getViewerID(
        [Options$Query$getViewerID? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$getViewerID());
graphql.ObservableQuery<Query$getViewerID> useWatchQuery$getViewerID(
        [WatchOptions$Query$getViewerID? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$getViewerID());

class Query$getViewerID$Widget
    extends graphql_flutter.Query<Query$getViewerID> {
  Query$getViewerID$Widget({
    widgets.Key? key,
    Options$Query$getViewerID? options,
    required graphql_flutter.QueryBuilder<Query$getViewerID> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$getViewerID(),
          builder: builder,
        );
}

class Query$getViewerID$viewer {
  Query$getViewerID$viewer({
    required this.id,
    required this.$__typename,
  });

  factory Query$getViewerID$viewer.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getViewerID$viewer(
      id: githubAPIIDFromJson(l$id),
      $__typename: (l$$__typename as String),
    );
  }

  final GithubAPIID id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = githubAPIIDToJson(l$id);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getViewerID$viewer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getViewerID$viewer
    on Query$getViewerID$viewer {
  CopyWith$Query$getViewerID$viewer<Query$getViewerID$viewer> get copyWith =>
      CopyWith$Query$getViewerID$viewer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getViewerID$viewer<TRes> {
  factory CopyWith$Query$getViewerID$viewer(
    Query$getViewerID$viewer instance,
    TRes Function(Query$getViewerID$viewer) then,
  ) = _CopyWithImpl$Query$getViewerID$viewer;

  factory CopyWith$Query$getViewerID$viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$getViewerID$viewer;

  TRes call({
    GithubAPIID? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getViewerID$viewer<TRes>
    implements CopyWith$Query$getViewerID$viewer<TRes> {
  _CopyWithImpl$Query$getViewerID$viewer(
    this._instance,
    this._then,
  );

  final Query$getViewerID$viewer _instance;

  final TRes Function(Query$getViewerID$viewer) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getViewerID$viewer(
        id: id == _undefined || id == null ? _instance.id : (id as GithubAPIID),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getViewerID$viewer<TRes>
    implements CopyWith$Query$getViewerID$viewer<TRes> {
  _CopyWithStubImpl$Query$getViewerID$viewer(this._res);

  TRes _res;

  call({
    GithubAPIID? id,
    String? $__typename,
  }) =>
      _res;
}
