import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$searchMemberInOrganization {
  factory Variables$Query$searchMemberInOrganization({
    required String orgName,
    required int first,
    String? after,
  }) =>
      Variables$Query$searchMemberInOrganization._({
        r'orgName': orgName,
        r'first': first,
        if (after != null) r'after': after,
      });

  Variables$Query$searchMemberInOrganization._(this._$data);

  factory Variables$Query$searchMemberInOrganization.fromJson(
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
    return Variables$Query$searchMemberInOrganization._(result$data);
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

  CopyWith$Variables$Query$searchMemberInOrganization<
          Variables$Query$searchMemberInOrganization>
      get copyWith => CopyWith$Variables$Query$searchMemberInOrganization(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$searchMemberInOrganization) ||
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

abstract class CopyWith$Variables$Query$searchMemberInOrganization<TRes> {
  factory CopyWith$Variables$Query$searchMemberInOrganization(
    Variables$Query$searchMemberInOrganization instance,
    TRes Function(Variables$Query$searchMemberInOrganization) then,
  ) = _CopyWithImpl$Variables$Query$searchMemberInOrganization;

  factory CopyWith$Variables$Query$searchMemberInOrganization.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$searchMemberInOrganization;

  TRes call({
    String? orgName,
    int? first,
    String? after,
  });
}

class _CopyWithImpl$Variables$Query$searchMemberInOrganization<TRes>
    implements CopyWith$Variables$Query$searchMemberInOrganization<TRes> {
  _CopyWithImpl$Variables$Query$searchMemberInOrganization(
    this._instance,
    this._then,
  );

  final Variables$Query$searchMemberInOrganization _instance;

  final TRes Function(Variables$Query$searchMemberInOrganization) _then;

  static const _undefined = {};

  TRes call({
    Object? orgName = _undefined,
    Object? first = _undefined,
    Object? after = _undefined,
  }) =>
      _then(Variables$Query$searchMemberInOrganization._({
        ..._instance._$data,
        if (orgName != _undefined && orgName != null)
          'orgName': (orgName as String),
        if (first != _undefined && first != null) 'first': (first as int),
        if (after != _undefined) 'after': (after as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$searchMemberInOrganization<TRes>
    implements CopyWith$Variables$Query$searchMemberInOrganization<TRes> {
  _CopyWithStubImpl$Variables$Query$searchMemberInOrganization(this._res);

  TRes _res;

  call({
    String? orgName,
    int? first,
    String? after,
  }) =>
      _res;
}

class Query$searchMemberInOrganization {
  Query$searchMemberInOrganization({
    this.organization,
    required this.$__typename,
  });

  factory Query$searchMemberInOrganization.fromJson(Map<String, dynamic> json) {
    final l$organization = json['organization'];
    final l$$__typename = json['__typename'];
    return Query$searchMemberInOrganization(
      organization: l$organization == null
          ? null
          : Query$searchMemberInOrganization$organization.fromJson(
              (l$organization as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$searchMemberInOrganization$organization? organization;

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
    if (!(other is Query$searchMemberInOrganization) ||
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

extension UtilityExtension$Query$searchMemberInOrganization
    on Query$searchMemberInOrganization {
  CopyWith$Query$searchMemberInOrganization<Query$searchMemberInOrganization>
      get copyWith => CopyWith$Query$searchMemberInOrganization(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$searchMemberInOrganization<TRes> {
  factory CopyWith$Query$searchMemberInOrganization(
    Query$searchMemberInOrganization instance,
    TRes Function(Query$searchMemberInOrganization) then,
  ) = _CopyWithImpl$Query$searchMemberInOrganization;

  factory CopyWith$Query$searchMemberInOrganization.stub(TRes res) =
      _CopyWithStubImpl$Query$searchMemberInOrganization;

  TRes call({
    Query$searchMemberInOrganization$organization? organization,
    String? $__typename,
  });
  CopyWith$Query$searchMemberInOrganization$organization<TRes> get organization;
}

class _CopyWithImpl$Query$searchMemberInOrganization<TRes>
    implements CopyWith$Query$searchMemberInOrganization<TRes> {
  _CopyWithImpl$Query$searchMemberInOrganization(
    this._instance,
    this._then,
  );

  final Query$searchMemberInOrganization _instance;

  final TRes Function(Query$searchMemberInOrganization) _then;

  static const _undefined = {};

  TRes call({
    Object? organization = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$searchMemberInOrganization(
        organization: organization == _undefined
            ? _instance.organization
            : (organization as Query$searchMemberInOrganization$organization?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$searchMemberInOrganization$organization<TRes>
      get organization {
    final local$organization = _instance.organization;
    return local$organization == null
        ? CopyWith$Query$searchMemberInOrganization$organization.stub(
            _then(_instance))
        : CopyWith$Query$searchMemberInOrganization$organization(
            local$organization, (e) => call(organization: e));
  }
}

class _CopyWithStubImpl$Query$searchMemberInOrganization<TRes>
    implements CopyWith$Query$searchMemberInOrganization<TRes> {
  _CopyWithStubImpl$Query$searchMemberInOrganization(this._res);

  TRes _res;

  call({
    Query$searchMemberInOrganization$organization? organization,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$searchMemberInOrganization$organization<TRes>
      get organization =>
          CopyWith$Query$searchMemberInOrganization$organization.stub(_res);
}

const documentNodeQuerysearchMemberInOrganization = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'searchMemberInOrganization'),
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
            name: NameNode(value: 'membersWithRole'),
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
                    name: NameNode(value: 'cursor'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
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
                        name: NameNode(value: 'login'),
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
                        name: NameNode(value: 'bio'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'avatarUrl'),
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
Query$searchMemberInOrganization _parserFn$Query$searchMemberInOrganization(
        Map<String, dynamic> data) =>
    Query$searchMemberInOrganization.fromJson(data);

class Options$Query$searchMemberInOrganization
    extends graphql.QueryOptions<Query$searchMemberInOrganization> {
  Options$Query$searchMemberInOrganization({
    String? operationName,
    required Variables$Query$searchMemberInOrganization variables,
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
          document: documentNodeQuerysearchMemberInOrganization,
          parserFn: _parserFn$Query$searchMemberInOrganization,
        );
}

class WatchOptions$Query$searchMemberInOrganization
    extends graphql.WatchQueryOptions<Query$searchMemberInOrganization> {
  WatchOptions$Query$searchMemberInOrganization({
    String? operationName,
    required Variables$Query$searchMemberInOrganization variables,
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
          document: documentNodeQuerysearchMemberInOrganization,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$searchMemberInOrganization,
        );
}

class FetchMoreOptions$Query$searchMemberInOrganization
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$searchMemberInOrganization({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$searchMemberInOrganization variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerysearchMemberInOrganization,
        );
}

extension ClientExtension$Query$searchMemberInOrganization
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$searchMemberInOrganization>>
      query$searchMemberInOrganization(
              Options$Query$searchMemberInOrganization options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$searchMemberInOrganization>
      watchQuery$searchMemberInOrganization(
              WatchOptions$Query$searchMemberInOrganization options) =>
          this.watchQuery(options);
  void writeQuery$searchMemberInOrganization({
    required Query$searchMemberInOrganization data,
    required Variables$Query$searchMemberInOrganization variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerysearchMemberInOrganization),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$searchMemberInOrganization? readQuery$searchMemberInOrganization({
    required Variables$Query$searchMemberInOrganization variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerysearchMemberInOrganization),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$searchMemberInOrganization.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$searchMemberInOrganization>
    useQuery$searchMemberInOrganization(
            Options$Query$searchMemberInOrganization options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$searchMemberInOrganization>
    useWatchQuery$searchMemberInOrganization(
            WatchOptions$Query$searchMemberInOrganization options) =>
        graphql_flutter.useWatchQuery(options);

class Query$searchMemberInOrganization$Widget
    extends graphql_flutter.Query<Query$searchMemberInOrganization> {
  Query$searchMemberInOrganization$Widget({
    widgets.Key? key,
    required Options$Query$searchMemberInOrganization options,
    required graphql_flutter.QueryBuilder<Query$searchMemberInOrganization>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$searchMemberInOrganization$organization {
  Query$searchMemberInOrganization$organization({
    required this.membersWithRole,
    required this.$__typename,
  });

  factory Query$searchMemberInOrganization$organization.fromJson(
      Map<String, dynamic> json) {
    final l$membersWithRole = json['membersWithRole'];
    final l$$__typename = json['__typename'];
    return Query$searchMemberInOrganization$organization(
      membersWithRole:
          Query$searchMemberInOrganization$organization$membersWithRole
              .fromJson((l$membersWithRole as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$searchMemberInOrganization$organization$membersWithRole
      membersWithRole;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$membersWithRole = membersWithRole;
    _resultData['membersWithRole'] = l$membersWithRole.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$membersWithRole = membersWithRole;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$membersWithRole,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$searchMemberInOrganization$organization) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$membersWithRole = membersWithRole;
    final lOther$membersWithRole = other.membersWithRole;
    if (l$membersWithRole != lOther$membersWithRole) {
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

extension UtilityExtension$Query$searchMemberInOrganization$organization
    on Query$searchMemberInOrganization$organization {
  CopyWith$Query$searchMemberInOrganization$organization<
          Query$searchMemberInOrganization$organization>
      get copyWith => CopyWith$Query$searchMemberInOrganization$organization(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$searchMemberInOrganization$organization<TRes> {
  factory CopyWith$Query$searchMemberInOrganization$organization(
    Query$searchMemberInOrganization$organization instance,
    TRes Function(Query$searchMemberInOrganization$organization) then,
  ) = _CopyWithImpl$Query$searchMemberInOrganization$organization;

  factory CopyWith$Query$searchMemberInOrganization$organization.stub(
          TRes res) =
      _CopyWithStubImpl$Query$searchMemberInOrganization$organization;

  TRes call({
    Query$searchMemberInOrganization$organization$membersWithRole?
        membersWithRole,
    String? $__typename,
  });
  CopyWith$Query$searchMemberInOrganization$organization$membersWithRole<TRes>
      get membersWithRole;
}

class _CopyWithImpl$Query$searchMemberInOrganization$organization<TRes>
    implements CopyWith$Query$searchMemberInOrganization$organization<TRes> {
  _CopyWithImpl$Query$searchMemberInOrganization$organization(
    this._instance,
    this._then,
  );

  final Query$searchMemberInOrganization$organization _instance;

  final TRes Function(Query$searchMemberInOrganization$organization) _then;

  static const _undefined = {};

  TRes call({
    Object? membersWithRole = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$searchMemberInOrganization$organization(
        membersWithRole: membersWithRole == _undefined ||
                membersWithRole == null
            ? _instance.membersWithRole
            : (membersWithRole
                as Query$searchMemberInOrganization$organization$membersWithRole),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$searchMemberInOrganization$organization$membersWithRole<TRes>
      get membersWithRole {
    final local$membersWithRole = _instance.membersWithRole;
    return CopyWith$Query$searchMemberInOrganization$organization$membersWithRole(
        local$membersWithRole, (e) => call(membersWithRole: e));
  }
}

class _CopyWithStubImpl$Query$searchMemberInOrganization$organization<TRes>
    implements CopyWith$Query$searchMemberInOrganization$organization<TRes> {
  _CopyWithStubImpl$Query$searchMemberInOrganization$organization(this._res);

  TRes _res;

  call({
    Query$searchMemberInOrganization$organization$membersWithRole?
        membersWithRole,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$searchMemberInOrganization$organization$membersWithRole<TRes>
      get membersWithRole =>
          CopyWith$Query$searchMemberInOrganization$organization$membersWithRole
              .stub(_res);
}

class Query$searchMemberInOrganization$organization$membersWithRole {
  Query$searchMemberInOrganization$organization$membersWithRole({
    required this.pageInfo,
    this.edges,
    required this.$__typename,
  });

  factory Query$searchMemberInOrganization$organization$membersWithRole.fromJson(
      Map<String, dynamic> json) {
    final l$pageInfo = json['pageInfo'];
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$searchMemberInOrganization$organization$membersWithRole(
      pageInfo:
          Query$searchMemberInOrganization$organization$membersWithRole$pageInfo
              .fromJson((l$pageInfo as Map<String, dynamic>)),
      edges: (l$edges as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$searchMemberInOrganization$organization$membersWithRole$edges
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$searchMemberInOrganization$organization$membersWithRole$pageInfo
      pageInfo;

  final List<
          Query$searchMemberInOrganization$organization$membersWithRole$edges?>?
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
            is Query$searchMemberInOrganization$organization$membersWithRole) ||
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

extension UtilityExtension$Query$searchMemberInOrganization$organization$membersWithRole
    on Query$searchMemberInOrganization$organization$membersWithRole {
  CopyWith$Query$searchMemberInOrganization$organization$membersWithRole<
          Query$searchMemberInOrganization$organization$membersWithRole>
      get copyWith =>
          CopyWith$Query$searchMemberInOrganization$organization$membersWithRole(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$searchMemberInOrganization$organization$membersWithRole<
    TRes> {
  factory CopyWith$Query$searchMemberInOrganization$organization$membersWithRole(
    Query$searchMemberInOrganization$organization$membersWithRole instance,
    TRes Function(Query$searchMemberInOrganization$organization$membersWithRole)
        then,
  ) = _CopyWithImpl$Query$searchMemberInOrganization$organization$membersWithRole;

  factory CopyWith$Query$searchMemberInOrganization$organization$membersWithRole.stub(
          TRes res) =
      _CopyWithStubImpl$Query$searchMemberInOrganization$organization$membersWithRole;

  TRes call({
    Query$searchMemberInOrganization$organization$membersWithRole$pageInfo?
        pageInfo,
    List<Query$searchMemberInOrganization$organization$membersWithRole$edges?>?
        edges,
    String? $__typename,
  });
  CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo<
      TRes> get pageInfo;
  TRes edges(
      Iterable<Query$searchMemberInOrganization$organization$membersWithRole$edges?>? Function(
              Iterable<
                  CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges<
                      Query$searchMemberInOrganization$organization$membersWithRole$edges>?>?)
          _fn);
}

class _CopyWithImpl$Query$searchMemberInOrganization$organization$membersWithRole<
        TRes>
    implements
        CopyWith$Query$searchMemberInOrganization$organization$membersWithRole<
            TRes> {
  _CopyWithImpl$Query$searchMemberInOrganization$organization$membersWithRole(
    this._instance,
    this._then,
  );

  final Query$searchMemberInOrganization$organization$membersWithRole _instance;

  final TRes Function(
      Query$searchMemberInOrganization$organization$membersWithRole) _then;

  static const _undefined = {};

  TRes call({
    Object? pageInfo = _undefined,
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$searchMemberInOrganization$organization$membersWithRole(
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo
                as Query$searchMemberInOrganization$organization$membersWithRole$pageInfo),
        edges: edges == _undefined
            ? _instance.edges
            : (edges as List<
                Query$searchMemberInOrganization$organization$membersWithRole$edges?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo<
      TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }

  TRes edges(
          Iterable<Query$searchMemberInOrganization$organization$membersWithRole$edges?>? Function(
                  Iterable<
                      CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges<
                          Query$searchMemberInOrganization$organization$membersWithRole$edges>?>?)
              _fn) =>
      call(
          edges: _fn(_instance.edges?.map((e) => e == null
              ? null
              : CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$searchMemberInOrganization$organization$membersWithRole<
        TRes>
    implements
        CopyWith$Query$searchMemberInOrganization$organization$membersWithRole<
            TRes> {
  _CopyWithStubImpl$Query$searchMemberInOrganization$organization$membersWithRole(
      this._res);

  TRes _res;

  call({
    Query$searchMemberInOrganization$organization$membersWithRole$pageInfo?
        pageInfo,
    List<Query$searchMemberInOrganization$organization$membersWithRole$edges?>?
        edges,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo<
          TRes>
      get pageInfo =>
          CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo
              .stub(_res);
  edges(_fn) => _res;
}

class Query$searchMemberInOrganization$organization$membersWithRole$pageInfo {
  Query$searchMemberInOrganization$organization$membersWithRole$pageInfo({
    this.endCursor,
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.startCursor,
    required this.$__typename,
  });

  factory Query$searchMemberInOrganization$organization$membersWithRole$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$endCursor = json['endCursor'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPreviousPage = json['hasPreviousPage'];
    final l$startCursor = json['startCursor'];
    final l$$__typename = json['__typename'];
    return Query$searchMemberInOrganization$organization$membersWithRole$pageInfo(
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
            is Query$searchMemberInOrganization$organization$membersWithRole$pageInfo) ||
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

extension UtilityExtension$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo
    on Query$searchMemberInOrganization$organization$membersWithRole$pageInfo {
  CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo<
          Query$searchMemberInOrganization$organization$membersWithRole$pageInfo>
      get copyWith =>
          CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo<
    TRes> {
  factory CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo(
    Query$searchMemberInOrganization$organization$membersWithRole$pageInfo
        instance,
    TRes Function(
            Query$searchMemberInOrganization$organization$membersWithRole$pageInfo)
        then,
  ) = _CopyWithImpl$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo;

  factory CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo.stub(
          TRes res) =
      _CopyWithStubImpl$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo;

  TRes call({
    String? endCursor,
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? startCursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo<
        TRes>
    implements
        CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo<
            TRes> {
  _CopyWithImpl$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo(
    this._instance,
    this._then,
  );

  final Query$searchMemberInOrganization$organization$membersWithRole$pageInfo
      _instance;

  final TRes Function(
          Query$searchMemberInOrganization$organization$membersWithRole$pageInfo)
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
          Query$searchMemberInOrganization$organization$membersWithRole$pageInfo(
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

class _CopyWithStubImpl$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo<
        TRes>
    implements
        CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo<
            TRes> {
  _CopyWithStubImpl$Query$searchMemberInOrganization$organization$membersWithRole$pageInfo(
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

class Query$searchMemberInOrganization$organization$membersWithRole$edges {
  Query$searchMemberInOrganization$organization$membersWithRole$edges({
    required this.cursor,
    this.node,
    required this.$__typename,
  });

  factory Query$searchMemberInOrganization$organization$membersWithRole$edges.fromJson(
      Map<String, dynamic> json) {
    final l$cursor = json['cursor'];
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$searchMemberInOrganization$organization$membersWithRole$edges(
      cursor: (l$cursor as String),
      node: l$node == null
          ? null
          : Query$searchMemberInOrganization$organization$membersWithRole$edges$node
              .fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String cursor;

  final Query$searchMemberInOrganization$organization$membersWithRole$edges$node?
      node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cursor = cursor;
    _resultData['cursor'] = l$cursor;
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cursor = cursor;
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cursor,
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
            is Query$searchMemberInOrganization$organization$membersWithRole$edges) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cursor = cursor;
    final lOther$cursor = other.cursor;
    if (l$cursor != lOther$cursor) {
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

extension UtilityExtension$Query$searchMemberInOrganization$organization$membersWithRole$edges
    on Query$searchMemberInOrganization$organization$membersWithRole$edges {
  CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges<
          Query$searchMemberInOrganization$organization$membersWithRole$edges>
      get copyWith =>
          CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges<
    TRes> {
  factory CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges(
    Query$searchMemberInOrganization$organization$membersWithRole$edges
        instance,
    TRes Function(
            Query$searchMemberInOrganization$organization$membersWithRole$edges)
        then,
  ) = _CopyWithImpl$Query$searchMemberInOrganization$organization$membersWithRole$edges;

  factory CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$searchMemberInOrganization$organization$membersWithRole$edges;

  TRes call({
    String? cursor,
    Query$searchMemberInOrganization$organization$membersWithRole$edges$node?
        node,
    String? $__typename,
  });
  CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges$node<
      TRes> get node;
}

class _CopyWithImpl$Query$searchMemberInOrganization$organization$membersWithRole$edges<
        TRes>
    implements
        CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges<
            TRes> {
  _CopyWithImpl$Query$searchMemberInOrganization$organization$membersWithRole$edges(
    this._instance,
    this._then,
  );

  final Query$searchMemberInOrganization$organization$membersWithRole$edges
      _instance;

  final TRes Function(
          Query$searchMemberInOrganization$organization$membersWithRole$edges)
      _then;

  static const _undefined = {};

  TRes call({
    Object? cursor = _undefined,
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$searchMemberInOrganization$organization$membersWithRole$edges(
        cursor: cursor == _undefined || cursor == null
            ? _instance.cursor
            : (cursor as String),
        node: node == _undefined
            ? _instance.node
            : (node
                as Query$searchMemberInOrganization$organization$membersWithRole$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges$node<
      TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges$node
            .stub(_then(_instance))
        : CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$searchMemberInOrganization$organization$membersWithRole$edges<
        TRes>
    implements
        CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges<
            TRes> {
  _CopyWithStubImpl$Query$searchMemberInOrganization$organization$membersWithRole$edges(
      this._res);

  TRes _res;

  call({
    String? cursor,
    Query$searchMemberInOrganization$organization$membersWithRole$edges$node?
        node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges$node<
          TRes>
      get node =>
          CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges$node
              .stub(_res);
}

class Query$searchMemberInOrganization$organization$membersWithRole$edges$node {
  Query$searchMemberInOrganization$organization$membersWithRole$edges$node({
    required this.id,
    required this.login,
    this.name,
    this.bio,
    required this.avatarUrl,
    required this.url,
    required this.$__typename,
  });

  factory Query$searchMemberInOrganization$organization$membersWithRole$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$login = json['login'];
    final l$name = json['name'];
    final l$bio = json['bio'];
    final l$avatarUrl = json['avatarUrl'];
    final l$url = json['url'];
    final l$$__typename = json['__typename'];
    return Query$searchMemberInOrganization$organization$membersWithRole$edges$node(
      id: (l$id as String),
      login: (l$login as String),
      name: (l$name as String?),
      bio: (l$bio as String?),
      avatarUrl: (l$avatarUrl as String),
      url: (l$url as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String login;

  final String? name;

  final String? bio;

  final String avatarUrl;

  final String url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$login = login;
    _resultData['login'] = l$login;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$bio = bio;
    _resultData['bio'] = l$bio;
    final l$avatarUrl = avatarUrl;
    _resultData['avatarUrl'] = l$avatarUrl;
    final l$url = url;
    _resultData['url'] = l$url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$login = login;
    final l$name = name;
    final l$bio = bio;
    final l$avatarUrl = avatarUrl;
    final l$url = url;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$login,
      l$name,
      l$bio,
      l$avatarUrl,
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
            is Query$searchMemberInOrganization$organization$membersWithRole$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$login = login;
    final lOther$login = other.login;
    if (l$login != lOther$login) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$bio = bio;
    final lOther$bio = other.bio;
    if (l$bio != lOther$bio) {
      return false;
    }
    final l$avatarUrl = avatarUrl;
    final lOther$avatarUrl = other.avatarUrl;
    if (l$avatarUrl != lOther$avatarUrl) {
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

extension UtilityExtension$Query$searchMemberInOrganization$organization$membersWithRole$edges$node
    on Query$searchMemberInOrganization$organization$membersWithRole$edges$node {
  CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges$node<
          Query$searchMemberInOrganization$organization$membersWithRole$edges$node>
      get copyWith =>
          CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges$node<
    TRes> {
  factory CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges$node(
    Query$searchMemberInOrganization$organization$membersWithRole$edges$node
        instance,
    TRes Function(
            Query$searchMemberInOrganization$organization$membersWithRole$edges$node)
        then,
  ) = _CopyWithImpl$Query$searchMemberInOrganization$organization$membersWithRole$edges$node;

  factory CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$searchMemberInOrganization$organization$membersWithRole$edges$node;

  TRes call({
    String? id,
    String? login,
    String? name,
    String? bio,
    String? avatarUrl,
    String? url,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$searchMemberInOrganization$organization$membersWithRole$edges$node<
        TRes>
    implements
        CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges$node<
            TRes> {
  _CopyWithImpl$Query$searchMemberInOrganization$organization$membersWithRole$edges$node(
    this._instance,
    this._then,
  );

  final Query$searchMemberInOrganization$organization$membersWithRole$edges$node
      _instance;

  final TRes Function(
          Query$searchMemberInOrganization$organization$membersWithRole$edges$node)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? login = _undefined,
    Object? name = _undefined,
    Object? bio = _undefined,
    Object? avatarUrl = _undefined,
    Object? url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$searchMemberInOrganization$organization$membersWithRole$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        login: login == _undefined || login == null
            ? _instance.login
            : (login as String),
        name: name == _undefined ? _instance.name : (name as String?),
        bio: bio == _undefined ? _instance.bio : (bio as String?),
        avatarUrl: avatarUrl == _undefined || avatarUrl == null
            ? _instance.avatarUrl
            : (avatarUrl as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$searchMemberInOrganization$organization$membersWithRole$edges$node<
        TRes>
    implements
        CopyWith$Query$searchMemberInOrganization$organization$membersWithRole$edges$node<
            TRes> {
  _CopyWithStubImpl$Query$searchMemberInOrganization$organization$membersWithRole$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? login,
    String? name,
    String? bio,
    String? avatarUrl,
    String? url,
    String? $__typename,
  }) =>
      _res;
}
