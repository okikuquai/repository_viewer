import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:repositoryviewer/graphql/type/custom_id.dart';
import 'package:repositoryviewer/graphql/type/custom_url.dart';

class Variables$Query$getRepositoriesInOrganization {
  factory Variables$Query$getRepositoriesInOrganization({
    required String orgName,
    required int first,
    String? after,
  }) =>
      Variables$Query$getRepositoriesInOrganization._({
        r'orgName': orgName,
        r'first': first,
        if (after != null) r'after': after,
      });

  Variables$Query$getRepositoriesInOrganization._(this._$data);

  factory Variables$Query$getRepositoriesInOrganization.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orgName = data['orgName'];
    result$data['orgName'] = (l$orgName as String);
    final l$first = data['first'];
    result$data['first'] = (l$first as int);
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    return Variables$Query$getRepositoriesInOrganization._(result$data);
  }

  Map<String, dynamic> _$data;

  String get orgName => (_$data['orgName'] as String);
  int get first => (_$data['first'] as int);
  String? get after => (_$data['after'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orgName = orgName;
    result$data['orgName'] = l$orgName;
    final l$first = first;
    result$data['first'] = l$first;
    if (_$data.containsKey('after')) {
      final l$after = after;
      result$data['after'] = l$after;
    }
    return result$data;
  }

  CopyWith$Variables$Query$getRepositoriesInOrganization<
          Variables$Query$getRepositoriesInOrganization>
      get copyWith => CopyWith$Variables$Query$getRepositoriesInOrganization(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRepositoriesInOrganization) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$orgName = orgName;
    final lOther$orgName = other.orgName;
    if (l$orgName != lOther$orgName) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
      return false;
    }
    final l$after = after;
    final lOther$after = other.after;
    if (_$data.containsKey('after') != other._$data.containsKey('after')) {
      return false;
    }
    if (l$after != lOther$after) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$orgName = orgName;
    final l$first = first;
    final l$after = after;
    return Object.hashAll([
      l$orgName,
      l$first,
      _$data.containsKey('after') ? l$after : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$getRepositoriesInOrganization<TRes> {
  factory CopyWith$Variables$Query$getRepositoriesInOrganization(
    Variables$Query$getRepositoriesInOrganization instance,
    TRes Function(Variables$Query$getRepositoriesInOrganization) then,
  ) = _CopyWithImpl$Variables$Query$getRepositoriesInOrganization;

  factory CopyWith$Variables$Query$getRepositoriesInOrganization.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$getRepositoriesInOrganization;

  TRes call({
    String? orgName,
    int? first,
    String? after,
  });
}

class _CopyWithImpl$Variables$Query$getRepositoriesInOrganization<TRes>
    implements CopyWith$Variables$Query$getRepositoriesInOrganization<TRes> {
  _CopyWithImpl$Variables$Query$getRepositoriesInOrganization(
    this._instance,
    this._then,
  );

  final Variables$Query$getRepositoriesInOrganization _instance;

  final TRes Function(Variables$Query$getRepositoriesInOrganization) _then;

  static const _undefined = {};

  TRes call({
    Object? orgName = _undefined,
    Object? first = _undefined,
    Object? after = _undefined,
  }) =>
      _then(Variables$Query$getRepositoriesInOrganization._({
        ..._instance._$data,
        if (orgName != _undefined && orgName != null)
          'orgName': (orgName as String),
        if (first != _undefined && first != null) 'first': (first as int),
        if (after != _undefined) 'after': (after as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRepositoriesInOrganization<TRes>
    implements CopyWith$Variables$Query$getRepositoriesInOrganization<TRes> {
  _CopyWithStubImpl$Variables$Query$getRepositoriesInOrganization(this._res);

  TRes _res;

  call({
    String? orgName,
    int? first,
    String? after,
  }) =>
      _res;
}

class Query$getRepositoriesInOrganization {
  Query$getRepositoriesInOrganization({
    this.organization,
    required this.$__typename,
  });

  factory Query$getRepositoriesInOrganization.fromJson(
      Map<String, dynamic> json) {
    final l$organization = json['organization'];
    final l$$__typename = json['__typename'];
    return Query$getRepositoriesInOrganization(
      organization: l$organization == null
          ? null
          : Query$getRepositoriesInOrganization$organization.fromJson(
              (l$organization as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getRepositoriesInOrganization$organization? organization;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$organization = organization;
    _resultData['organization'] = l$organization?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$organization = organization;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$organization,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRepositoriesInOrganization) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$organization = organization;
    final lOther$organization = other.organization;
    if (l$organization != lOther$organization) {
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

extension UtilityExtension$Query$getRepositoriesInOrganization
    on Query$getRepositoriesInOrganization {
  CopyWith$Query$getRepositoriesInOrganization<
          Query$getRepositoriesInOrganization>
      get copyWith => CopyWith$Query$getRepositoriesInOrganization(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoriesInOrganization<TRes> {
  factory CopyWith$Query$getRepositoriesInOrganization(
    Query$getRepositoriesInOrganization instance,
    TRes Function(Query$getRepositoriesInOrganization) then,
  ) = _CopyWithImpl$Query$getRepositoriesInOrganization;

  factory CopyWith$Query$getRepositoriesInOrganization.stub(TRes res) =
      _CopyWithStubImpl$Query$getRepositoriesInOrganization;

  TRes call({
    Query$getRepositoriesInOrganization$organization? organization,
    String? $__typename,
  });
  CopyWith$Query$getRepositoriesInOrganization$organization<TRes>
      get organization;
}

class _CopyWithImpl$Query$getRepositoriesInOrganization<TRes>
    implements CopyWith$Query$getRepositoriesInOrganization<TRes> {
  _CopyWithImpl$Query$getRepositoriesInOrganization(
    this._instance,
    this._then,
  );

  final Query$getRepositoriesInOrganization _instance;

  final TRes Function(Query$getRepositoriesInOrganization) _then;

  static const _undefined = {};

  TRes call({
    Object? organization = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRepositoriesInOrganization(
        organization: organization == _undefined
            ? _instance.organization
            : (organization
                as Query$getRepositoriesInOrganization$organization?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRepositoriesInOrganization$organization<TRes>
      get organization {
    final local$organization = _instance.organization;
    return local$organization == null
        ? CopyWith$Query$getRepositoriesInOrganization$organization.stub(
            _then(_instance))
        : CopyWith$Query$getRepositoriesInOrganization$organization(
            local$organization, (e) => call(organization: e));
  }
}

class _CopyWithStubImpl$Query$getRepositoriesInOrganization<TRes>
    implements CopyWith$Query$getRepositoriesInOrganization<TRes> {
  _CopyWithStubImpl$Query$getRepositoriesInOrganization(this._res);

  TRes _res;

  call({
    Query$getRepositoriesInOrganization$organization? organization,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRepositoriesInOrganization$organization<TRes>
      get organization =>
          CopyWith$Query$getRepositoriesInOrganization$organization.stub(_res);
}

const documentNodeQuerygetRepositoriesInOrganization =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRepositoriesInOrganization'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orgName')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'first')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'after')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'organization'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'login'),
            value: VariableNode(name: NameNode(value: 'orgName')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'repositories'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: VariableNode(name: NameNode(value: 'first')),
              ),
              ArgumentNode(
                name: NameNode(value: 'after'),
                value: VariableNode(name: NameNode(value: 'after')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'pageInfo'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'endCursor'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'hasNextPage'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'hasPreviousPage'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'startCursor'),
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
                        name: NameNode(value: 'description'),
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
Query$getRepositoriesInOrganization
    _parserFn$Query$getRepositoriesInOrganization(Map<String, dynamic> data) =>
        Query$getRepositoriesInOrganization.fromJson(data);

class Options$Query$getRepositoriesInOrganization
    extends graphql.QueryOptions<Query$getRepositoriesInOrganization> {
  Options$Query$getRepositoriesInOrganization({
    String? operationName,
    required Variables$Query$getRepositoriesInOrganization variables,
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
          document: documentNodeQuerygetRepositoriesInOrganization,
          parserFn: _parserFn$Query$getRepositoriesInOrganization,
        );
}

class WatchOptions$Query$getRepositoriesInOrganization
    extends graphql.WatchQueryOptions<Query$getRepositoriesInOrganization> {
  WatchOptions$Query$getRepositoriesInOrganization({
    String? operationName,
    required Variables$Query$getRepositoriesInOrganization variables,
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
          document: documentNodeQuerygetRepositoriesInOrganization,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRepositoriesInOrganization,
        );
}

class FetchMoreOptions$Query$getRepositoriesInOrganization
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRepositoriesInOrganization({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRepositoriesInOrganization variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRepositoriesInOrganization,
        );
}

extension ClientExtension$Query$getRepositoriesInOrganization
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRepositoriesInOrganization>>
      query$getRepositoriesInOrganization(
              Options$Query$getRepositoriesInOrganization options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRepositoriesInOrganization>
      watchQuery$getRepositoriesInOrganization(
              WatchOptions$Query$getRepositoriesInOrganization options) =>
          this.watchQuery(options);
  void writeQuery$getRepositoriesInOrganization({
    required Query$getRepositoriesInOrganization data,
    required Variables$Query$getRepositoriesInOrganization variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetRepositoriesInOrganization),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRepositoriesInOrganization? readQuery$getRepositoriesInOrganization({
    required Variables$Query$getRepositoriesInOrganization variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetRepositoriesInOrganization),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getRepositoriesInOrganization.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getRepositoriesInOrganization>
    useQuery$getRepositoriesInOrganization(
            Options$Query$getRepositoriesInOrganization options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getRepositoriesInOrganization>
    useWatchQuery$getRepositoriesInOrganization(
            WatchOptions$Query$getRepositoriesInOrganization options) =>
        graphql_flutter.useWatchQuery(options);

class Query$getRepositoriesInOrganization$Widget
    extends graphql_flutter.Query<Query$getRepositoriesInOrganization> {
  Query$getRepositoriesInOrganization$Widget({
    widgets.Key? key,
    required Options$Query$getRepositoriesInOrganization options,
    required graphql_flutter.QueryBuilder<Query$getRepositoriesInOrganization>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$getRepositoriesInOrganization$organization {
  Query$getRepositoriesInOrganization$organization({
    required this.repositories,
    required this.$__typename,
  });

  factory Query$getRepositoriesInOrganization$organization.fromJson(
      Map<String, dynamic> json) {
    final l$repositories = json['repositories'];
    final l$$__typename = json['__typename'];
    return Query$getRepositoriesInOrganization$organization(
      repositories:
          Query$getRepositoriesInOrganization$organization$repositories
              .fromJson((l$repositories as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getRepositoriesInOrganization$organization$repositories
      repositories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$repositories = repositories;
    _resultData['repositories'] = l$repositories.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$repositories = repositories;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$repositories,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRepositoriesInOrganization$organization) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$repositories = repositories;
    final lOther$repositories = other.repositories;
    if (l$repositories != lOther$repositories) {
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

extension UtilityExtension$Query$getRepositoriesInOrganization$organization
    on Query$getRepositoriesInOrganization$organization {
  CopyWith$Query$getRepositoriesInOrganization$organization<
          Query$getRepositoriesInOrganization$organization>
      get copyWith => CopyWith$Query$getRepositoriesInOrganization$organization(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoriesInOrganization$organization<TRes> {
  factory CopyWith$Query$getRepositoriesInOrganization$organization(
    Query$getRepositoriesInOrganization$organization instance,
    TRes Function(Query$getRepositoriesInOrganization$organization) then,
  ) = _CopyWithImpl$Query$getRepositoriesInOrganization$organization;

  factory CopyWith$Query$getRepositoriesInOrganization$organization.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRepositoriesInOrganization$organization;

  TRes call({
    Query$getRepositoriesInOrganization$organization$repositories? repositories,
    String? $__typename,
  });
  CopyWith$Query$getRepositoriesInOrganization$organization$repositories<TRes>
      get repositories;
}

class _CopyWithImpl$Query$getRepositoriesInOrganization$organization<TRes>
    implements CopyWith$Query$getRepositoriesInOrganization$organization<TRes> {
  _CopyWithImpl$Query$getRepositoriesInOrganization$organization(
    this._instance,
    this._then,
  );

  final Query$getRepositoriesInOrganization$organization _instance;

  final TRes Function(Query$getRepositoriesInOrganization$organization) _then;

  static const _undefined = {};

  TRes call({
    Object? repositories = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRepositoriesInOrganization$organization(
        repositories: repositories == _undefined || repositories == null
            ? _instance.repositories
            : (repositories
                as Query$getRepositoriesInOrganization$organization$repositories),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRepositoriesInOrganization$organization$repositories<TRes>
      get repositories {
    final local$repositories = _instance.repositories;
    return CopyWith$Query$getRepositoriesInOrganization$organization$repositories(
        local$repositories, (e) => call(repositories: e));
  }
}

class _CopyWithStubImpl$Query$getRepositoriesInOrganization$organization<TRes>
    implements CopyWith$Query$getRepositoriesInOrganization$organization<TRes> {
  _CopyWithStubImpl$Query$getRepositoriesInOrganization$organization(this._res);

  TRes _res;

  call({
    Query$getRepositoriesInOrganization$organization$repositories? repositories,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRepositoriesInOrganization$organization$repositories<TRes>
      get repositories =>
          CopyWith$Query$getRepositoriesInOrganization$organization$repositories
              .stub(_res);
}

class Query$getRepositoriesInOrganization$organization$repositories {
  Query$getRepositoriesInOrganization$organization$repositories({
    required this.pageInfo,
    this.edges,
    required this.$__typename,
  });

  factory Query$getRepositoriesInOrganization$organization$repositories.fromJson(
      Map<String, dynamic> json) {
    final l$pageInfo = json['pageInfo'];
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$getRepositoriesInOrganization$organization$repositories(
      pageInfo:
          Query$getRepositoriesInOrganization$organization$repositories$pageInfo
              .fromJson((l$pageInfo as Map<String, dynamic>)),
      edges: (l$edges as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$getRepositoriesInOrganization$organization$repositories$edges
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getRepositoriesInOrganization$organization$repositories$pageInfo
      pageInfo;

  final List<
          Query$getRepositoriesInOrganization$organization$repositories$edges?>?
      edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$edges = edges;
    _resultData['edges'] = l$edges?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$pageInfo = pageInfo;
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$pageInfo,
      l$edges == null ? null : Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getRepositoriesInOrganization$organization$repositories) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
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

extension UtilityExtension$Query$getRepositoriesInOrganization$organization$repositories
    on Query$getRepositoriesInOrganization$organization$repositories {
  CopyWith$Query$getRepositoriesInOrganization$organization$repositories<
          Query$getRepositoriesInOrganization$organization$repositories>
      get copyWith =>
          CopyWith$Query$getRepositoriesInOrganization$organization$repositories(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoriesInOrganization$organization$repositories<
    TRes> {
  factory CopyWith$Query$getRepositoriesInOrganization$organization$repositories(
    Query$getRepositoriesInOrganization$organization$repositories instance,
    TRes Function(Query$getRepositoriesInOrganization$organization$repositories)
        then,
  ) = _CopyWithImpl$Query$getRepositoriesInOrganization$organization$repositories;

  factory CopyWith$Query$getRepositoriesInOrganization$organization$repositories.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRepositoriesInOrganization$organization$repositories;

  TRes call({
    Query$getRepositoriesInOrganization$organization$repositories$pageInfo?
        pageInfo,
    List<Query$getRepositoriesInOrganization$organization$repositories$edges?>?
        edges,
    String? $__typename,
  });
  CopyWith$Query$getRepositoriesInOrganization$organization$repositories$pageInfo<
      TRes> get pageInfo;
  TRes edges(
      Iterable<Query$getRepositoriesInOrganization$organization$repositories$edges?>? Function(
              Iterable<
                  CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges<
                      Query$getRepositoriesInOrganization$organization$repositories$edges>?>?)
          _fn);
}

class _CopyWithImpl$Query$getRepositoriesInOrganization$organization$repositories<
        TRes>
    implements
        CopyWith$Query$getRepositoriesInOrganization$organization$repositories<
            TRes> {
  _CopyWithImpl$Query$getRepositoriesInOrganization$organization$repositories(
    this._instance,
    this._then,
  );

  final Query$getRepositoriesInOrganization$organization$repositories _instance;

  final TRes Function(
      Query$getRepositoriesInOrganization$organization$repositories) _then;

  static const _undefined = {};

  TRes call({
    Object? pageInfo = _undefined,
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRepositoriesInOrganization$organization$repositories(
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo
                as Query$getRepositoriesInOrganization$organization$repositories$pageInfo),
        edges: edges == _undefined
            ? _instance.edges
            : (edges as List<
                Query$getRepositoriesInOrganization$organization$repositories$edges?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRepositoriesInOrganization$organization$repositories$pageInfo<
      TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$getRepositoriesInOrganization$organization$repositories$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }

  TRes edges(
          Iterable<Query$getRepositoriesInOrganization$organization$repositories$edges?>? Function(
                  Iterable<
                      CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges<
                          Query$getRepositoriesInOrganization$organization$repositories$edges>?>?)
              _fn) =>
      call(
          edges: _fn(_instance.edges?.map((e) => e == null
              ? null
              : CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$getRepositoriesInOrganization$organization$repositories<
        TRes>
    implements
        CopyWith$Query$getRepositoriesInOrganization$organization$repositories<
            TRes> {
  _CopyWithStubImpl$Query$getRepositoriesInOrganization$organization$repositories(
      this._res);

  TRes _res;

  call({
    Query$getRepositoriesInOrganization$organization$repositories$pageInfo?
        pageInfo,
    List<Query$getRepositoriesInOrganization$organization$repositories$edges?>?
        edges,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRepositoriesInOrganization$organization$repositories$pageInfo<
          TRes>
      get pageInfo =>
          CopyWith$Query$getRepositoriesInOrganization$organization$repositories$pageInfo
              .stub(_res);
  edges(_fn) => _res;
}

class Query$getRepositoriesInOrganization$organization$repositories$pageInfo {
  Query$getRepositoriesInOrganization$organization$repositories$pageInfo({
    this.endCursor,
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.startCursor,
    required this.$__typename,
  });

  factory Query$getRepositoriesInOrganization$organization$repositories$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$endCursor = json['endCursor'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPreviousPage = json['hasPreviousPage'];
    final l$startCursor = json['startCursor'];
    final l$$__typename = json['__typename'];
    return Query$getRepositoriesInOrganization$organization$repositories$pageInfo(
      endCursor: (l$endCursor as String?),
      hasNextPage: (l$hasNextPage as bool),
      hasPreviousPage: (l$hasPreviousPage as bool),
      startCursor: (l$startCursor as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? endCursor;

  final bool hasNextPage;

  final bool hasPreviousPage;

  final String? startCursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$endCursor = endCursor;
    _resultData['endCursor'] = l$endCursor;
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$hasPreviousPage = hasPreviousPage;
    _resultData['hasPreviousPage'] = l$hasPreviousPage;
    final l$startCursor = startCursor;
    _resultData['startCursor'] = l$startCursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$endCursor = endCursor;
    final l$hasNextPage = hasNextPage;
    final l$hasPreviousPage = hasPreviousPage;
    final l$startCursor = startCursor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$endCursor,
      l$hasNextPage,
      l$hasPreviousPage,
      l$startCursor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getRepositoriesInOrganization$organization$repositories$pageInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$endCursor = endCursor;
    final lOther$endCursor = other.endCursor;
    if (l$endCursor != lOther$endCursor) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$hasPreviousPage = hasPreviousPage;
    final lOther$hasPreviousPage = other.hasPreviousPage;
    if (l$hasPreviousPage != lOther$hasPreviousPage) {
      return false;
    }
    final l$startCursor = startCursor;
    final lOther$startCursor = other.startCursor;
    if (l$startCursor != lOther$startCursor) {
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

extension UtilityExtension$Query$getRepositoriesInOrganization$organization$repositories$pageInfo
    on Query$getRepositoriesInOrganization$organization$repositories$pageInfo {
  CopyWith$Query$getRepositoriesInOrganization$organization$repositories$pageInfo<
          Query$getRepositoriesInOrganization$organization$repositories$pageInfo>
      get copyWith =>
          CopyWith$Query$getRepositoriesInOrganization$organization$repositories$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoriesInOrganization$organization$repositories$pageInfo<
    TRes> {
  factory CopyWith$Query$getRepositoriesInOrganization$organization$repositories$pageInfo(
    Query$getRepositoriesInOrganization$organization$repositories$pageInfo
        instance,
    TRes Function(
            Query$getRepositoriesInOrganization$organization$repositories$pageInfo)
        then,
  ) = _CopyWithImpl$Query$getRepositoriesInOrganization$organization$repositories$pageInfo;

  factory CopyWith$Query$getRepositoriesInOrganization$organization$repositories$pageInfo.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRepositoriesInOrganization$organization$repositories$pageInfo;

  TRes call({
    String? endCursor,
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? startCursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRepositoriesInOrganization$organization$repositories$pageInfo<
        TRes>
    implements
        CopyWith$Query$getRepositoriesInOrganization$organization$repositories$pageInfo<
            TRes> {
  _CopyWithImpl$Query$getRepositoriesInOrganization$organization$repositories$pageInfo(
    this._instance,
    this._then,
  );

  final Query$getRepositoriesInOrganization$organization$repositories$pageInfo
      _instance;

  final TRes Function(
          Query$getRepositoriesInOrganization$organization$repositories$pageInfo)
      _then;

  static const _undefined = {};

  TRes call({
    Object? endCursor = _undefined,
    Object? hasNextPage = _undefined,
    Object? hasPreviousPage = _undefined,
    Object? startCursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRepositoriesInOrganization$organization$repositories$pageInfo(
        endCursor: endCursor == _undefined
            ? _instance.endCursor
            : (endCursor as String?),
        hasNextPage: hasNextPage == _undefined || hasNextPage == null
            ? _instance.hasNextPage
            : (hasNextPage as bool),
        hasPreviousPage:
            hasPreviousPage == _undefined || hasPreviousPage == null
                ? _instance.hasPreviousPage
                : (hasPreviousPage as bool),
        startCursor: startCursor == _undefined
            ? _instance.startCursor
            : (startCursor as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRepositoriesInOrganization$organization$repositories$pageInfo<
        TRes>
    implements
        CopyWith$Query$getRepositoriesInOrganization$organization$repositories$pageInfo<
            TRes> {
  _CopyWithStubImpl$Query$getRepositoriesInOrganization$organization$repositories$pageInfo(
      this._res);

  TRes _res;

  call({
    String? endCursor,
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? startCursor,
    String? $__typename,
  }) =>
      _res;
}

class Query$getRepositoriesInOrganization$organization$repositories$edges {
  Query$getRepositoriesInOrganization$organization$repositories$edges({
    this.node,
    required this.$__typename,
  });

  factory Query$getRepositoriesInOrganization$organization$repositories$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$getRepositoriesInOrganization$organization$repositories$edges(
      node: l$node == null
          ? null
          : Query$getRepositoriesInOrganization$organization$repositories$edges$node
              .fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getRepositoriesInOrganization$organization$repositories$edges$node?
      node;

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
    if (!(other
            is Query$getRepositoriesInOrganization$organization$repositories$edges) ||
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

extension UtilityExtension$Query$getRepositoriesInOrganization$organization$repositories$edges
    on Query$getRepositoriesInOrganization$organization$repositories$edges {
  CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges<
          Query$getRepositoriesInOrganization$organization$repositories$edges>
      get copyWith =>
          CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges<
    TRes> {
  factory CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges(
    Query$getRepositoriesInOrganization$organization$repositories$edges
        instance,
    TRes Function(
            Query$getRepositoriesInOrganization$organization$repositories$edges)
        then,
  ) = _CopyWithImpl$Query$getRepositoriesInOrganization$organization$repositories$edges;

  factory CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRepositoriesInOrganization$organization$repositories$edges;

  TRes call({
    Query$getRepositoriesInOrganization$organization$repositories$edges$node?
        node,
    String? $__typename,
  });
  CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges$node<
      TRes> get node;
}

class _CopyWithImpl$Query$getRepositoriesInOrganization$organization$repositories$edges<
        TRes>
    implements
        CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges<
            TRes> {
  _CopyWithImpl$Query$getRepositoriesInOrganization$organization$repositories$edges(
    this._instance,
    this._then,
  );

  final Query$getRepositoriesInOrganization$organization$repositories$edges
      _instance;

  final TRes Function(
          Query$getRepositoriesInOrganization$organization$repositories$edges)
      _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRepositoriesInOrganization$organization$repositories$edges(
        node: node == _undefined
            ? _instance.node
            : (node
                as Query$getRepositoriesInOrganization$organization$repositories$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges$node<
      TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges$node
            .stub(_then(_instance))
        : CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$getRepositoriesInOrganization$organization$repositories$edges<
        TRes>
    implements
        CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges<
            TRes> {
  _CopyWithStubImpl$Query$getRepositoriesInOrganization$organization$repositories$edges(
      this._res);

  TRes _res;

  call({
    Query$getRepositoriesInOrganization$organization$repositories$edges$node?
        node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges$node<
          TRes>
      get node =>
          CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges$node
              .stub(_res);
}

class Query$getRepositoriesInOrganization$organization$repositories$edges$node {
  Query$getRepositoriesInOrganization$organization$repositories$edges$node({
    required this.id,
    required this.name,
    this.description,
    required this.url,
    required this.$__typename,
  });

  factory Query$getRepositoriesInOrganization$organization$repositories$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$url = json['url'];
    final l$$__typename = json['__typename'];
    return Query$getRepositoriesInOrganization$organization$repositories$edges$node(
      id: githubAPIIDFromJson(l$id),
      name: (l$name as String),
      description: (l$description as String?),
      url: customUriFromJson(l$url),
      $__typename: (l$$__typename as String),
    );
  }

  final GithubAPIID id;

  final String name;

  final String? description;

  final CustomURI url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = githubAPIIDToJson(l$id);
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$url = url;
    _resultData['url'] = customUriToJson(l$url);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$url = url;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$url,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getRepositoriesInOrganization$organization$repositories$edges$node) ||
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
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
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

extension UtilityExtension$Query$getRepositoriesInOrganization$organization$repositories$edges$node
    on Query$getRepositoriesInOrganization$organization$repositories$edges$node {
  CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges$node<
          Query$getRepositoriesInOrganization$organization$repositories$edges$node>
      get copyWith =>
          CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges$node<
    TRes> {
  factory CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges$node(
    Query$getRepositoriesInOrganization$organization$repositories$edges$node
        instance,
    TRes Function(
            Query$getRepositoriesInOrganization$organization$repositories$edges$node)
        then,
  ) = _CopyWithImpl$Query$getRepositoriesInOrganization$organization$repositories$edges$node;

  factory CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRepositoriesInOrganization$organization$repositories$edges$node;

  TRes call({
    GithubAPIID? id,
    String? name,
    String? description,
    CustomURI? url,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRepositoriesInOrganization$organization$repositories$edges$node<
        TRes>
    implements
        CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges$node<
            TRes> {
  _CopyWithImpl$Query$getRepositoriesInOrganization$organization$repositories$edges$node(
    this._instance,
    this._then,
  );

  final Query$getRepositoriesInOrganization$organization$repositories$edges$node
      _instance;

  final TRes Function(
          Query$getRepositoriesInOrganization$organization$repositories$edges$node)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRepositoriesInOrganization$organization$repositories$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as GithubAPIID),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        url: url == _undefined || url == null
            ? _instance.url
            : (url as CustomURI),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRepositoriesInOrganization$organization$repositories$edges$node<
        TRes>
    implements
        CopyWith$Query$getRepositoriesInOrganization$organization$repositories$edges$node<
            TRes> {
  _CopyWithStubImpl$Query$getRepositoriesInOrganization$organization$repositories$edges$node(
      this._res);

  TRes _res;

  call({
    GithubAPIID? id,
    String? name,
    String? description,
    CustomURI? url,
    String? $__typename,
  }) =>
      _res;
}
