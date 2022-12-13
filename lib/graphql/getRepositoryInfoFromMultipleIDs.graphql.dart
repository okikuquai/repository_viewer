import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$RepositoryData {
  Fragment$RepositoryData({
    required this.id,
    required this.name,
    required this.url,
    this.description,
    required this.$__typename,
  });

  factory Fragment$RepositoryData.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$url = json['url'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Fragment$RepositoryData(
      id: (l$id as String),
      name: (l$name as String),
      url: (l$url as String),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String url;

  final String? description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$url = url;
    _resultData['url'] = l$url;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$url = url;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$url,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$RepositoryData) ||
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
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Fragment$RepositoryData on Fragment$RepositoryData {
  CopyWith$Fragment$RepositoryData<Fragment$RepositoryData> get copyWith =>
      CopyWith$Fragment$RepositoryData(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$RepositoryData<TRes> {
  factory CopyWith$Fragment$RepositoryData(
    Fragment$RepositoryData instance,
    TRes Function(Fragment$RepositoryData) then,
  ) = _CopyWithImpl$Fragment$RepositoryData;

  factory CopyWith$Fragment$RepositoryData.stub(TRes res) =
      _CopyWithStubImpl$Fragment$RepositoryData;

  TRes call({
    String? id,
    String? name,
    String? url,
    String? description,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$RepositoryData<TRes>
    implements CopyWith$Fragment$RepositoryData<TRes> {
  _CopyWithImpl$Fragment$RepositoryData(
    this._instance,
    this._then,
  );

  final Fragment$RepositoryData _instance;

  final TRes Function(Fragment$RepositoryData) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? url = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$RepositoryData(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$RepositoryData<TRes>
    implements CopyWith$Fragment$RepositoryData<TRes> {
  _CopyWithStubImpl$Fragment$RepositoryData(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? url,
    String? description,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionRepositoryData = FragmentDefinitionNode(
  name: NameNode(value: 'RepositoryData'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Repository'),
    isNonNull: false,
  )),
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
      name: NameNode(value: 'url'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'description'),
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
);
const documentNodeFragmentRepositoryData = DocumentNode(definitions: [
  fragmentDefinitionRepositoryData,
]);

extension ClientExtension$Fragment$RepositoryData on graphql.GraphQLClient {
  void writeFragment$RepositoryData({
    required Fragment$RepositoryData data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'RepositoryData',
            document: documentNodeFragmentRepositoryData,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$RepositoryData? readFragment$RepositoryData({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'RepositoryData',
          document: documentNodeFragmentRepositoryData,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$RepositoryData.fromJson(result);
  }
}

class Variables$Query$getRepositoryInfoFromMultipleIDs {
  factory Variables$Query$getRepositoryInfoFromMultipleIDs(
          {required List<String> ids}) =>
      Variables$Query$getRepositoryInfoFromMultipleIDs._({
        r'ids': ids,
      });

  Variables$Query$getRepositoryInfoFromMultipleIDs._(this._$data);

  factory Variables$Query$getRepositoryInfoFromMultipleIDs.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$ids = data['ids'];
    result$data['ids'] =
        (l$ids as List<dynamic>).map((e) => (e as String)).toList();
    return Variables$Query$getRepositoryInfoFromMultipleIDs._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String> get ids => (_$data['ids'] as List<String>);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$ids = ids;
    result$data['ids'] = l$ids.map((e) => e).toList();
    return result$data;
  }

  CopyWith$Variables$Query$getRepositoryInfoFromMultipleIDs<
          Variables$Query$getRepositoryInfoFromMultipleIDs>
      get copyWith => CopyWith$Variables$Query$getRepositoryInfoFromMultipleIDs(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRepositoryInfoFromMultipleIDs) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$ids = ids;
    final lOther$ids = other.ids;
    if (l$ids.length != lOther$ids.length) {
      return false;
    }
    for (int i = 0; i < l$ids.length; i++) {
      final l$ids$entry = l$ids[i];
      final lOther$ids$entry = lOther$ids[i];
      if (l$ids$entry != lOther$ids$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$ids = ids;
    return Object.hashAll([Object.hashAll(l$ids.map((v) => v))]);
  }
}

abstract class CopyWith$Variables$Query$getRepositoryInfoFromMultipleIDs<TRes> {
  factory CopyWith$Variables$Query$getRepositoryInfoFromMultipleIDs(
    Variables$Query$getRepositoryInfoFromMultipleIDs instance,
    TRes Function(Variables$Query$getRepositoryInfoFromMultipleIDs) then,
  ) = _CopyWithImpl$Variables$Query$getRepositoryInfoFromMultipleIDs;

  factory CopyWith$Variables$Query$getRepositoryInfoFromMultipleIDs.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$getRepositoryInfoFromMultipleIDs;

  TRes call({List<String>? ids});
}

class _CopyWithImpl$Variables$Query$getRepositoryInfoFromMultipleIDs<TRes>
    implements CopyWith$Variables$Query$getRepositoryInfoFromMultipleIDs<TRes> {
  _CopyWithImpl$Variables$Query$getRepositoryInfoFromMultipleIDs(
    this._instance,
    this._then,
  );

  final Variables$Query$getRepositoryInfoFromMultipleIDs _instance;

  final TRes Function(Variables$Query$getRepositoryInfoFromMultipleIDs) _then;

  static const _undefined = {};

  TRes call({Object? ids = _undefined}) =>
      _then(Variables$Query$getRepositoryInfoFromMultipleIDs._({
        ..._instance._$data,
        if (ids != _undefined && ids != null) 'ids': (ids as List<String>),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRepositoryInfoFromMultipleIDs<TRes>
    implements CopyWith$Variables$Query$getRepositoryInfoFromMultipleIDs<TRes> {
  _CopyWithStubImpl$Variables$Query$getRepositoryInfoFromMultipleIDs(this._res);

  TRes _res;

  call({List<String>? ids}) => _res;
}

class Query$getRepositoryInfoFromMultipleIDs {
  Query$getRepositoryInfoFromMultipleIDs({
    required this.nodes,
    required this.$__typename,
  });

  factory Query$getRepositoryInfoFromMultipleIDs.fromJson(
      Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$$__typename = json['__typename'];
    return Query$getRepositoryInfoFromMultipleIDs(
      nodes: (l$nodes as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$getRepositoryInfoFromMultipleIDs$nodes.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$getRepositoryInfoFromMultipleIDs$nodes?> nodes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$nodes = nodes;
    _resultData['nodes'] = l$nodes.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$nodes = nodes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$nodes.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRepositoryInfoFromMultipleIDs) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$nodes = nodes;
    final lOther$nodes = other.nodes;
    if (l$nodes.length != lOther$nodes.length) {
      return false;
    }
    for (int i = 0; i < l$nodes.length; i++) {
      final l$nodes$entry = l$nodes[i];
      final lOther$nodes$entry = lOther$nodes[i];
      if (l$nodes$entry != lOther$nodes$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getRepositoryInfoFromMultipleIDs
    on Query$getRepositoryInfoFromMultipleIDs {
  CopyWith$Query$getRepositoryInfoFromMultipleIDs<
          Query$getRepositoryInfoFromMultipleIDs>
      get copyWith => CopyWith$Query$getRepositoryInfoFromMultipleIDs(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryInfoFromMultipleIDs<TRes> {
  factory CopyWith$Query$getRepositoryInfoFromMultipleIDs(
    Query$getRepositoryInfoFromMultipleIDs instance,
    TRes Function(Query$getRepositoryInfoFromMultipleIDs) then,
  ) = _CopyWithImpl$Query$getRepositoryInfoFromMultipleIDs;

  factory CopyWith$Query$getRepositoryInfoFromMultipleIDs.stub(TRes res) =
      _CopyWithStubImpl$Query$getRepositoryInfoFromMultipleIDs;

  TRes call({
    List<Query$getRepositoryInfoFromMultipleIDs$nodes?>? nodes,
    String? $__typename,
  });
  TRes nodes(
      Iterable<Query$getRepositoryInfoFromMultipleIDs$nodes?> Function(
              Iterable<
                  CopyWith$Query$getRepositoryInfoFromMultipleIDs$nodes<
                      Query$getRepositoryInfoFromMultipleIDs$nodes>?>)
          _fn);
}

class _CopyWithImpl$Query$getRepositoryInfoFromMultipleIDs<TRes>
    implements CopyWith$Query$getRepositoryInfoFromMultipleIDs<TRes> {
  _CopyWithImpl$Query$getRepositoryInfoFromMultipleIDs(
    this._instance,
    this._then,
  );

  final Query$getRepositoryInfoFromMultipleIDs _instance;

  final TRes Function(Query$getRepositoryInfoFromMultipleIDs) _then;

  static const _undefined = {};

  TRes call({
    Object? nodes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRepositoryInfoFromMultipleIDs(
        nodes: nodes == _undefined || nodes == null
            ? _instance.nodes
            : (nodes as List<Query$getRepositoryInfoFromMultipleIDs$nodes?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes nodes(
          Iterable<Query$getRepositoryInfoFromMultipleIDs$nodes?> Function(
                  Iterable<
                      CopyWith$Query$getRepositoryInfoFromMultipleIDs$nodes<
                          Query$getRepositoryInfoFromMultipleIDs$nodes>?>)
              _fn) =>
      call(
          nodes: _fn(_instance.nodes.map((e) => e == null
              ? null
              : CopyWith$Query$getRepositoryInfoFromMultipleIDs$nodes(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Query$getRepositoryInfoFromMultipleIDs<TRes>
    implements CopyWith$Query$getRepositoryInfoFromMultipleIDs<TRes> {
  _CopyWithStubImpl$Query$getRepositoryInfoFromMultipleIDs(this._res);

  TRes _res;

  call({
    List<Query$getRepositoryInfoFromMultipleIDs$nodes?>? nodes,
    String? $__typename,
  }) =>
      _res;
  nodes(_fn) => _res;
}

const documentNodeQuerygetRepositoryInfoFromMultipleIDs =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRepositoryInfoFromMultipleIDs'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'ids')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'ID'),
            isNonNull: true,
          ),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'nodes'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'ids'),
            value: VariableNode(name: NameNode(value: 'ids')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'RepositoryData'),
            directives: [],
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
  fragmentDefinitionRepositoryData,
]);
Query$getRepositoryInfoFromMultipleIDs
    _parserFn$Query$getRepositoryInfoFromMultipleIDs(
            Map<String, dynamic> data) =>
        Query$getRepositoryInfoFromMultipleIDs.fromJson(data);

class Options$Query$getRepositoryInfoFromMultipleIDs
    extends graphql.QueryOptions<Query$getRepositoryInfoFromMultipleIDs> {
  Options$Query$getRepositoryInfoFromMultipleIDs({
    String? operationName,
    required Variables$Query$getRepositoryInfoFromMultipleIDs variables,
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
          document: documentNodeQuerygetRepositoryInfoFromMultipleIDs,
          parserFn: _parserFn$Query$getRepositoryInfoFromMultipleIDs,
        );
}

class WatchOptions$Query$getRepositoryInfoFromMultipleIDs
    extends graphql.WatchQueryOptions<Query$getRepositoryInfoFromMultipleIDs> {
  WatchOptions$Query$getRepositoryInfoFromMultipleIDs({
    String? operationName,
    required Variables$Query$getRepositoryInfoFromMultipleIDs variables,
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
          document: documentNodeQuerygetRepositoryInfoFromMultipleIDs,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRepositoryInfoFromMultipleIDs,
        );
}

class FetchMoreOptions$Query$getRepositoryInfoFromMultipleIDs
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRepositoryInfoFromMultipleIDs({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRepositoryInfoFromMultipleIDs variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRepositoryInfoFromMultipleIDs,
        );
}

extension ClientExtension$Query$getRepositoryInfoFromMultipleIDs
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRepositoryInfoFromMultipleIDs>>
      query$getRepositoryInfoFromMultipleIDs(
              Options$Query$getRepositoryInfoFromMultipleIDs options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRepositoryInfoFromMultipleIDs>
      watchQuery$getRepositoryInfoFromMultipleIDs(
              WatchOptions$Query$getRepositoryInfoFromMultipleIDs options) =>
          this.watchQuery(options);
  void writeQuery$getRepositoryInfoFromMultipleIDs({
    required Query$getRepositoryInfoFromMultipleIDs data,
    required Variables$Query$getRepositoryInfoFromMultipleIDs variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetRepositoryInfoFromMultipleIDs),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRepositoryInfoFromMultipleIDs?
      readQuery$getRepositoryInfoFromMultipleIDs({
    required Variables$Query$getRepositoryInfoFromMultipleIDs variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetRepositoryInfoFromMultipleIDs),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getRepositoryInfoFromMultipleIDs.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getRepositoryInfoFromMultipleIDs>
    useQuery$getRepositoryInfoFromMultipleIDs(
            Options$Query$getRepositoryInfoFromMultipleIDs options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getRepositoryInfoFromMultipleIDs>
    useWatchQuery$getRepositoryInfoFromMultipleIDs(
            WatchOptions$Query$getRepositoryInfoFromMultipleIDs options) =>
        graphql_flutter.useWatchQuery(options);

class Query$getRepositoryInfoFromMultipleIDs$Widget
    extends graphql_flutter.Query<Query$getRepositoryInfoFromMultipleIDs> {
  Query$getRepositoryInfoFromMultipleIDs$Widget({
    widgets.Key? key,
    required Options$Query$getRepositoryInfoFromMultipleIDs options,
    required graphql_flutter
            .QueryBuilder<Query$getRepositoryInfoFromMultipleIDs>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$getRepositoryInfoFromMultipleIDs$nodes {
  Query$getRepositoryInfoFromMultipleIDs$nodes({required this.$__typename});

  factory Query$getRepositoryInfoFromMultipleIDs$nodes.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Repository":
        return Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$getRepositoryInfoFromMultipleIDs$nodes(
            $__typename: (l$$__typename as String));
    }
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRepositoryInfoFromMultipleIDs$nodes) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$getRepositoryInfoFromMultipleIDs$nodes
    on Query$getRepositoryInfoFromMultipleIDs$nodes {
  CopyWith$Query$getRepositoryInfoFromMultipleIDs$nodes<
          Query$getRepositoryInfoFromMultipleIDs$nodes>
      get copyWith => CopyWith$Query$getRepositoryInfoFromMultipleIDs$nodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryInfoFromMultipleIDs$nodes<TRes> {
  factory CopyWith$Query$getRepositoryInfoFromMultipleIDs$nodes(
    Query$getRepositoryInfoFromMultipleIDs$nodes instance,
    TRes Function(Query$getRepositoryInfoFromMultipleIDs$nodes) then,
  ) = _CopyWithImpl$Query$getRepositoryInfoFromMultipleIDs$nodes;

  factory CopyWith$Query$getRepositoryInfoFromMultipleIDs$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$getRepositoryInfoFromMultipleIDs$nodes;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$getRepositoryInfoFromMultipleIDs$nodes<TRes>
    implements CopyWith$Query$getRepositoryInfoFromMultipleIDs$nodes<TRes> {
  _CopyWithImpl$Query$getRepositoryInfoFromMultipleIDs$nodes(
    this._instance,
    this._then,
  );

  final Query$getRepositoryInfoFromMultipleIDs$nodes _instance;

  final TRes Function(Query$getRepositoryInfoFromMultipleIDs$nodes) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$getRepositoryInfoFromMultipleIDs$nodes(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$getRepositoryInfoFromMultipleIDs$nodes<TRes>
    implements CopyWith$Query$getRepositoryInfoFromMultipleIDs$nodes<TRes> {
  _CopyWithStubImpl$Query$getRepositoryInfoFromMultipleIDs$nodes(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository
    implements
        Fragment$RepositoryData,
        Query$getRepositoryInfoFromMultipleIDs$nodes {
  Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository({
    required this.$__typename,
    required this.id,
    required this.name,
    required this.url,
    this.description,
  });

  factory Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$url = json['url'];
    final l$description = json['description'];
    return Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      name: (l$name as String),
      url: (l$url as String),
      description: (l$description as String?),
    );
  }

  final String $__typename;

  final String id;

  final String name;

  final String url;

  final String? description;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$url = url;
    _resultData['url'] = l$url;
    final l$description = description;
    _resultData['description'] = l$description;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$name = name;
    final l$url = url;
    final l$description = description;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$name,
      l$url,
      l$description,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
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
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository
    on Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository {
  CopyWith$Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository<
          Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository>
      get copyWith =>
          CopyWith$Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository<
    TRes> {
  factory CopyWith$Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository(
    Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository instance,
    TRes Function(Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository)
        then,
  ) = _CopyWithImpl$Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository;

  factory CopyWith$Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository;

  TRes call({
    String? $__typename,
    String? id,
    String? name,
    String? url,
    String? description,
  });
}

class _CopyWithImpl$Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository<
        TRes>
    implements
        CopyWith$Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository<
            TRes> {
  _CopyWithImpl$Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository(
    this._instance,
    this._then,
  );

  final Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository _instance;

  final TRes Function(Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? url = _undefined,
    Object? description = _undefined,
  }) =>
      _then(Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
      ));
}

class _CopyWithStubImpl$Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository<
        TRes>
    implements
        CopyWith$Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository<
            TRes> {
  _CopyWithStubImpl$Query$getRepositoryInfoFromMultipleIDs$nodes$$Repository(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    String? name,
    String? url,
    String? description,
  }) =>
      _res;
}
