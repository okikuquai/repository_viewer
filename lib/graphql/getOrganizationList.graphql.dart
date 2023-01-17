import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:repositoryviewer/graphql/type/custom_id.dart';

class Variables$Query$getOrganizationList {
  factory Variables$Query$getOrganizationList({required int first}) =>
      Variables$Query$getOrganizationList._({
        r'first': first,
      });

  Variables$Query$getOrganizationList._(this._$data);

  factory Variables$Query$getOrganizationList.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$first = data['first'];
    result$data['first'] = (l$first as int);
    return Variables$Query$getOrganizationList._(result$data);
  }

  Map<String, dynamic> _$data;

  int get first => (_$data['first'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$first = first;
    result$data['first'] = l$first;
    return result$data;
  }

  CopyWith$Variables$Query$getOrganizationList<
          Variables$Query$getOrganizationList>
      get copyWith => CopyWith$Variables$Query$getOrganizationList(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getOrganizationList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    return Object.hashAll([l$first]);
  }
}

abstract class CopyWith$Variables$Query$getOrganizationList<TRes> {
  factory CopyWith$Variables$Query$getOrganizationList(
    Variables$Query$getOrganizationList instance,
    TRes Function(Variables$Query$getOrganizationList) then,
  ) = _CopyWithImpl$Variables$Query$getOrganizationList;

  factory CopyWith$Variables$Query$getOrganizationList.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getOrganizationList;

  TRes call({int? first});
}

