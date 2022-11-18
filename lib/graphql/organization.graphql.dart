import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$ReadOrgRepositories {
  factory Variables$Query$ReadOrgRepositories({required String orgName}) =>
      Variables$Query$ReadOrgRepositories._({
        r'orgName': orgName,
      });

  Variables$Query$ReadOrgRepositories._(this._$data);

  factory Variables$Query$ReadOrgRepositories.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orgName = data['orgName'];
    result$data['orgName'] = (l$orgName as String);
    return Variables$Query$ReadOrgRepositories._(result$data);
  }

  Map<String, dynamic> _$data;

  String get orgName => (_$data['orgName'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orgName = orgName;
    result$data['orgName'] = l$orgName;
    return result$data;
  }

  CopyWith$Variables$Query$ReadOrgRepositories<
          Variables$Query$ReadOrgRepositories>
      get copyWith => CopyWith$Variables$Query$ReadOrgRepositories(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$ReadOrgRepositories) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$orgName = orgName;
    final lOther$orgName = other.orgName;
    if (l$orgName != lOther$orgName) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$orgName = orgName;
    return Object.hashAll([l$orgName]);
  }
}

abstract class CopyWith$Variables$Query$ReadOrgRepositories<TRes> {
  factory CopyWith$Variables$Query$ReadOrgRepositories(
    Variables$Query$ReadOrgRepositories instance,
    TRes Function(Variables$Query$ReadOrgRepositories) then,
  ) = _CopyWithImpl$Variables$Query$ReadOrgRepositories;

  factory CopyWith$Variables$Query$ReadOrgRepositories.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$ReadOrgRepositories;

  TRes call({String? orgName});
}

