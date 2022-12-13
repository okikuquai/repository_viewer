import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$getReadmeFromRepository {
  factory Variables$Query$getReadmeFromRepository({
    required String orgName,
    required String repositoryName,
  }) =>
      Variables$Query$getReadmeFromRepository._({
        r'orgName': orgName,
        r'repositoryName': repositoryName,
      });

  Variables$Query$getReadmeFromRepository._(this._$data);

  factory Variables$Query$getReadmeFromRepository.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orgName = data['orgName'];
    result$data['orgName'] = (l$orgName as String);
    final l$repositoryName = data['repositoryName'];
    result$data['repositoryName'] = (l$repositoryName as String);
    return Variables$Query$getReadmeFromRepository._(result$data);
  }

  Map<String, dynamic> _$data;

  String get orgName => (_$data['orgName'] as String);
  String get repositoryName => (_$data['repositoryName'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orgName = orgName;
    result$data['orgName'] = l$orgName;
    final l$repositoryName = repositoryName;
    result$data['repositoryName'] = l$repositoryName;
    return result$data;
  }

  CopyWith$Variables$Query$getReadmeFromRepository<
          Variables$Query$getReadmeFromRepository>
      get copyWith => CopyWith$Variables$Query$getReadmeFromRepository(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getReadmeFromRepository) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$orgName = orgName;
    final lOther$orgName = other.orgName;
    if (l$orgName != lOther$orgName) {
      return false;
    }
    final l$repositoryName = repositoryName;
    final lOther$repositoryName = other.repositoryName;
    if (l$repositoryName != lOther$repositoryName) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$orgName = orgName;
    final l$repositoryName = repositoryName;
    return Object.hashAll([
      l$orgName,
      l$repositoryName,
    ]);
  }
}

abstract class CopyWith$Variables$Query$getReadmeFromRepository<TRes> {
  factory CopyWith$Variables$Query$getReadmeFromRepository(
    Variables$Query$getReadmeFromRepository instance,
    TRes Function(Variables$Query$getReadmeFromRepository) then,
  ) = _CopyWithImpl$Variables$Query$getReadmeFromRepository;

  factory CopyWith$Variables$Query$getReadmeFromRepository.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getReadmeFromRepository;

  TRes call({
    String? orgName,
    String? repositoryName,
  });
}

