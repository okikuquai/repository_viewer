import 'getRepositoryInfoFromMultipleIDs.graphql.dart';
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

class Variables$Query$getRepositoryDataFromID {
  factory Variables$Query$getRepositoryDataFromID({required String id}) =>
      Variables$Query$getRepositoryDataFromID._({
        r'id': id,
      });

  Variables$Query$getRepositoryDataFromID._(this._$data);

  factory Variables$Query$getRepositoryDataFromID.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$getRepositoryDataFromID._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getRepositoryDataFromID<
          Variables$Query$getRepositoryDataFromID>
      get copyWith => CopyWith$Variables$Query$getRepositoryDataFromID(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRepositoryDataFromID) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$getRepositoryDataFromID<TRes> {
  factory CopyWith$Variables$Query$getRepositoryDataFromID(
    Variables$Query$getRepositoryDataFromID instance,
    TRes Function(Variables$Query$getRepositoryDataFromID) then,
  ) = _CopyWithImpl$Variables$Query$getRepositoryDataFromID;

  factory CopyWith$Variables$Query$getRepositoryDataFromID.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRepositoryDataFromID;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$getRepositoryDataFromID<TRes>
    implements CopyWith$Variables$Query$getRepositoryDataFromID<TRes> {
  _CopyWithImpl$Variables$Query$getRepositoryDataFromID(
    this._instance,
    this._then,
  );

  final Variables$Query$getRepositoryDataFromID _instance;

  final TRes Function(Variables$Query$getRepositoryDataFromID) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getRepositoryDataFromID._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRepositoryDataFromID<TRes>
    implements CopyWith$Variables$Query$getRepositoryDataFromID<TRes> {
  _CopyWithStubImpl$Variables$Query$getRepositoryDataFromID(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$getRepositoryDataFromID {
  Query$getRepositoryDataFromID({
    this.node,
    required this.$__typename,
  });

  factory Query$getRepositoryDataFromID.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$getRepositoryDataFromID(
      node: l$node == null
          ? null
          : Query$getRepositoryDataFromID$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getRepositoryDataFromID$node? node;

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
    if (!(other is Query$getRepositoryDataFromID) ||
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

extension UtilityExtension$Query$getRepositoryDataFromID
    on Query$getRepositoryDataFromID {
  CopyWith$Query$getRepositoryDataFromID<Query$getRepositoryDataFromID>
      get copyWith => CopyWith$Query$getRepositoryDataFromID(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryDataFromID<TRes> {
  factory CopyWith$Query$getRepositoryDataFromID(
    Query$getRepositoryDataFromID instance,
    TRes Function(Query$getRepositoryDataFromID) then,
  ) = _CopyWithImpl$Query$getRepositoryDataFromID;

  factory CopyWith$Query$getRepositoryDataFromID.stub(TRes res) =
      _CopyWithStubImpl$Query$getRepositoryDataFromID;

  TRes call({
    Query$getRepositoryDataFromID$node? node,
    String? $__typename,
  });
  CopyWith$Query$getRepositoryDataFromID$node<TRes> get node;
}

class _CopyWithImpl$Query$getRepositoryDataFromID<TRes>
    implements CopyWith$Query$getRepositoryDataFromID<TRes> {
  _CopyWithImpl$Query$getRepositoryDataFromID(
    this._instance,
    this._then,
  );

  final Query$getRepositoryDataFromID _instance;

  final TRes Function(Query$getRepositoryDataFromID) _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRepositoryDataFromID(
        node: node == _undefined
            ? _instance.node
            : (node as Query$getRepositoryDataFromID$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRepositoryDataFromID$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$getRepositoryDataFromID$node.stub(_then(_instance))
        : CopyWith$Query$getRepositoryDataFromID$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$getRepositoryDataFromID<TRes>
    implements CopyWith$Query$getRepositoryDataFromID<TRes> {
  _CopyWithStubImpl$Query$getRepositoryDataFromID(this._res);

  TRes _res;

  call({
    Query$getRepositoryDataFromID$node? node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRepositoryDataFromID$node<TRes> get node =>
      CopyWith$Query$getRepositoryDataFromID$node.stub(_res);
}

const documentNodeQuerygetRepositoryDataFromID = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRepositoryDataFromID'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'node'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
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
Query$getRepositoryDataFromID _parserFn$Query$getRepositoryDataFromID(
        Map<String, dynamic> data) =>
    Query$getRepositoryDataFromID.fromJson(data);

class Options$Query$getRepositoryDataFromID
    extends graphql.QueryOptions<Query$getRepositoryDataFromID> {
  Options$Query$getRepositoryDataFromID({
    String? operationName,
    required Variables$Query$getRepositoryDataFromID variables,
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
          document: documentNodeQuerygetRepositoryDataFromID,
          parserFn: _parserFn$Query$getRepositoryDataFromID,
        );
}

class WatchOptions$Query$getRepositoryDataFromID
    extends graphql.WatchQueryOptions<Query$getRepositoryDataFromID> {
  WatchOptions$Query$getRepositoryDataFromID({
    String? operationName,
    required Variables$Query$getRepositoryDataFromID variables,
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
          document: documentNodeQuerygetRepositoryDataFromID,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRepositoryDataFromID,
        );
}

class FetchMoreOptions$Query$getRepositoryDataFromID
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRepositoryDataFromID({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRepositoryDataFromID variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRepositoryDataFromID,
        );
}

extension ClientExtension$Query$getRepositoryDataFromID
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRepositoryDataFromID>>
      query$getRepositoryDataFromID(
              Options$Query$getRepositoryDataFromID options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRepositoryDataFromID>
      watchQuery$getRepositoryDataFromID(
              WatchOptions$Query$getRepositoryDataFromID options) =>
          this.watchQuery(options);
  void writeQuery$getRepositoryDataFromID({
    required Query$getRepositoryDataFromID data,
    required Variables$Query$getRepositoryDataFromID variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetRepositoryDataFromID),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRepositoryDataFromID? readQuery$getRepositoryDataFromID({
    required Variables$Query$getRepositoryDataFromID variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetRepositoryDataFromID),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getRepositoryDataFromID.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getRepositoryDataFromID>
    useQuery$getRepositoryDataFromID(
            Options$Query$getRepositoryDataFromID options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getRepositoryDataFromID>
    useWatchQuery$getRepositoryDataFromID(
            WatchOptions$Query$getRepositoryDataFromID options) =>
        graphql_flutter.useWatchQuery(options);

class Query$getRepositoryDataFromID$Widget
    extends graphql_flutter.Query<Query$getRepositoryDataFromID> {
  Query$getRepositoryDataFromID$Widget({
    widgets.Key? key,
    required Options$Query$getRepositoryDataFromID options,
    required graphql_flutter.QueryBuilder<Query$getRepositoryDataFromID>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$getRepositoryDataFromID$node {
  Query$getRepositoryDataFromID$node({required this.$__typename});

  factory Query$getRepositoryDataFromID$node.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Repository":
        return Query$getRepositoryDataFromID$node$$Repository.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$getRepositoryDataFromID$node(
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
    if (!(other is Query$getRepositoryDataFromID$node) ||
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

extension UtilityExtension$Query$getRepositoryDataFromID$node
    on Query$getRepositoryDataFromID$node {
  CopyWith$Query$getRepositoryDataFromID$node<
          Query$getRepositoryDataFromID$node>
      get copyWith => CopyWith$Query$getRepositoryDataFromID$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryDataFromID$node<TRes> {
  factory CopyWith$Query$getRepositoryDataFromID$node(
    Query$getRepositoryDataFromID$node instance,
    TRes Function(Query$getRepositoryDataFromID$node) then,
  ) = _CopyWithImpl$Query$getRepositoryDataFromID$node;

  factory CopyWith$Query$getRepositoryDataFromID$node.stub(TRes res) =
      _CopyWithStubImpl$Query$getRepositoryDataFromID$node;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$getRepositoryDataFromID$node<TRes>
    implements CopyWith$Query$getRepositoryDataFromID$node<TRes> {
  _CopyWithImpl$Query$getRepositoryDataFromID$node(
    this._instance,
    this._then,
  );

  final Query$getRepositoryDataFromID$node _instance;

  final TRes Function(Query$getRepositoryDataFromID$node) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$getRepositoryDataFromID$node(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$getRepositoryDataFromID$node<TRes>
    implements CopyWith$Query$getRepositoryDataFromID$node<TRes> {
  _CopyWithStubImpl$Query$getRepositoryDataFromID$node(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$getRepositoryDataFromID$node$$Repository
    implements Fragment$RepositoryData, Query$getRepositoryDataFromID$node {
  Query$getRepositoryDataFromID$node$$Repository({
    required this.$__typename,
    required this.id,
    required this.name,
    required this.url,
    this.description,
  });

  factory Query$getRepositoryDataFromID$node$$Repository.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$url = json['url'];
    final l$description = json['description'];
    return Query$getRepositoryDataFromID$node$$Repository(
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
    if (!(other is Query$getRepositoryDataFromID$node$$Repository) ||
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

extension UtilityExtension$Query$getRepositoryDataFromID$node$$Repository
    on Query$getRepositoryDataFromID$node$$Repository {
  CopyWith$Query$getRepositoryDataFromID$node$$Repository<
          Query$getRepositoryDataFromID$node$$Repository>
      get copyWith => CopyWith$Query$getRepositoryDataFromID$node$$Repository(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryDataFromID$node$$Repository<TRes> {
  factory CopyWith$Query$getRepositoryDataFromID$node$$Repository(
    Query$getRepositoryDataFromID$node$$Repository instance,
    TRes Function(Query$getRepositoryDataFromID$node$$Repository) then,
  ) = _CopyWithImpl$Query$getRepositoryDataFromID$node$$Repository;

  factory CopyWith$Query$getRepositoryDataFromID$node$$Repository.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRepositoryDataFromID$node$$Repository;

  TRes call({
    String? $__typename,
    String? id,
    String? name,
    String? url,
    String? description,
  });
}

class _CopyWithImpl$Query$getRepositoryDataFromID$node$$Repository<TRes>
    implements CopyWith$Query$getRepositoryDataFromID$node$$Repository<TRes> {
  _CopyWithImpl$Query$getRepositoryDataFromID$node$$Repository(
    this._instance,
    this._then,
  );

  final Query$getRepositoryDataFromID$node$$Repository _instance;

  final TRes Function(Query$getRepositoryDataFromID$node$$Repository) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? url = _undefined,
    Object? description = _undefined,
  }) =>
      _then(Query$getRepositoryDataFromID$node$$Repository(
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

class _CopyWithStubImpl$Query$getRepositoryDataFromID$node$$Repository<TRes>
    implements CopyWith$Query$getRepositoryDataFromID$node$$Repository<TRes> {
  _CopyWithStubImpl$Query$getRepositoryDataFromID$node$$Repository(this._res);

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
