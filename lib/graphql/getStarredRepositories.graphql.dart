import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$getStarredRepositories {
  Query$getStarredRepositories({
    required this.viewer,
    required this.$__typename,
  });

  factory Query$getStarredRepositories.fromJson(Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$__typename = json['__typename'];
    return Query$getStarredRepositories(
      viewer: Query$getStarredRepositories$viewer.fromJson(
          (l$viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getStarredRepositories$viewer viewer;

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
    if (!(other is Query$getStarredRepositories) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$getStarredRepositories
    on Query$getStarredRepositories {
  CopyWith$Query$getStarredRepositories<Query$getStarredRepositories>
      get copyWith => CopyWith$Query$getStarredRepositories(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getStarredRepositories<TRes> {
  factory CopyWith$Query$getStarredRepositories(
    Query$getStarredRepositories instance,
    TRes Function(Query$getStarredRepositories) then,
  ) = _CopyWithImpl$Query$getStarredRepositories;

  factory CopyWith$Query$getStarredRepositories.stub(TRes res) =
      _CopyWithStubImpl$Query$getStarredRepositories;

  TRes call({
    Query$getStarredRepositories$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Query$getStarredRepositories$viewer<TRes> get viewer;
}

class _CopyWithImpl$Query$getStarredRepositories<TRes>
    implements CopyWith$Query$getStarredRepositories<TRes> {
  _CopyWithImpl$Query$getStarredRepositories(
    this._instance,
    this._then,
  );

  final Query$getStarredRepositories _instance;

  final TRes Function(Query$getStarredRepositories) _then;

  static const _undefined = {};

  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getStarredRepositories(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Query$getStarredRepositories$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getStarredRepositories$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Query$getStarredRepositories$viewer(
        local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Query$getStarredRepositories<TRes>
    implements CopyWith$Query$getStarredRepositories<TRes> {
  _CopyWithStubImpl$Query$getStarredRepositories(this._res);

  TRes _res;

  call({
    Query$getStarredRepositories$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getStarredRepositories$viewer<TRes> get viewer =>
      CopyWith$Query$getStarredRepositories$viewer.stub(_res);
}

const documentNodeQuerygetStarredRepositories = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getStarredRepositories'),
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
            name: NameNode(value: 'login'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'starredRepositories'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'edges'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'node'),
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
Query$getStarredRepositories _parserFn$Query$getStarredRepositories(
        Map<String, dynamic> data) =>
    Query$getStarredRepositories.fromJson(data);

class Options$Query$getStarredRepositories
    extends graphql.QueryOptions<Query$getStarredRepositories> {
  Options$Query$getStarredRepositories({
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
          document: documentNodeQuerygetStarredRepositories,
          parserFn: _parserFn$Query$getStarredRepositories,
        );
}

class WatchOptions$Query$getStarredRepositories
    extends graphql.WatchQueryOptions<Query$getStarredRepositories> {
  WatchOptions$Query$getStarredRepositories({
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
          document: documentNodeQuerygetStarredRepositories,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getStarredRepositories,
        );
}

class FetchMoreOptions$Query$getStarredRepositories
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getStarredRepositories(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerygetStarredRepositories,
        );
}

extension ClientExtension$Query$getStarredRepositories
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getStarredRepositories>>
      query$getStarredRepositories(
              [Options$Query$getStarredRepositories? options]) async =>
          await this.query(options ?? Options$Query$getStarredRepositories());
  graphql.ObservableQuery<
      Query$getStarredRepositories> watchQuery$getStarredRepositories(
          [WatchOptions$Query$getStarredRepositories? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getStarredRepositories());
  void writeQuery$getStarredRepositories({
    required Query$getStarredRepositories data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQuerygetStarredRepositories)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getStarredRepositories? readQuery$getStarredRepositories(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetStarredRepositories)),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getStarredRepositories.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getStarredRepositories>
    useQuery$getStarredRepositories(
            [Options$Query$getStarredRepositories? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$getStarredRepositories());
graphql.ObservableQuery<Query$getStarredRepositories>
    useWatchQuery$getStarredRepositories(
            [WatchOptions$Query$getStarredRepositories? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$getStarredRepositories());

class Query$getStarredRepositories$Widget
    extends graphql_flutter.Query<Query$getStarredRepositories> {
  Query$getStarredRepositories$Widget({
    widgets.Key? key,
    Options$Query$getStarredRepositories? options,
    required graphql_flutter.QueryBuilder<Query$getStarredRepositories> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$getStarredRepositories(),
          builder: builder,
        );
}

class Query$getStarredRepositories$viewer {
  Query$getStarredRepositories$viewer({
    required this.login,
    required this.starredRepositories,
    required this.$__typename,
  });

  factory Query$getStarredRepositories$viewer.fromJson(
      Map<String, dynamic> json) {
    final l$login = json['login'];
    final l$starredRepositories = json['starredRepositories'];
    final l$$__typename = json['__typename'];
    return Query$getStarredRepositories$viewer(
      login: (l$login as String),
      starredRepositories:
          Query$getStarredRepositories$viewer$starredRepositories.fromJson(
              (l$starredRepositories as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String login;

  final Query$getStarredRepositories$viewer$starredRepositories
      starredRepositories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$login = login;
    _resultData['login'] = l$login;
    final l$starredRepositories = starredRepositories;
    _resultData['starredRepositories'] = l$starredRepositories.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$login = login;
    final l$starredRepositories = starredRepositories;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$login,
      l$starredRepositories,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getStarredRepositories$viewer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$login = login;
    final lOther$login = other.login;
    if (l$login != lOther$login) {
      return false;
    }
    final l$starredRepositories = starredRepositories;
    final lOther$starredRepositories = other.starredRepositories;
    if (l$starredRepositories != lOther$starredRepositories) {
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

extension UtilityExtension$Query$getStarredRepositories$viewer
    on Query$getStarredRepositories$viewer {
  CopyWith$Query$getStarredRepositories$viewer<
          Query$getStarredRepositories$viewer>
      get copyWith => CopyWith$Query$getStarredRepositories$viewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getStarredRepositories$viewer<TRes> {
  factory CopyWith$Query$getStarredRepositories$viewer(
    Query$getStarredRepositories$viewer instance,
    TRes Function(Query$getStarredRepositories$viewer) then,
  ) = _CopyWithImpl$Query$getStarredRepositories$viewer;

  factory CopyWith$Query$getStarredRepositories$viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$getStarredRepositories$viewer;

  TRes call({
    String? login,
    Query$getStarredRepositories$viewer$starredRepositories?
        starredRepositories,
    String? $__typename,
  });
  CopyWith$Query$getStarredRepositories$viewer$starredRepositories<TRes>
      get starredRepositories;
}

class _CopyWithImpl$Query$getStarredRepositories$viewer<TRes>
    implements CopyWith$Query$getStarredRepositories$viewer<TRes> {
  _CopyWithImpl$Query$getStarredRepositories$viewer(
    this._instance,
    this._then,
  );

  final Query$getStarredRepositories$viewer _instance;

  final TRes Function(Query$getStarredRepositories$viewer) _then;

  static const _undefined = {};

  TRes call({
    Object? login = _undefined,
    Object? starredRepositories = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getStarredRepositories$viewer(
        login: login == _undefined || login == null
            ? _instance.login
            : (login as String),
        starredRepositories:
            starredRepositories == _undefined || starredRepositories == null
                ? _instance.starredRepositories
                : (starredRepositories
                    as Query$getStarredRepositories$viewer$starredRepositories),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getStarredRepositories$viewer$starredRepositories<TRes>
      get starredRepositories {
    final local$starredRepositories = _instance.starredRepositories;
    return CopyWith$Query$getStarredRepositories$viewer$starredRepositories(
        local$starredRepositories, (e) => call(starredRepositories: e));
  }
}

class _CopyWithStubImpl$Query$getStarredRepositories$viewer<TRes>
    implements CopyWith$Query$getStarredRepositories$viewer<TRes> {
  _CopyWithStubImpl$Query$getStarredRepositories$viewer(this._res);

  TRes _res;

  call({
    String? login,
    Query$getStarredRepositories$viewer$starredRepositories?
        starredRepositories,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getStarredRepositories$viewer$starredRepositories<TRes>
      get starredRepositories =>
          CopyWith$Query$getStarredRepositories$viewer$starredRepositories.stub(
              _res);
}

class Query$getStarredRepositories$viewer$starredRepositories {
  Query$getStarredRepositories$viewer$starredRepositories({
    this.edges,
    required this.$__typename,
  });

  factory Query$getStarredRepositories$viewer$starredRepositories.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$getStarredRepositories$viewer$starredRepositories(
      edges: (l$edges as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$getStarredRepositories$viewer$starredRepositories$edges
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$getStarredRepositories$viewer$starredRepositories$edges?>?
      edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$edges == null ? null : Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getStarredRepositories$viewer$starredRepositories) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges != null && lOther$edges != null) {
      if (l$edges.length != lOther$edges.length) {
        return false;
      }
      for (int i = 0; i < l$edges.length; i++) {
        final l$edges$entry = l$edges[i];
        final lOther$edges$entry = lOther$edges[i];
        if (l$edges$entry != lOther$edges$entry) {
          return false;
        }
      }
    } else if (l$edges != lOther$edges) {
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

extension UtilityExtension$Query$getStarredRepositories$viewer$starredRepositories
    on Query$getStarredRepositories$viewer$starredRepositories {
  CopyWith$Query$getStarredRepositories$viewer$starredRepositories<
          Query$getStarredRepositories$viewer$starredRepositories>
      get copyWith =>
          CopyWith$Query$getStarredRepositories$viewer$starredRepositories(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getStarredRepositories$viewer$starredRepositories<
    TRes> {
  factory CopyWith$Query$getStarredRepositories$viewer$starredRepositories(
    Query$getStarredRepositories$viewer$starredRepositories instance,
    TRes Function(Query$getStarredRepositories$viewer$starredRepositories) then,
  ) = _CopyWithImpl$Query$getStarredRepositories$viewer$starredRepositories;

  factory CopyWith$Query$getStarredRepositories$viewer$starredRepositories.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getStarredRepositories$viewer$starredRepositories;

  TRes call({
    List<Query$getStarredRepositories$viewer$starredRepositories$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$getStarredRepositories$viewer$starredRepositories$edges?>? Function(
              Iterable<
                  CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges<
                      Query$getStarredRepositories$viewer$starredRepositories$edges>?>?)
          _fn);
}

class _CopyWithImpl$Query$getStarredRepositories$viewer$starredRepositories<
        TRes>
    implements
        CopyWith$Query$getStarredRepositories$viewer$starredRepositories<TRes> {
  _CopyWithImpl$Query$getStarredRepositories$viewer$starredRepositories(
    this._instance,
    this._then,
  );

  final Query$getStarredRepositories$viewer$starredRepositories _instance;

  final TRes Function(Query$getStarredRepositories$viewer$starredRepositories)
      _then;

  static const _undefined = {};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getStarredRepositories$viewer$starredRepositories(
        edges: edges == _undefined
            ? _instance.edges
            : (edges as List<
                Query$getStarredRepositories$viewer$starredRepositories$edges?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes edges(
          Iterable<Query$getStarredRepositories$viewer$starredRepositories$edges?>? Function(
                  Iterable<
                      CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges<
                          Query$getStarredRepositories$viewer$starredRepositories$edges>?>?)
              _fn) =>
      call(
          edges: _fn(_instance.edges?.map((e) => e == null
              ? null
              : CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$getStarredRepositories$viewer$starredRepositories<
        TRes>
    implements
        CopyWith$Query$getStarredRepositories$viewer$starredRepositories<TRes> {
  _CopyWithStubImpl$Query$getStarredRepositories$viewer$starredRepositories(
      this._res);

  TRes _res;

  call({
    List<Query$getStarredRepositories$viewer$starredRepositories$edges?>? edges,
    String? $__typename,
  }) =>
      _res;
  edges(_fn) => _res;
}

class Query$getStarredRepositories$viewer$starredRepositories$edges {
  Query$getStarredRepositories$viewer$starredRepositories$edges({
    required this.node,
    required this.$__typename,
  });

  factory Query$getStarredRepositories$viewer$starredRepositories$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$getStarredRepositories$viewer$starredRepositories$edges(
      node: Query$getStarredRepositories$viewer$starredRepositories$edges$node
          .fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getStarredRepositories$viewer$starredRepositories$edges$node node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getStarredRepositories$viewer$starredRepositories$edges) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
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

extension UtilityExtension$Query$getStarredRepositories$viewer$starredRepositories$edges
    on Query$getStarredRepositories$viewer$starredRepositories$edges {
  CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges<
          Query$getStarredRepositories$viewer$starredRepositories$edges>
      get copyWith =>
          CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges<
    TRes> {
  factory CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges(
    Query$getStarredRepositories$viewer$starredRepositories$edges instance,
    TRes Function(Query$getStarredRepositories$viewer$starredRepositories$edges)
        then,
  ) = _CopyWithImpl$Query$getStarredRepositories$viewer$starredRepositories$edges;

  factory CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getStarredRepositories$viewer$starredRepositories$edges;

  TRes call({
    Query$getStarredRepositories$viewer$starredRepositories$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges$node<
      TRes> get node;
}

class _CopyWithImpl$Query$getStarredRepositories$viewer$starredRepositories$edges<
        TRes>
    implements
        CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges<
            TRes> {
  _CopyWithImpl$Query$getStarredRepositories$viewer$starredRepositories$edges(
    this._instance,
    this._then,
  );

  final Query$getStarredRepositories$viewer$starredRepositories$edges _instance;

  final TRes Function(
      Query$getStarredRepositories$viewer$starredRepositories$edges) _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getStarredRepositories$viewer$starredRepositories$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node
                as Query$getStarredRepositories$viewer$starredRepositories$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges$node<
      TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$getStarredRepositories$viewer$starredRepositories$edges<
        TRes>
    implements
        CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges<
            TRes> {
  _CopyWithStubImpl$Query$getStarredRepositories$viewer$starredRepositories$edges(
      this._res);

  TRes _res;

  call({
    Query$getStarredRepositories$viewer$starredRepositories$edges$node? node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges$node<
          TRes>
      get node =>
          CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges$node
              .stub(_res);
}

class Query$getStarredRepositories$viewer$starredRepositories$edges$node {
  Query$getStarredRepositories$viewer$starredRepositories$edges$node({
    required this.id,
    required this.$__typename,
  });

  factory Query$getStarredRepositories$viewer$starredRepositories$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getStarredRepositories$viewer$starredRepositories$edges$node(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    if (!(other
            is Query$getStarredRepositories$viewer$starredRepositories$edges$node) ||
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

extension UtilityExtension$Query$getStarredRepositories$viewer$starredRepositories$edges$node
    on Query$getStarredRepositories$viewer$starredRepositories$edges$node {
  CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges$node<
          Query$getStarredRepositories$viewer$starredRepositories$edges$node>
      get copyWith =>
          CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges$node<
    TRes> {
  factory CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges$node(
    Query$getStarredRepositories$viewer$starredRepositories$edges$node instance,
    TRes Function(
            Query$getStarredRepositories$viewer$starredRepositories$edges$node)
        then,
  ) = _CopyWithImpl$Query$getStarredRepositories$viewer$starredRepositories$edges$node;

  factory CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getStarredRepositories$viewer$starredRepositories$edges$node;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getStarredRepositories$viewer$starredRepositories$edges$node<
        TRes>
    implements
        CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges$node<
            TRes> {
  _CopyWithImpl$Query$getStarredRepositories$viewer$starredRepositories$edges$node(
    this._instance,
    this._then,
  );

  final Query$getStarredRepositories$viewer$starredRepositories$edges$node
      _instance;

  final TRes Function(
      Query$getStarredRepositories$viewer$starredRepositories$edges$node) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getStarredRepositories$viewer$starredRepositories$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getStarredRepositories$viewer$starredRepositories$edges$node<
        TRes>
    implements
        CopyWith$Query$getStarredRepositories$viewer$starredRepositories$edges$node<
            TRes> {
  _CopyWithStubImpl$Query$getStarredRepositories$viewer$starredRepositories$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}