class _CopyWithImpl$Variables$Query$ReadOrgRepositories<TRes>
    implements CopyWith$Variables$Query$ReadOrgRepositories<TRes> {
  _CopyWithImpl$Variables$Query$ReadOrgRepositories(
    this._instance,
    this._then,
  );

  final Variables$Query$ReadOrgRepositories _instance;

  final TRes Function(Variables$Query$ReadOrgRepositories) _then;

  static const _undefined = {};

  TRes call({Object? orgName = _undefined}) =>
      _then(Variables$Query$ReadOrgRepositories._({
        ..._instance._$data,
        if (orgName != _undefined && orgName != null)
          'orgName': (orgName as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$ReadOrgRepositories<TRes>
    implements CopyWith$Variables$Query$ReadOrgRepositories<TRes> {
  _CopyWithStubImpl$Variables$Query$ReadOrgRepositories(this._res);

  TRes _res;

  call({String? orgName}) => _res;
}

class Query$ReadOrgRepositories {
  Query$ReadOrgRepositories({
    this.organization,
    required this.$__typename,
  });

  factory Query$ReadOrgRepositories.fromJson(Map<String, dynamic> json) {
    final l$organization = json['organization'];
    final l$$__typename = json['__typename'];
    return Query$ReadOrgRepositories(
      organization: l$organization == null
          ? null
          : Query$ReadOrgRepositories$organization.fromJson(
              (l$organization as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$ReadOrgRepositories$organization? organization;

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
    if (!(other is Query$ReadOrgRepositories) ||
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

extension UtilityExtension$Query$ReadOrgRepositories
    on Query$ReadOrgRepositories {
  CopyWith$Query$ReadOrgRepositories<Query$ReadOrgRepositories> get copyWith =>
      CopyWith$Query$ReadOrgRepositories(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ReadOrgRepositories<TRes> {
  factory CopyWith$Query$ReadOrgRepositories(
    Query$ReadOrgRepositories instance,
    TRes Function(Query$ReadOrgRepositories) then,
  ) = _CopyWithImpl$Query$ReadOrgRepositories;

  factory CopyWith$Query$ReadOrgRepositories.stub(TRes res) =
      _CopyWithStubImpl$Query$ReadOrgRepositories;

  TRes call({
    Query$ReadOrgRepositories$organization? organization,
    String? $__typename,
  });
  CopyWith$Query$ReadOrgRepositories$organization<TRes> get organization;
}

class _CopyWithImpl$Query$ReadOrgRepositories<TRes>
    implements CopyWith$Query$ReadOrgRepositories<TRes> {
  _CopyWithImpl$Query$ReadOrgRepositories(
    this._instance,
    this._then,
  );

  final Query$ReadOrgRepositories _instance;

  final TRes Function(Query$ReadOrgRepositories) _then;

  static const _undefined = {};

  TRes call({
    Object? organization = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ReadOrgRepositories(
        organization: organization == _undefined
            ? _instance.organization
            : (organization as Query$ReadOrgRepositories$organization?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$ReadOrgRepositories$organization<TRes> get organization {
    final local$organization = _instance.organization;
    return local$organization == null
        ? CopyWith$Query$ReadOrgRepositories$organization.stub(_then(_instance))
        : CopyWith$Query$ReadOrgRepositories$organization(
            local$organization, (e) => call(organization: e));
  }
}

class _CopyWithStubImpl$Query$ReadOrgRepositories<TRes>
    implements CopyWith$Query$ReadOrgRepositories<TRes> {
  _CopyWithStubImpl$Query$ReadOrgRepositories(this._res);

  TRes _res;

  call({
    Query$ReadOrgRepositories$organization? organization,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$ReadOrgRepositories$organization<TRes> get organization =>
      CopyWith$Query$ReadOrgRepositories$organization.stub(_res);
}

const documentNodeQueryReadOrgRepositories = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'ReadOrgRepositories'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orgName')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
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
            name: NameNode(value: 'name'),
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
            name: NameNode(value: 'teams'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '100'),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'totalCount'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
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
                        name: NameNode(value: 'repositories'),
                        alias: null,
                        arguments: [
                          ArgumentNode(
                            name: NameNode(value: 'first'),
                            value: IntValueNode(value: '100'),
                          )
                        ],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'totalCount'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
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
Query$ReadOrgRepositories _parserFn$Query$ReadOrgRepositories(
        Map<String, dynamic> data) =>
    Query$ReadOrgRepositories.fromJson(data);

class Options$Query$ReadOrgRepositories
    extends graphql.QueryOptions<Query$ReadOrgRepositories> {
  Options$Query$ReadOrgRepositories({
    String? operationName,
    required Variables$Query$ReadOrgRepositories variables,
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
          document: documentNodeQueryReadOrgRepositories,
          parserFn: _parserFn$Query$ReadOrgRepositories,
        );
}

class WatchOptions$Query$ReadOrgRepositories
    extends graphql.WatchQueryOptions<Query$ReadOrgRepositories> {
  WatchOptions$Query$ReadOrgRepositories({
    String? operationName,
    required Variables$Query$ReadOrgRepositories variables,
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
          document: documentNodeQueryReadOrgRepositories,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$ReadOrgRepositories,
        );
}

class FetchMoreOptions$Query$ReadOrgRepositories
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ReadOrgRepositories({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$ReadOrgRepositories variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryReadOrgRepositories,
        );
}

extension ClientExtension$Query$ReadOrgRepositories on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ReadOrgRepositories>>
      query$ReadOrgRepositories(
              Options$Query$ReadOrgRepositories options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$ReadOrgRepositories>
      watchQuery$ReadOrgRepositories(
              WatchOptions$Query$ReadOrgRepositories options) =>
          this.watchQuery(options);
  void writeQuery$ReadOrgRepositories({
    required Query$ReadOrgRepositories data,
    required Variables$Query$ReadOrgRepositories variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryReadOrgRepositories),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$ReadOrgRepositories? readQuery$ReadOrgRepositories({
    required Variables$Query$ReadOrgRepositories variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryReadOrgRepositories),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ReadOrgRepositories.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ReadOrgRepositories>
    useQuery$ReadOrgRepositories(Options$Query$ReadOrgRepositories options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$ReadOrgRepositories>
    useWatchQuery$ReadOrgRepositories(
            WatchOptions$Query$ReadOrgRepositories options) =>
        graphql_flutter.useWatchQuery(options);

class Query$ReadOrgRepositories$Widget
    extends graphql_flutter.Query<Query$ReadOrgRepositories> {
  Query$ReadOrgRepositories$Widget({
    widgets.Key? key,
    required Options$Query$ReadOrgRepositories options,
    required graphql_flutter.QueryBuilder<Query$ReadOrgRepositories> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$ReadOrgRepositories$organization {
  Query$ReadOrgRepositories$organization({
    this.name,
    required this.login,
    required this.teams,
    required this.$__typename,
  });

  factory Query$ReadOrgRepositories$organization.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$login = json['login'];
    final l$teams = json['teams'];
    final l$$__typename = json['__typename'];
    return Query$ReadOrgRepositories$organization(
      name: (l$name as String?),
      login: (l$login as String),
      teams: Query$ReadOrgRepositories$organization$teams.fromJson(
          (l$teams as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String? name;

  final String login;

  final Query$ReadOrgRepositories$organization$teams teams;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$login = login;
    _resultData['login'] = l$login;
    final l$teams = teams;
    _resultData['teams'] = l$teams.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$login = login;
    final l$teams = teams;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$login,
      l$teams,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$ReadOrgRepositories$organization) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$login = login;
    final lOther$login = other.login;
    if (l$login != lOther$login) {
      return false;
    }
    final l$teams = teams;
    final lOther$teams = other.teams;
    if (l$teams != lOther$teams) {
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

extension UtilityExtension$Query$ReadOrgRepositories$organization
    on Query$ReadOrgRepositories$organization {
  CopyWith$Query$ReadOrgRepositories$organization<
          Query$ReadOrgRepositories$organization>
      get copyWith => CopyWith$Query$ReadOrgRepositories$organization(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ReadOrgRepositories$organization<TRes> {
  factory CopyWith$Query$ReadOrgRepositories$organization(
    Query$ReadOrgRepositories$organization instance,
    TRes Function(Query$ReadOrgRepositories$organization) then,
  ) = _CopyWithImpl$Query$ReadOrgRepositories$organization;

  factory CopyWith$Query$ReadOrgRepositories$organization.stub(TRes res) =
      _CopyWithStubImpl$Query$ReadOrgRepositories$organization;

  TRes call({
    String? name,
    String? login,
    Query$ReadOrgRepositories$organization$teams? teams,
    String? $__typename,
  });
  CopyWith$Query$ReadOrgRepositories$organization$teams<TRes> get teams;
}

class _CopyWithImpl$Query$ReadOrgRepositories$organization<TRes>
    implements CopyWith$Query$ReadOrgRepositories$organization<TRes> {
  _CopyWithImpl$Query$ReadOrgRepositories$organization(
    this._instance,
    this._then,
  );

  final Query$ReadOrgRepositories$organization _instance;

  final TRes Function(Query$ReadOrgRepositories$organization) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? login = _undefined,
    Object? teams = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ReadOrgRepositories$organization(
        name: name == _undefined ? _instance.name : (name as String?),
        login: login == _undefined || login == null
            ? _instance.login
            : (login as String),
        teams: teams == _undefined || teams == null
            ? _instance.teams
            : (teams as Query$ReadOrgRepositories$organization$teams),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$ReadOrgRepositories$organization$teams<TRes> get teams {
    final local$teams = _instance.teams;
    return CopyWith$Query$ReadOrgRepositories$organization$teams(
        local$teams, (e) => call(teams: e));
  }
}

class _CopyWithStubImpl$Query$ReadOrgRepositories$organization<TRes>
    implements CopyWith$Query$ReadOrgRepositories$organization<TRes> {
  _CopyWithStubImpl$Query$ReadOrgRepositories$organization(this._res);

  TRes _res;

  call({
    String? name,
    String? login,
    Query$ReadOrgRepositories$organization$teams? teams,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$ReadOrgRepositories$organization$teams<TRes> get teams =>
      CopyWith$Query$ReadOrgRepositories$organization$teams.stub(_res);
}

class Query$ReadOrgRepositories$organization$teams {
  Query$ReadOrgRepositories$organization$teams({
    required this.totalCount,
    this.edges,
    required this.$__typename,
  });

  factory Query$ReadOrgRepositories$organization$teams.fromJson(
      Map<String, dynamic> json) {
    final l$totalCount = json['totalCount'];
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$ReadOrgRepositories$organization$teams(
      totalCount: (l$totalCount as int),
      edges: (l$edges as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$ReadOrgRepositories$organization$teams$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int totalCount;

  final List<Query$ReadOrgRepositories$organization$teams$edges?>? edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$totalCount = totalCount;
    _resultData['totalCount'] = l$totalCount;
    final l$edges = edges;
    _resultData['edges'] = l$edges?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$totalCount = totalCount;
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$totalCount,
      l$edges == null ? null : Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$ReadOrgRepositories$organization$teams) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$totalCount = totalCount;
    final lOther$totalCount = other.totalCount;
    if (l$totalCount != lOther$totalCount) {
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

extension UtilityExtension$Query$ReadOrgRepositories$organization$teams
    on Query$ReadOrgRepositories$organization$teams {
  CopyWith$Query$ReadOrgRepositories$organization$teams<
          Query$ReadOrgRepositories$organization$teams>
      get copyWith => CopyWith$Query$ReadOrgRepositories$organization$teams(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ReadOrgRepositories$organization$teams<TRes> {
  factory CopyWith$Query$ReadOrgRepositories$organization$teams(
    Query$ReadOrgRepositories$organization$teams instance,
    TRes Function(Query$ReadOrgRepositories$organization$teams) then,
  ) = _CopyWithImpl$Query$ReadOrgRepositories$organization$teams;

  factory CopyWith$Query$ReadOrgRepositories$organization$teams.stub(TRes res) =
      _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams;

  TRes call({
    int? totalCount,
    List<Query$ReadOrgRepositories$organization$teams$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$ReadOrgRepositories$organization$teams$edges?>? Function(
              Iterable<
                  CopyWith$Query$ReadOrgRepositories$organization$teams$edges<
                      Query$ReadOrgRepositories$organization$teams$edges>?>?)
          _fn);
}

class _CopyWithImpl$Query$ReadOrgRepositories$organization$teams<TRes>
    implements CopyWith$Query$ReadOrgRepositories$organization$teams<TRes> {
  _CopyWithImpl$Query$ReadOrgRepositories$organization$teams(
    this._instance,
    this._then,
  );

  final Query$ReadOrgRepositories$organization$teams _instance;

  final TRes Function(Query$ReadOrgRepositories$organization$teams) _then;

  static const _undefined = {};

  TRes call({
    Object? totalCount = _undefined,
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ReadOrgRepositories$organization$teams(
        totalCount: totalCount == _undefined || totalCount == null
            ? _instance.totalCount
            : (totalCount as int),
        edges: edges == _undefined
            ? _instance.edges
            : (edges
                as List<Query$ReadOrgRepositories$organization$teams$edges?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes edges(
          Iterable<Query$ReadOrgRepositories$organization$teams$edges?>? Function(
                  Iterable<
                      CopyWith$Query$ReadOrgRepositories$organization$teams$edges<
                          Query$ReadOrgRepositories$organization$teams$edges>?>?)
              _fn) =>
      call(
          edges: _fn(_instance.edges?.map((e) => e == null
              ? null
              : CopyWith$Query$ReadOrgRepositories$organization$teams$edges(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams<TRes>
    implements CopyWith$Query$ReadOrgRepositories$organization$teams<TRes> {
  _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams(this._res);

  TRes _res;

  call({
    int? totalCount,
    List<Query$ReadOrgRepositories$organization$teams$edges?>? edges,
    String? $__typename,
  }) =>
      _res;
  edges(_fn) => _res;
}

class Query$ReadOrgRepositories$organization$teams$edges {
  Query$ReadOrgRepositories$organization$teams$edges({
    this.node,
    required this.$__typename,
  });

  factory Query$ReadOrgRepositories$organization$teams$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$ReadOrgRepositories$organization$teams$edges(
      node: l$node == null
          ? null
          : Query$ReadOrgRepositories$organization$teams$edges$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$ReadOrgRepositories$organization$teams$edges$node? node;

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
    if (!(other is Query$ReadOrgRepositories$organization$teams$edges) ||
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

extension UtilityExtension$Query$ReadOrgRepositories$organization$teams$edges
    on Query$ReadOrgRepositories$organization$teams$edges {
  CopyWith$Query$ReadOrgRepositories$organization$teams$edges<
          Query$ReadOrgRepositories$organization$teams$edges>
      get copyWith =>
          CopyWith$Query$ReadOrgRepositories$organization$teams$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ReadOrgRepositories$organization$teams$edges<
    TRes> {
  factory CopyWith$Query$ReadOrgRepositories$organization$teams$edges(
    Query$ReadOrgRepositories$organization$teams$edges instance,
    TRes Function(Query$ReadOrgRepositories$organization$teams$edges) then,
  ) = _CopyWithImpl$Query$ReadOrgRepositories$organization$teams$edges;

  factory CopyWith$Query$ReadOrgRepositories$organization$teams$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams$edges;

  TRes call({
    Query$ReadOrgRepositories$organization$teams$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node<TRes>
      get node;
}

class _CopyWithImpl$Query$ReadOrgRepositories$organization$teams$edges<TRes>
    implements
        CopyWith$Query$ReadOrgRepositories$organization$teams$edges<TRes> {
  _CopyWithImpl$Query$ReadOrgRepositories$organization$teams$edges(
    this._instance,
    this._then,
  );

  final Query$ReadOrgRepositories$organization$teams$edges _instance;

  final TRes Function(Query$ReadOrgRepositories$organization$teams$edges) _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ReadOrgRepositories$organization$teams$edges(
        node: node == _undefined
            ? _instance.node
            : (node
                as Query$ReadOrgRepositories$organization$teams$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node<TRes>
      get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node.stub(
            _then(_instance))
        : CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams$edges<TRes>
    implements
        CopyWith$Query$ReadOrgRepositories$organization$teams$edges<TRes> {
  _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams$edges(
      this._res);

  TRes _res;

  call({
    Query$ReadOrgRepositories$organization$teams$edges$node? node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node<TRes>
      get node =>
          CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node.stub(
              _res);
}

class Query$ReadOrgRepositories$organization$teams$edges$node {
  Query$ReadOrgRepositories$organization$teams$edges$node({
    required this.name,
    this.description,
    required this.repositories,
    required this.$__typename,
  });

  factory Query$ReadOrgRepositories$organization$teams$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$description = json['description'];
    final l$repositories = json['repositories'];
    final l$$__typename = json['__typename'];
    return Query$ReadOrgRepositories$organization$teams$edges$node(
      name: (l$name as String),
      description: (l$description as String?),
      repositories:
          Query$ReadOrgRepositories$organization$teams$edges$node$repositories
              .fromJson((l$repositories as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String? description;

  final Query$ReadOrgRepositories$organization$teams$edges$node$repositories
      repositories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$repositories = repositories;
    _resultData['repositories'] = l$repositories.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$description = description;
    final l$repositories = repositories;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$description,
      l$repositories,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$ReadOrgRepositories$organization$teams$edges$node) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$ReadOrgRepositories$organization$teams$edges$node
    on Query$ReadOrgRepositories$organization$teams$edges$node {
  CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node<
          Query$ReadOrgRepositories$organization$teams$edges$node>
      get copyWith =>
          CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node<
    TRes> {
  factory CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node(
    Query$ReadOrgRepositories$organization$teams$edges$node instance,
    TRes Function(Query$ReadOrgRepositories$organization$teams$edges$node) then,
  ) = _CopyWithImpl$Query$ReadOrgRepositories$organization$teams$edges$node;

  factory CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams$edges$node;

  TRes call({
    String? name,
    String? description,
    Query$ReadOrgRepositories$organization$teams$edges$node$repositories?
        repositories,
    String? $__typename,
  });
  CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories<
      TRes> get repositories;
}

class _CopyWithImpl$Query$ReadOrgRepositories$organization$teams$edges$node<
        TRes>
    implements
        CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node<TRes> {
  _CopyWithImpl$Query$ReadOrgRepositories$organization$teams$edges$node(
    this._instance,
    this._then,
  );

  final Query$ReadOrgRepositories$organization$teams$edges$node _instance;

  final TRes Function(Query$ReadOrgRepositories$organization$teams$edges$node)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? description = _undefined,
    Object? repositories = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ReadOrgRepositories$organization$teams$edges$node(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        repositories: repositories == _undefined || repositories == null
            ? _instance.repositories
            : (repositories
                as Query$ReadOrgRepositories$organization$teams$edges$node$repositories),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories<
      TRes> get repositories {
    final local$repositories = _instance.repositories;
    return CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories(
        local$repositories, (e) => call(repositories: e));
  }
}

class _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams$edges$node<
        TRes>
    implements
        CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node<TRes> {
  _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams$edges$node(
      this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    Query$ReadOrgRepositories$organization$teams$edges$node$repositories?
        repositories,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories<
          TRes>
      get repositories =>
          CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories
              .stub(_res);
}

class Query$ReadOrgRepositories$organization$teams$edges$node$repositories {
  Query$ReadOrgRepositories$organization$teams$edges$node$repositories({
    required this.totalCount,
    this.edges,
    required this.$__typename,
  });

  factory Query$ReadOrgRepositories$organization$teams$edges$node$repositories.fromJson(
      Map<String, dynamic> json) {
    final l$totalCount = json['totalCount'];
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$ReadOrgRepositories$organization$teams$edges$node$repositories(
      totalCount: (l$totalCount as int),
      edges: (l$edges as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int totalCount;

  final List<
          Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges?>?
      edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$totalCount = totalCount;
    _resultData['totalCount'] = l$totalCount;
    final l$edges = edges;
    _resultData['edges'] = l$edges?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$totalCount = totalCount;
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$totalCount,
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
            is Query$ReadOrgRepositories$organization$teams$edges$node$repositories) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$totalCount = totalCount;
    final lOther$totalCount = other.totalCount;
    if (l$totalCount != lOther$totalCount) {
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

extension UtilityExtension$Query$ReadOrgRepositories$organization$teams$edges$node$repositories
    on Query$ReadOrgRepositories$organization$teams$edges$node$repositories {
  CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories<
          Query$ReadOrgRepositories$organization$teams$edges$node$repositories>
      get copyWith =>
          CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories<
    TRes> {
  factory CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories(
    Query$ReadOrgRepositories$organization$teams$edges$node$repositories
        instance,
    TRes Function(
            Query$ReadOrgRepositories$organization$teams$edges$node$repositories)
        then,
  ) = _CopyWithImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories;

  factory CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories.stub(
          TRes res) =
      _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories;

  TRes call({
    int? totalCount,
    List<Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges?>?
        edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges?>? Function(
              Iterable<
                  CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges<
                      Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges>?>?)
          _fn);
}

class _CopyWithImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories<
        TRes>
    implements
        CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories<
            TRes> {
  _CopyWithImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories(
    this._instance,
    this._then,
  );

  final Query$ReadOrgRepositories$organization$teams$edges$node$repositories
      _instance;

  final TRes Function(
          Query$ReadOrgRepositories$organization$teams$edges$node$repositories)
      _then;

  static const _undefined = {};

  TRes call({
    Object? totalCount = _undefined,
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$ReadOrgRepositories$organization$teams$edges$node$repositories(
        totalCount: totalCount == _undefined || totalCount == null
            ? _instance.totalCount
            : (totalCount as int),
        edges: edges == _undefined
            ? _instance.edges
            : (edges as List<
                Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes edges(
          Iterable<Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges?>? Function(
                  Iterable<
                      CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges<
                          Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges>?>?)
              _fn) =>
      call(
          edges: _fn(_instance.edges?.map((e) => e == null
              ? null
              : CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories<
        TRes>
    implements
        CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories<
            TRes> {
  _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories(
      this._res);

  TRes _res;

  call({
    int? totalCount,
    List<Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges?>?
        edges,
    String? $__typename,
  }) =>
      _res;
  edges(_fn) => _res;
}

class Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges {
  Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges({
    required this.node,
    required this.$__typename,
  });

  factory Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges(
      node:
          Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node
              .fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node
      node;

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
            is Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges) ||
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

extension UtilityExtension$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges
    on Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges {
  CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges<
          Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges>
      get copyWith =>
          CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges<
    TRes> {
  factory CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges(
    Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges
        instance,
    TRes Function(
            Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges)
        then,
  ) = _CopyWithImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges;

  factory CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges;

  TRes call({
    Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node?
        node,
    String? $__typename,
  });
  CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node<
      TRes> get node;
}

class _CopyWithImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges<
        TRes>
    implements
        CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges<
            TRes> {
  _CopyWithImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges(
    this._instance,
    this._then,
  );

  final Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges
      _instance;

  final TRes Function(
          Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges)
      _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node
                as Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node<
      TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges<
        TRes>
    implements
        CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges<
            TRes> {
  _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges(
      this._res);

  TRes _res;

  call({
    Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node?
        node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node<
          TRes>
      get node =>
          CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node
              .stub(_res);
}

class Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node {
  Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node({
    required this.name,
    this.description,
    required this.url,
    required this.$__typename,
  });

  factory Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$description = json['description'];
    final l$url = json['url'];
    final l$$__typename = json['__typename'];
    return Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node(
      name: (l$name as String),
      description: (l$description as String?),
      url: (l$url as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String? description;

  final String url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$url = url;
    _resultData['url'] = l$url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$description = description;
    final l$url = url;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node
    on Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node {
  CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node<
          Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node>
      get copyWith =>
          CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node<
    TRes> {
  factory CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node(
    Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node
        instance,
    TRes Function(
            Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node)
        then,
  ) = _CopyWithImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node;

  factory CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node;

  TRes call({
    String? name,
    String? description,
    String? url,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node<
        TRes>
    implements
        CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node<
            TRes> {
  _CopyWithImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node(
    this._instance,
    this._then,
  );

  final Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node
      _instance;

  final TRes Function(
          Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? description = _undefined,
    Object? url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        url: url == _undefined || url == null ? _instance.url : (url as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node<
        TRes>
    implements
        CopyWith$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node<
            TRes> {
  _CopyWithStubImpl$Query$ReadOrgRepositories$organization$teams$edges$node$repositories$edges$node(
      this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    String? url,
    String? $__typename,
  }) =>
      _res;
}