class _CopyWithImpl$Variables$Query$getOrganizationList<TRes>
    implements CopyWith$Variables$Query$getOrganizationList<TRes> {
  _CopyWithImpl$Variables$Query$getOrganizationList(
    this._instance,
    this._then,
  );

  final Variables$Query$getOrganizationList _instance;

  final TRes Function(Variables$Query$getOrganizationList) _then;

  static const _undefined = {};

  TRes call({Object? first = _undefined}) =>
      _then(Variables$Query$getOrganizationList._({
        ..._instance._$data,
        if (first != _undefined && first != null) 'first': (first as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getOrganizationList<TRes>
    implements CopyWith$Variables$Query$getOrganizationList<TRes> {
  _CopyWithStubImpl$Variables$Query$getOrganizationList(this._res);

  TRes _res;

  call({int? first}) => _res;
}

class Query$getOrganizationList {
  Query$getOrganizationList({
    required this.viewer,
    required this.$__typename,
  });

  factory Query$getOrganizationList.fromJson(Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$__typename = json['__typename'];
    return Query$getOrganizationList(
      viewer: Query$getOrganizationList$viewer.fromJson(
          (l$viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getOrganizationList$viewer viewer;

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
    if (!(other is Query$getOrganizationList) ||
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

extension UtilityExtension$Query$getOrganizationList
    on Query$getOrganizationList {
  CopyWith$Query$getOrganizationList<Query$getOrganizationList> get copyWith =>
      CopyWith$Query$getOrganizationList(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getOrganizationList<TRes> {
  factory CopyWith$Query$getOrganizationList(
    Query$getOrganizationList instance,
    TRes Function(Query$getOrganizationList) then,
  ) = _CopyWithImpl$Query$getOrganizationList;

  factory CopyWith$Query$getOrganizationList.stub(TRes res) =
      _CopyWithStubImpl$Query$getOrganizationList;

  TRes call({
    Query$getOrganizationList$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Query$getOrganizationList$viewer<TRes> get viewer;
}

class _CopyWithImpl$Query$getOrganizationList<TRes>
    implements CopyWith$Query$getOrganizationList<TRes> {
  _CopyWithImpl$Query$getOrganizationList(
    this._instance,
    this._then,
  );

  final Query$getOrganizationList _instance;

  final TRes Function(Query$getOrganizationList) _then;

  static const _undefined = {};

  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOrganizationList(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Query$getOrganizationList$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOrganizationList$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Query$getOrganizationList$viewer(
        local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Query$getOrganizationList<TRes>
    implements CopyWith$Query$getOrganizationList<TRes> {
  _CopyWithStubImpl$Query$getOrganizationList(this._res);

  TRes _res;

  call({
    Query$getOrganizationList$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOrganizationList$viewer<TRes> get viewer =>
      CopyWith$Query$getOrganizationList$viewer.stub(_res);
}

const documentNodeQuerygetOrganizationList = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getOrganizationList'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'first')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'viewer'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'organizations'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: VariableNode(name: NameNode(value: 'first')),
              )
            ],
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
                        name: NameNode(value: 'name'),
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
Query$getOrganizationList _parserFn$Query$getOrganizationList(
        Map<String, dynamic> data) =>
    Query$getOrganizationList.fromJson(data);

class Options$Query$getOrganizationList
    extends graphql.QueryOptions<Query$getOrganizationList> {
  Options$Query$getOrganizationList({
    String? operationName,
    required Variables$Query$getOrganizationList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerygetOrganizationList,
          parserFn: _parserFn$Query$getOrganizationList,
        );
}

class WatchOptions$Query$getOrganizationList
    extends graphql.WatchQueryOptions<Query$getOrganizationList> {
  WatchOptions$Query$getOrganizationList({
    String? operationName,
    required Variables$Query$getOrganizationList variables,
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
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQuerygetOrganizationList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getOrganizationList,
        );
}

class FetchMoreOptions$Query$getOrganizationList
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getOrganizationList({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getOrganizationList variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetOrganizationList,
        );
}

extension ClientExtension$Query$getOrganizationList on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getOrganizationList>>
      query$getOrganizationList(
              Options$Query$getOrganizationList options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getOrganizationList>
      watchQuery$getOrganizationList(
              WatchOptions$Query$getOrganizationList options) =>
          this.watchQuery(options);
  void writeQuery$getOrganizationList({
    required Query$getOrganizationList data,
    required Variables$Query$getOrganizationList variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetOrganizationList),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getOrganizationList? readQuery$getOrganizationList({
    required Variables$Query$getOrganizationList variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetOrganizationList),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getOrganizationList.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getOrganizationList>
    useQuery$getOrganizationList(Options$Query$getOrganizationList options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getOrganizationList>
    useWatchQuery$getOrganizationList(
            WatchOptions$Query$getOrganizationList options) =>
        graphql_flutter.useWatchQuery(options);

class Query$getOrganizationList$Widget
    extends graphql_flutter.Query<Query$getOrganizationList> {
  Query$getOrganizationList$Widget({
    widgets.Key? key,
    required Options$Query$getOrganizationList options,
    required graphql_flutter.QueryBuilder<Query$getOrganizationList> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$getOrganizationList$viewer {
  Query$getOrganizationList$viewer({
    required this.organizations,
    required this.$__typename,
  });

  factory Query$getOrganizationList$viewer.fromJson(Map<String, dynamic> json) {
    final l$organizations = json['organizations'];
    final l$$__typename = json['__typename'];
    return Query$getOrganizationList$viewer(
      organizations: Query$getOrganizationList$viewer$organizations.fromJson(
          (l$organizations as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getOrganizationList$viewer$organizations organizations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$organizations = organizations;
    _resultData['organizations'] = l$organizations.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$organizations = organizations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$organizations,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOrganizationList$viewer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$organizations = organizations;
    final lOther$organizations = other.organizations;
    if (l$organizations != lOther$organizations) {
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

extension UtilityExtension$Query$getOrganizationList$viewer
    on Query$getOrganizationList$viewer {
  CopyWith$Query$getOrganizationList$viewer<Query$getOrganizationList$viewer>
      get copyWith => CopyWith$Query$getOrganizationList$viewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOrganizationList$viewer<TRes> {
  factory CopyWith$Query$getOrganizationList$viewer(
    Query$getOrganizationList$viewer instance,
    TRes Function(Query$getOrganizationList$viewer) then,
  ) = _CopyWithImpl$Query$getOrganizationList$viewer;

  factory CopyWith$Query$getOrganizationList$viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$getOrganizationList$viewer;

  TRes call({
    Query$getOrganizationList$viewer$organizations? organizations,
    String? $__typename,
  });
  CopyWith$Query$getOrganizationList$viewer$organizations<TRes>
      get organizations;
}

class _CopyWithImpl$Query$getOrganizationList$viewer<TRes>
    implements CopyWith$Query$getOrganizationList$viewer<TRes> {
  _CopyWithImpl$Query$getOrganizationList$viewer(
    this._instance,
    this._then,
  );

  final Query$getOrganizationList$viewer _instance;

  final TRes Function(Query$getOrganizationList$viewer) _then;

  static const _undefined = {};

  TRes call({
    Object? organizations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOrganizationList$viewer(
        organizations: organizations == _undefined || organizations == null
            ? _instance.organizations
            : (organizations as Query$getOrganizationList$viewer$organizations),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOrganizationList$viewer$organizations<TRes>
      get organizations {
    final local$organizations = _instance.organizations;
    return CopyWith$Query$getOrganizationList$viewer$organizations(
        local$organizations, (e) => call(organizations: e));
  }
}

class _CopyWithStubImpl$Query$getOrganizationList$viewer<TRes>
    implements CopyWith$Query$getOrganizationList$viewer<TRes> {
  _CopyWithStubImpl$Query$getOrganizationList$viewer(this._res);

  TRes _res;

  call({
    Query$getOrganizationList$viewer$organizations? organizations,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOrganizationList$viewer$organizations<TRes>
      get organizations =>
          CopyWith$Query$getOrganizationList$viewer$organizations.stub(_res);
}

class Query$getOrganizationList$viewer$organizations {
  Query$getOrganizationList$viewer$organizations({
    this.edges,
    required this.$__typename,
  });

  factory Query$getOrganizationList$viewer$organizations.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$getOrganizationList$viewer$organizations(
      edges: (l$edges as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$getOrganizationList$viewer$organizations$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$getOrganizationList$viewer$organizations$edges?>? edges;

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
    if (!(other is Query$getOrganizationList$viewer$organizations) ||
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

extension UtilityExtension$Query$getOrganizationList$viewer$organizations
    on Query$getOrganizationList$viewer$organizations {
  CopyWith$Query$getOrganizationList$viewer$organizations<
          Query$getOrganizationList$viewer$organizations>
      get copyWith => CopyWith$Query$getOrganizationList$viewer$organizations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOrganizationList$viewer$organizations<TRes> {
  factory CopyWith$Query$getOrganizationList$viewer$organizations(
    Query$getOrganizationList$viewer$organizations instance,
    TRes Function(Query$getOrganizationList$viewer$organizations) then,
  ) = _CopyWithImpl$Query$getOrganizationList$viewer$organizations;

  factory CopyWith$Query$getOrganizationList$viewer$organizations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOrganizationList$viewer$organizations;

  TRes call({
    List<Query$getOrganizationList$viewer$organizations$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$getOrganizationList$viewer$organizations$edges?>? Function(
              Iterable<
                  CopyWith$Query$getOrganizationList$viewer$organizations$edges<
                      Query$getOrganizationList$viewer$organizations$edges>?>?)
          _fn);
}

class _CopyWithImpl$Query$getOrganizationList$viewer$organizations<TRes>
    implements CopyWith$Query$getOrganizationList$viewer$organizations<TRes> {
  _CopyWithImpl$Query$getOrganizationList$viewer$organizations(
    this._instance,
    this._then,
  );

  final Query$getOrganizationList$viewer$organizations _instance;

  final TRes Function(Query$getOrganizationList$viewer$organizations) _then;

  static const _undefined = {};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOrganizationList$viewer$organizations(
        edges: edges == _undefined
            ? _instance.edges
            : (edges as List<
                Query$getOrganizationList$viewer$organizations$edges?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes edges(
          Iterable<Query$getOrganizationList$viewer$organizations$edges?>? Function(
                  Iterable<
                      CopyWith$Query$getOrganizationList$viewer$organizations$edges<
                          Query$getOrganizationList$viewer$organizations$edges>?>?)
              _fn) =>
      call(
          edges: _fn(_instance.edges?.map((e) => e == null
              ? null
              : CopyWith$Query$getOrganizationList$viewer$organizations$edges(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$getOrganizationList$viewer$organizations<TRes>
    implements CopyWith$Query$getOrganizationList$viewer$organizations<TRes> {
  _CopyWithStubImpl$Query$getOrganizationList$viewer$organizations(this._res);

  TRes _res;

  call({
    List<Query$getOrganizationList$viewer$organizations$edges?>? edges,
    String? $__typename,
  }) =>
      _res;
  edges(_fn) => _res;
}

class Query$getOrganizationList$viewer$organizations$edges {
  Query$getOrganizationList$viewer$organizations$edges({
    this.node,
    required this.$__typename,
  });

  factory Query$getOrganizationList$viewer$organizations$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$getOrganizationList$viewer$organizations$edges(
      node: l$node == null
          ? null
          : Query$getOrganizationList$viewer$organizations$edges$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getOrganizationList$viewer$organizations$edges$node? node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
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
    if (!(other is Query$getOrganizationList$viewer$organizations$edges) ||
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

extension UtilityExtension$Query$getOrganizationList$viewer$organizations$edges
    on Query$getOrganizationList$viewer$organizations$edges {
  CopyWith$Query$getOrganizationList$viewer$organizations$edges<
          Query$getOrganizationList$viewer$organizations$edges>
      get copyWith =>
          CopyWith$Query$getOrganizationList$viewer$organizations$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOrganizationList$viewer$organizations$edges<
    TRes> {
  factory CopyWith$Query$getOrganizationList$viewer$organizations$edges(
    Query$getOrganizationList$viewer$organizations$edges instance,
    TRes Function(Query$getOrganizationList$viewer$organizations$edges) then,
  ) = _CopyWithImpl$Query$getOrganizationList$viewer$organizations$edges;

  factory CopyWith$Query$getOrganizationList$viewer$organizations$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOrganizationList$viewer$organizations$edges;

  TRes call({
    Query$getOrganizationList$viewer$organizations$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$getOrganizationList$viewer$organizations$edges$node<TRes>
      get node;
}

class _CopyWithImpl$Query$getOrganizationList$viewer$organizations$edges<TRes>
    implements
        CopyWith$Query$getOrganizationList$viewer$organizations$edges<TRes> {
  _CopyWithImpl$Query$getOrganizationList$viewer$organizations$edges(
    this._instance,
    this._then,
  );

  final Query$getOrganizationList$viewer$organizations$edges _instance;

  final TRes Function(Query$getOrganizationList$viewer$organizations$edges)
      _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOrganizationList$viewer$organizations$edges(
        node: node == _undefined
            ? _instance.node
            : (node
                as Query$getOrganizationList$viewer$organizations$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOrganizationList$viewer$organizations$edges$node<TRes>
      get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$getOrganizationList$viewer$organizations$edges$node
            .stub(_then(_instance))
        : CopyWith$Query$getOrganizationList$viewer$organizations$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$getOrganizationList$viewer$organizations$edges<
        TRes>
    implements
        CopyWith$Query$getOrganizationList$viewer$organizations$edges<TRes> {
  _CopyWithStubImpl$Query$getOrganizationList$viewer$organizations$edges(
      this._res);

  TRes _res;

  call({
    Query$getOrganizationList$viewer$organizations$edges$node? node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOrganizationList$viewer$organizations$edges$node<TRes>
      get node =>
          CopyWith$Query$getOrganizationList$viewer$organizations$edges$node
              .stub(_res);
}

class Query$getOrganizationList$viewer$organizations$edges$node {
  Query$getOrganizationList$viewer$organizations$edges$node({
    required this.id,
    this.name,
    required this.$__typename,
  });

  factory Query$getOrganizationList$viewer$organizations$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getOrganizationList$viewer$organizations$edges$node(
      id: githubAPIIDFromJson(l$id),
      name: (l$name as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final GithubAPIID id;

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = githubAPIIDToJson(l$id);
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOrganizationList$viewer$organizations$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
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

extension UtilityExtension$Query$getOrganizationList$viewer$organizations$edges$node
    on Query$getOrganizationList$viewer$organizations$edges$node {
  CopyWith$Query$getOrganizationList$viewer$organizations$edges$node<
          Query$getOrganizationList$viewer$organizations$edges$node>
      get copyWith =>
          CopyWith$Query$getOrganizationList$viewer$organizations$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOrganizationList$viewer$organizations$edges$node<
    TRes> {
  factory CopyWith$Query$getOrganizationList$viewer$organizations$edges$node(
    Query$getOrganizationList$viewer$organizations$edges$node instance,
    TRes Function(Query$getOrganizationList$viewer$organizations$edges$node)
        then,
  ) = _CopyWithImpl$Query$getOrganizationList$viewer$organizations$edges$node;

  factory CopyWith$Query$getOrganizationList$viewer$organizations$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOrganizationList$viewer$organizations$edges$node;

  TRes call({
    GithubAPIID? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOrganizationList$viewer$organizations$edges$node<
        TRes>
    implements
        CopyWith$Query$getOrganizationList$viewer$organizations$edges$node<
            TRes> {
  _CopyWithImpl$Query$getOrganizationList$viewer$organizations$edges$node(
    this._instance,
    this._then,
  );

  final Query$getOrganizationList$viewer$organizations$edges$node _instance;

  final TRes Function(Query$getOrganizationList$viewer$organizations$edges$node)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOrganizationList$viewer$organizations$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as GithubAPIID),
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getOrganizationList$viewer$organizations$edges$node<
        TRes>
    implements
        CopyWith$Query$getOrganizationList$viewer$organizations$edges$node<
            TRes> {
  _CopyWithStubImpl$Query$getOrganizationList$viewer$organizations$edges$node(
      this._res);

  TRes _res;

  call({
    GithubAPIID? id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}