class _CopyWithImpl$Variables$Query$getReadmeFromRepository<TRes>
    implements CopyWith$Variables$Query$getReadmeFromRepository<TRes> {
  _CopyWithImpl$Variables$Query$getReadmeFromRepository(
    this._instance,
    this._then,
  );

  final Variables$Query$getReadmeFromRepository _instance;

  final TRes Function(Variables$Query$getReadmeFromRepository) _then;

  static const _undefined = {};

  TRes call({
    Object? orgName = _undefined,
    Object? repositoryName = _undefined,
  }) =>
      _then(Variables$Query$getReadmeFromRepository._({
        ..._instance._$data,
        if (orgName != _undefined && orgName != null)
          'orgName': (orgName as String),
        if (repositoryName != _undefined && repositoryName != null)
          'repositoryName': (repositoryName as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$getReadmeFromRepository<TRes>
    implements CopyWith$Variables$Query$getReadmeFromRepository<TRes> {
  _CopyWithStubImpl$Variables$Query$getReadmeFromRepository(this._res);

  TRes _res;

  call({
    String? orgName,
    String? repositoryName,
  }) =>
      _res;
}

class Query$getReadmeFromRepository {
  Query$getReadmeFromRepository({
    this.organization,
    required this.$__typename,
  });

  factory Query$getReadmeFromRepository.fromJson(Map<String, dynamic> json) {
    final l$organization = json['organization'];
    final l$$__typename = json['__typename'];
    return Query$getReadmeFromRepository(
      organization: l$organization == null
          ? null
          : Query$getReadmeFromRepository$organization.fromJson(
              (l$organization as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getReadmeFromRepository$organization? organization;

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
    if (!(other is Query$getReadmeFromRepository) ||
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

extension UtilityExtension$Query$getReadmeFromRepository
    on Query$getReadmeFromRepository {
  CopyWith$Query$getReadmeFromRepository<Query$getReadmeFromRepository>
      get copyWith => CopyWith$Query$getReadmeFromRepository(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getReadmeFromRepository<TRes> {
  factory CopyWith$Query$getReadmeFromRepository(
    Query$getReadmeFromRepository instance,
    TRes Function(Query$getReadmeFromRepository) then,
  ) = _CopyWithImpl$Query$getReadmeFromRepository;

  factory CopyWith$Query$getReadmeFromRepository.stub(TRes res) =
      _CopyWithStubImpl$Query$getReadmeFromRepository;

  TRes call({
    Query$getReadmeFromRepository$organization? organization,
    String? $__typename,
  });
  CopyWith$Query$getReadmeFromRepository$organization<TRes> get organization;
}

class _CopyWithImpl$Query$getReadmeFromRepository<TRes>
    implements CopyWith$Query$getReadmeFromRepository<TRes> {
  _CopyWithImpl$Query$getReadmeFromRepository(
    this._instance,
    this._then,
  );

  final Query$getReadmeFromRepository _instance;

  final TRes Function(Query$getReadmeFromRepository) _then;

  static const _undefined = {};

  TRes call({
    Object? organization = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getReadmeFromRepository(
        organization: organization == _undefined
            ? _instance.organization
            : (organization as Query$getReadmeFromRepository$organization?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getReadmeFromRepository$organization<TRes> get organization {
    final local$organization = _instance.organization;
    return local$organization == null
        ? CopyWith$Query$getReadmeFromRepository$organization.stub(
            _then(_instance))
        : CopyWith$Query$getReadmeFromRepository$organization(
            local$organization, (e) => call(organization: e));
  }
}

class _CopyWithStubImpl$Query$getReadmeFromRepository<TRes>
    implements CopyWith$Query$getReadmeFromRepository<TRes> {
  _CopyWithStubImpl$Query$getReadmeFromRepository(this._res);

  TRes _res;

  call({
    Query$getReadmeFromRepository$organization? organization,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getReadmeFromRepository$organization<TRes> get organization =>
      CopyWith$Query$getReadmeFromRepository$organization.stub(_res);
}

const documentNodeQuerygetReadmeFromRepository = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getReadmeFromRepository'),
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
        variable: VariableNode(name: NameNode(value: 'repositoryName')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
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
            name: NameNode(value: 'repository'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'name'),
                value: VariableNode(name: NameNode(value: 'repositoryName')),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'object'),
                alias: null,
                arguments: [
                  ArgumentNode(
                    name: NameNode(value: 'expression'),
                    value: StringValueNode(
                      value: 'main:README.md',
                      isBlock: false,
                    ),
                  )
                ],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  InlineFragmentNode(
                    typeCondition: TypeConditionNode(
                        on: NamedTypeNode(
                      name: NameNode(value: 'Blob'),
                      isNonNull: false,
                    )),
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'text'),
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
Query$getReadmeFromRepository _parserFn$Query$getReadmeFromRepository(
        Map<String, dynamic> data) =>
    Query$getReadmeFromRepository.fromJson(data);

class Options$Query$getReadmeFromRepository
    extends graphql.QueryOptions<Query$getReadmeFromRepository> {
  Options$Query$getReadmeFromRepository({
    String? operationName,
    required Variables$Query$getReadmeFromRepository variables,
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
          document: documentNodeQuerygetReadmeFromRepository,
          parserFn: _parserFn$Query$getReadmeFromRepository,
        );
}

class WatchOptions$Query$getReadmeFromRepository
    extends graphql.WatchQueryOptions<Query$getReadmeFromRepository> {
  WatchOptions$Query$getReadmeFromRepository({
    String? operationName,
    required Variables$Query$getReadmeFromRepository variables,
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
          document: documentNodeQuerygetReadmeFromRepository,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getReadmeFromRepository,
        );
}

class FetchMoreOptions$Query$getReadmeFromRepository
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getReadmeFromRepository({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getReadmeFromRepository variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetReadmeFromRepository,
        );
}

extension ClientExtension$Query$getReadmeFromRepository
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getReadmeFromRepository>>
      query$getReadmeFromRepository(
              Options$Query$getReadmeFromRepository options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getReadmeFromRepository>
      watchQuery$getReadmeFromRepository(
              WatchOptions$Query$getReadmeFromRepository options) =>
          this.watchQuery(options);
  void writeQuery$getReadmeFromRepository({
    required Query$getReadmeFromRepository data,
    required Variables$Query$getReadmeFromRepository variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetReadmeFromRepository),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getReadmeFromRepository? readQuery$getReadmeFromRepository({
    required Variables$Query$getReadmeFromRepository variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetReadmeFromRepository),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getReadmeFromRepository.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getReadmeFromRepository>
    useQuery$getReadmeFromRepository(
            Options$Query$getReadmeFromRepository options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getReadmeFromRepository>
    useWatchQuery$getReadmeFromRepository(
            WatchOptions$Query$getReadmeFromRepository options) =>
        graphql_flutter.useWatchQuery(options);

class Query$getReadmeFromRepository$Widget
    extends graphql_flutter.Query<Query$getReadmeFromRepository> {
  Query$getReadmeFromRepository$Widget({
    widgets.Key? key,
    required Options$Query$getReadmeFromRepository options,
    required graphql_flutter.QueryBuilder<Query$getReadmeFromRepository>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$getReadmeFromRepository$organization {
  Query$getReadmeFromRepository$organization({
    this.repository,
    required this.$__typename,
  });

  factory Query$getReadmeFromRepository$organization.fromJson(
      Map<String, dynamic> json) {
    final l$repository = json['repository'];
    final l$$__typename = json['__typename'];
    return Query$getReadmeFromRepository$organization(
      repository: l$repository == null
          ? null
          : Query$getReadmeFromRepository$organization$repository.fromJson(
              (l$repository as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getReadmeFromRepository$organization$repository? repository;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$repository = repository;
    _resultData['repository'] = l$repository?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$repository = repository;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$repository,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getReadmeFromRepository$organization) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$repository = repository;
    final lOther$repository = other.repository;
    if (l$repository != lOther$repository) {
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

extension UtilityExtension$Query$getReadmeFromRepository$organization
    on Query$getReadmeFromRepository$organization {
  CopyWith$Query$getReadmeFromRepository$organization<
          Query$getReadmeFromRepository$organization>
      get copyWith => CopyWith$Query$getReadmeFromRepository$organization(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getReadmeFromRepository$organization<TRes> {
  factory CopyWith$Query$getReadmeFromRepository$organization(
    Query$getReadmeFromRepository$organization instance,
    TRes Function(Query$getReadmeFromRepository$organization) then,
  ) = _CopyWithImpl$Query$getReadmeFromRepository$organization;

  factory CopyWith$Query$getReadmeFromRepository$organization.stub(TRes res) =
      _CopyWithStubImpl$Query$getReadmeFromRepository$organization;

  TRes call({
    Query$getReadmeFromRepository$organization$repository? repository,
    String? $__typename,
  });
  CopyWith$Query$getReadmeFromRepository$organization$repository<TRes>
      get repository;
}

class _CopyWithImpl$Query$getReadmeFromRepository$organization<TRes>
    implements CopyWith$Query$getReadmeFromRepository$organization<TRes> {
  _CopyWithImpl$Query$getReadmeFromRepository$organization(
    this._instance,
    this._then,
  );

  final Query$getReadmeFromRepository$organization _instance;

  final TRes Function(Query$getReadmeFromRepository$organization) _then;

  static const _undefined = {};

  TRes call({
    Object? repository = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getReadmeFromRepository$organization(
        repository: repository == _undefined
            ? _instance.repository
            : (repository
                as Query$getReadmeFromRepository$organization$repository?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getReadmeFromRepository$organization$repository<TRes>
      get repository {
    final local$repository = _instance.repository;
    return local$repository == null
        ? CopyWith$Query$getReadmeFromRepository$organization$repository.stub(
            _then(_instance))
        : CopyWith$Query$getReadmeFromRepository$organization$repository(
            local$repository, (e) => call(repository: e));
  }
}

class _CopyWithStubImpl$Query$getReadmeFromRepository$organization<TRes>
    implements CopyWith$Query$getReadmeFromRepository$organization<TRes> {
  _CopyWithStubImpl$Query$getReadmeFromRepository$organization(this._res);

  TRes _res;

  call({
    Query$getReadmeFromRepository$organization$repository? repository,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getReadmeFromRepository$organization$repository<TRes>
      get repository =>
          CopyWith$Query$getReadmeFromRepository$organization$repository.stub(
              _res);
}

class Query$getReadmeFromRepository$organization$repository {
  Query$getReadmeFromRepository$organization$repository({
    this.object,
    required this.$__typename,
  });

  factory Query$getReadmeFromRepository$organization$repository.fromJson(
      Map<String, dynamic> json) {
    final l$object = json['object'];
    final l$$__typename = json['__typename'];
    return Query$getReadmeFromRepository$organization$repository(
      object: l$object == null
          ? null
          : Query$getReadmeFromRepository$organization$repository$object
              .fromJson((l$object as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getReadmeFromRepository$organization$repository$object? object;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$object = object;
    _resultData['object'] = l$object?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$object = object;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$object,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getReadmeFromRepository$organization$repository) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$object = object;
    final lOther$object = other.object;
    if (l$object != lOther$object) {
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

extension UtilityExtension$Query$getReadmeFromRepository$organization$repository
    on Query$getReadmeFromRepository$organization$repository {
  CopyWith$Query$getReadmeFromRepository$organization$repository<
          Query$getReadmeFromRepository$organization$repository>
      get copyWith =>
          CopyWith$Query$getReadmeFromRepository$organization$repository(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getReadmeFromRepository$organization$repository<
    TRes> {
  factory CopyWith$Query$getReadmeFromRepository$organization$repository(
    Query$getReadmeFromRepository$organization$repository instance,
    TRes Function(Query$getReadmeFromRepository$organization$repository) then,
  ) = _CopyWithImpl$Query$getReadmeFromRepository$organization$repository;

  factory CopyWith$Query$getReadmeFromRepository$organization$repository.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getReadmeFromRepository$organization$repository;

  TRes call({
    Query$getReadmeFromRepository$organization$repository$object? object,
    String? $__typename,
  });
  CopyWith$Query$getReadmeFromRepository$organization$repository$object<TRes>
      get object;
}

class _CopyWithImpl$Query$getReadmeFromRepository$organization$repository<TRes>
    implements
        CopyWith$Query$getReadmeFromRepository$organization$repository<TRes> {
  _CopyWithImpl$Query$getReadmeFromRepository$organization$repository(
    this._instance,
    this._then,
  );

  final Query$getReadmeFromRepository$organization$repository _instance;

  final TRes Function(Query$getReadmeFromRepository$organization$repository)
      _then;

  static const _undefined = {};

  TRes call({
    Object? object = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getReadmeFromRepository$organization$repository(
        object: object == _undefined
            ? _instance.object
            : (object
                as Query$getReadmeFromRepository$organization$repository$object?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getReadmeFromRepository$organization$repository$object<TRes>
      get object {
    final local$object = _instance.object;
    return local$object == null
        ? CopyWith$Query$getReadmeFromRepository$organization$repository$object
            .stub(_then(_instance))
        : CopyWith$Query$getReadmeFromRepository$organization$repository$object(
            local$object, (e) => call(object: e));
  }
}

class _CopyWithStubImpl$Query$getReadmeFromRepository$organization$repository<
        TRes>
    implements
        CopyWith$Query$getReadmeFromRepository$organization$repository<TRes> {
  _CopyWithStubImpl$Query$getReadmeFromRepository$organization$repository(
      this._res);

  TRes _res;

  call({
    Query$getReadmeFromRepository$organization$repository$object? object,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getReadmeFromRepository$organization$repository$object<TRes>
      get object =>
          CopyWith$Query$getReadmeFromRepository$organization$repository$object
              .stub(_res);
}

class Query$getReadmeFromRepository$organization$repository$object {
  Query$getReadmeFromRepository$organization$repository$object(
      {required this.$__typename});

  factory Query$getReadmeFromRepository$organization$repository$object.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Blob":
        return Query$getReadmeFromRepository$organization$repository$object$$Blob
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$getReadmeFromRepository$organization$repository$object(
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
    if (!(other
            is Query$getReadmeFromRepository$organization$repository$object) ||
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

extension UtilityExtension$Query$getReadmeFromRepository$organization$repository$object
    on Query$getReadmeFromRepository$organization$repository$object {
  CopyWith$Query$getReadmeFromRepository$organization$repository$object<
          Query$getReadmeFromRepository$organization$repository$object>
      get copyWith =>
          CopyWith$Query$getReadmeFromRepository$organization$repository$object(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getReadmeFromRepository$organization$repository$object<
    TRes> {
  factory CopyWith$Query$getReadmeFromRepository$organization$repository$object(
    Query$getReadmeFromRepository$organization$repository$object instance,
    TRes Function(Query$getReadmeFromRepository$organization$repository$object)
        then,
  ) = _CopyWithImpl$Query$getReadmeFromRepository$organization$repository$object;

  factory CopyWith$Query$getReadmeFromRepository$organization$repository$object.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getReadmeFromRepository$organization$repository$object;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$getReadmeFromRepository$organization$repository$object<
        TRes>
    implements
        CopyWith$Query$getReadmeFromRepository$organization$repository$object<
            TRes> {
  _CopyWithImpl$Query$getReadmeFromRepository$organization$repository$object(
    this._instance,
    this._then,
  );

  final Query$getReadmeFromRepository$organization$repository$object _instance;

  final TRes Function(
      Query$getReadmeFromRepository$organization$repository$object) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$getReadmeFromRepository$organization$repository$object(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$getReadmeFromRepository$organization$repository$object<
        TRes>
    implements
        CopyWith$Query$getReadmeFromRepository$organization$repository$object<
            TRes> {
  _CopyWithStubImpl$Query$getReadmeFromRepository$organization$repository$object(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$getReadmeFromRepository$organization$repository$object$$Blob
    implements Query$getReadmeFromRepository$organization$repository$object {
  Query$getReadmeFromRepository$organization$repository$object$$Blob({
    required this.$__typename,
    this.text,
  });

  factory Query$getReadmeFromRepository$organization$repository$object$$Blob.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$text = json['text'];
    return Query$getReadmeFromRepository$organization$repository$object$$Blob(
      $__typename: (l$$__typename as String),
      text: (l$text as String?),
    );
  }

  final String $__typename;

  final String? text;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$text = text;
    _resultData['text'] = l$text;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$text = text;
    return Object.hashAll([
      l$$__typename,
      l$text,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getReadmeFromRepository$organization$repository$object$$Blob) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getReadmeFromRepository$organization$repository$object$$Blob
    on Query$getReadmeFromRepository$organization$repository$object$$Blob {
  CopyWith$Query$getReadmeFromRepository$organization$repository$object$$Blob<
          Query$getReadmeFromRepository$organization$repository$object$$Blob>
      get copyWith =>
          CopyWith$Query$getReadmeFromRepository$organization$repository$object$$Blob(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getReadmeFromRepository$organization$repository$object$$Blob<
    TRes> {
  factory CopyWith$Query$getReadmeFromRepository$organization$repository$object$$Blob(
    Query$getReadmeFromRepository$organization$repository$object$$Blob instance,
    TRes Function(
            Query$getReadmeFromRepository$organization$repository$object$$Blob)
        then,
  ) = _CopyWithImpl$Query$getReadmeFromRepository$organization$repository$object$$Blob;

  factory CopyWith$Query$getReadmeFromRepository$organization$repository$object$$Blob.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getReadmeFromRepository$organization$repository$object$$Blob;

  TRes call({
    String? $__typename,
    String? text,
  });
}

class _CopyWithImpl$Query$getReadmeFromRepository$organization$repository$object$$Blob<
        TRes>
    implements
        CopyWith$Query$getReadmeFromRepository$organization$repository$object$$Blob<
            TRes> {
  _CopyWithImpl$Query$getReadmeFromRepository$organization$repository$object$$Blob(
    this._instance,
    this._then,
  );

  final Query$getReadmeFromRepository$organization$repository$object$$Blob
      _instance;

  final TRes Function(
      Query$getReadmeFromRepository$organization$repository$object$$Blob) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? text = _undefined,
  }) =>
      _then(Query$getReadmeFromRepository$organization$repository$object$$Blob(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        text: text == _undefined ? _instance.text : (text as String?),
      ));
}

class _CopyWithStubImpl$Query$getReadmeFromRepository$organization$repository$object$$Blob<
        TRes>
    implements
        CopyWith$Query$getReadmeFromRepository$organization$repository$object$$Blob<
            TRes> {
  _CopyWithStubImpl$Query$getReadmeFromRepository$organization$repository$object$$Blob(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? text,
  }) =>
      _res;
}
