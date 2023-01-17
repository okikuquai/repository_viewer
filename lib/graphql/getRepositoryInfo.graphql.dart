import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:repositoryviewer/graphql/type/custom_url.dart';

class Variables$Query$getRepositoryInfo {
  factory Variables$Query$getRepositoryInfo({
    required String orgName,
    required String repositoryName,
  }) =>
      Variables$Query$getRepositoryInfo._({
        r'orgName': orgName,
        r'repositoryName': repositoryName,
      });

  Variables$Query$getRepositoryInfo._(this._$data);

  factory Variables$Query$getRepositoryInfo.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orgName = data['orgName'];
    result$data['orgName'] = (l$orgName as String);
    final l$repositoryName = data['repositoryName'];
    result$data['repositoryName'] = (l$repositoryName as String);
    return Variables$Query$getRepositoryInfo._(result$data);
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

  CopyWith$Variables$Query$getRepositoryInfo<Variables$Query$getRepositoryInfo>
      get copyWith => CopyWith$Variables$Query$getRepositoryInfo(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRepositoryInfo) ||
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

abstract class CopyWith$Variables$Query$getRepositoryInfo<TRes> {
  factory CopyWith$Variables$Query$getRepositoryInfo(
    Variables$Query$getRepositoryInfo instance,
    TRes Function(Variables$Query$getRepositoryInfo) then,
  ) = _CopyWithImpl$Variables$Query$getRepositoryInfo;

  factory CopyWith$Variables$Query$getRepositoryInfo.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRepositoryInfo;

  TRes call({
    String? orgName,
    String? repositoryName,
  });
}

class _CopyWithImpl$Variables$Query$getRepositoryInfo<TRes>
    implements CopyWith$Variables$Query$getRepositoryInfo<TRes> {
  _CopyWithImpl$Variables$Query$getRepositoryInfo(
    this._instance,
    this._then,
  );

  final Variables$Query$getRepositoryInfo _instance;

  final TRes Function(Variables$Query$getRepositoryInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? orgName = _undefined,
    Object? repositoryName = _undefined,
  }) =>
      _then(Variables$Query$getRepositoryInfo._({
        ..._instance._$data,
        if (orgName != _undefined && orgName != null)
          'orgName': (orgName as String),
        if (repositoryName != _undefined && repositoryName != null)
          'repositoryName': (repositoryName as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRepositoryInfo<TRes>
    implements CopyWith$Variables$Query$getRepositoryInfo<TRes> {
  _CopyWithStubImpl$Variables$Query$getRepositoryInfo(this._res);

  TRes _res;

  call({
    String? orgName,
    String? repositoryName,
  }) =>
      _res;
}

class Query$getRepositoryInfo {
  Query$getRepositoryInfo({
    this.organization,
    required this.$__typename,
  });

  factory Query$getRepositoryInfo.fromJson(Map<String, dynamic> json) {
    final l$organization = json['organization'];
    final l$$__typename = json['__typename'];
    return Query$getRepositoryInfo(
      organization: l$organization == null
          ? null
          : Query$getRepositoryInfo$organization.fromJson(
              (l$organization as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getRepositoryInfo$organization? organization;

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
    if (!(other is Query$getRepositoryInfo) ||
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

extension UtilityExtension$Query$getRepositoryInfo on Query$getRepositoryInfo {
  CopyWith$Query$getRepositoryInfo<Query$getRepositoryInfo> get copyWith =>
      CopyWith$Query$getRepositoryInfo(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getRepositoryInfo<TRes> {
  factory CopyWith$Query$getRepositoryInfo(
    Query$getRepositoryInfo instance,
    TRes Function(Query$getRepositoryInfo) then,
  ) = _CopyWithImpl$Query$getRepositoryInfo;

  factory CopyWith$Query$getRepositoryInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$getRepositoryInfo;

  TRes call({
    Query$getRepositoryInfo$organization? organization,
    String? $__typename,
  });
  CopyWith$Query$getRepositoryInfo$organization<TRes> get organization;
}

class _CopyWithImpl$Query$getRepositoryInfo<TRes>
    implements CopyWith$Query$getRepositoryInfo<TRes> {
  _CopyWithImpl$Query$getRepositoryInfo(
    this._instance,
    this._then,
  );

  final Query$getRepositoryInfo _instance;

  final TRes Function(Query$getRepositoryInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? organization = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRepositoryInfo(
        organization: organization == _undefined
            ? _instance.organization
            : (organization as Query$getRepositoryInfo$organization?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRepositoryInfo$organization<TRes> get organization {
    final local$organization = _instance.organization;
    return local$organization == null
        ? CopyWith$Query$getRepositoryInfo$organization.stub(_then(_instance))
        : CopyWith$Query$getRepositoryInfo$organization(
            local$organization, (e) => call(organization: e));
  }
}

class _CopyWithStubImpl$Query$getRepositoryInfo<TRes>
    implements CopyWith$Query$getRepositoryInfo<TRes> {
  _CopyWithStubImpl$Query$getRepositoryInfo(this._res);

  TRes _res;

  call({
    Query$getRepositoryInfo$organization? organization,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRepositoryInfo$organization<TRes> get organization =>
      CopyWith$Query$getRepositoryInfo$organization.stub(_res);
}

const documentNodeQuerygetRepositoryInfo = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRepositoryInfo'),
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
]);
Query$getRepositoryInfo _parserFn$Query$getRepositoryInfo(
        Map<String, dynamic> data) =>
    Query$getRepositoryInfo.fromJson(data);

class Options$Query$getRepositoryInfo
    extends graphql.QueryOptions<Query$getRepositoryInfo> {
  Options$Query$getRepositoryInfo({
    String? operationName,
    required Variables$Query$getRepositoryInfo variables,
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
          document: documentNodeQuerygetRepositoryInfo,
          parserFn: _parserFn$Query$getRepositoryInfo,
        );
}

class WatchOptions$Query$getRepositoryInfo
    extends graphql.WatchQueryOptions<Query$getRepositoryInfo> {
  WatchOptions$Query$getRepositoryInfo({
    String? operationName,
    required Variables$Query$getRepositoryInfo variables,
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
          document: documentNodeQuerygetRepositoryInfo,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRepositoryInfo,
        );
}

class FetchMoreOptions$Query$getRepositoryInfo
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRepositoryInfo({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRepositoryInfo variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRepositoryInfo,
        );
}

extension ClientExtension$Query$getRepositoryInfo on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRepositoryInfo>> query$getRepositoryInfo(
          Options$Query$getRepositoryInfo options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getRepositoryInfo> watchQuery$getRepositoryInfo(
          WatchOptions$Query$getRepositoryInfo options) =>
      this.watchQuery(options);
  void writeQuery$getRepositoryInfo({
    required Query$getRepositoryInfo data,
    required Variables$Query$getRepositoryInfo variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetRepositoryInfo),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRepositoryInfo? readQuery$getRepositoryInfo({
    required Variables$Query$getRepositoryInfo variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetRepositoryInfo),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getRepositoryInfo.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getRepositoryInfo>
    useQuery$getRepositoryInfo(Options$Query$getRepositoryInfo options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getRepositoryInfo>
    useWatchQuery$getRepositoryInfo(
            WatchOptions$Query$getRepositoryInfo options) =>
        graphql_flutter.useWatchQuery(options);

class Query$getRepositoryInfo$Widget
    extends graphql_flutter.Query<Query$getRepositoryInfo> {
  Query$getRepositoryInfo$Widget({
    widgets.Key? key,
    required Options$Query$getRepositoryInfo options,
    required graphql_flutter.QueryBuilder<Query$getRepositoryInfo> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$getRepositoryInfo$organization {
  Query$getRepositoryInfo$organization({
    this.repository,
    required this.$__typename,
  });

  factory Query$getRepositoryInfo$organization.fromJson(
      Map<String, dynamic> json) {
    final l$repository = json['repository'];
    final l$$__typename = json['__typename'];
    return Query$getRepositoryInfo$organization(
      repository: l$repository == null
          ? null
          : Query$getRepositoryInfo$organization$repository.fromJson(
              (l$repository as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getRepositoryInfo$organization$repository? repository;

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
    if (!(other is Query$getRepositoryInfo$organization) ||
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

extension UtilityExtension$Query$getRepositoryInfo$organization
    on Query$getRepositoryInfo$organization {
  CopyWith$Query$getRepositoryInfo$organization<
          Query$getRepositoryInfo$organization>
      get copyWith => CopyWith$Query$getRepositoryInfo$organization(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryInfo$organization<TRes> {
  factory CopyWith$Query$getRepositoryInfo$organization(
    Query$getRepositoryInfo$organization instance,
    TRes Function(Query$getRepositoryInfo$organization) then,
  ) = _CopyWithImpl$Query$getRepositoryInfo$organization;

  factory CopyWith$Query$getRepositoryInfo$organization.stub(TRes res) =
      _CopyWithStubImpl$Query$getRepositoryInfo$organization;

  TRes call({
    Query$getRepositoryInfo$organization$repository? repository,
    String? $__typename,
  });
  CopyWith$Query$getRepositoryInfo$organization$repository<TRes> get repository;
}

class _CopyWithImpl$Query$getRepositoryInfo$organization<TRes>
    implements CopyWith$Query$getRepositoryInfo$organization<TRes> {
  _CopyWithImpl$Query$getRepositoryInfo$organization(
    this._instance,
    this._then,
  );

  final Query$getRepositoryInfo$organization _instance;

  final TRes Function(Query$getRepositoryInfo$organization) _then;

  static const _undefined = {};

  TRes call({
    Object? repository = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRepositoryInfo$organization(
        repository: repository == _undefined
            ? _instance.repository
            : (repository as Query$getRepositoryInfo$organization$repository?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRepositoryInfo$organization$repository<TRes>
      get repository {
    final local$repository = _instance.repository;
    return local$repository == null
        ? CopyWith$Query$getRepositoryInfo$organization$repository.stub(
            _then(_instance))
        : CopyWith$Query$getRepositoryInfo$organization$repository(
            local$repository, (e) => call(repository: e));
  }
}

class _CopyWithStubImpl$Query$getRepositoryInfo$organization<TRes>
    implements CopyWith$Query$getRepositoryInfo$organization<TRes> {
  _CopyWithStubImpl$Query$getRepositoryInfo$organization(this._res);

  TRes _res;

  call({
    Query$getRepositoryInfo$organization$repository? repository,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRepositoryInfo$organization$repository<TRes>
      get repository =>
          CopyWith$Query$getRepositoryInfo$organization$repository.stub(_res);
}

class Query$getRepositoryInfo$organization$repository {
  Query$getRepositoryInfo$organization$repository({
    required this.name,
    this.description,
    required this.url,
    required this.$__typename,
  });

  factory Query$getRepositoryInfo$organization$repository.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$description = json['description'];
    final l$url = json['url'];
    final l$$__typename = json['__typename'];
    return Query$getRepositoryInfo$organization$repository(
      name: (l$name as String),
      description: (l$description as String?),
      url: customUriFromJson(l$url),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String? description;

  final CustomURI url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    if (!(other is Query$getRepositoryInfo$organization$repository) ||
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

extension UtilityExtension$Query$getRepositoryInfo$organization$repository
    on Query$getRepositoryInfo$organization$repository {
  CopyWith$Query$getRepositoryInfo$organization$repository<
          Query$getRepositoryInfo$organization$repository>
      get copyWith => CopyWith$Query$getRepositoryInfo$organization$repository(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryInfo$organization$repository<TRes> {
  factory CopyWith$Query$getRepositoryInfo$organization$repository(
    Query$getRepositoryInfo$organization$repository instance,
    TRes Function(Query$getRepositoryInfo$organization$repository) then,
  ) = _CopyWithImpl$Query$getRepositoryInfo$organization$repository;

  factory CopyWith$Query$getRepositoryInfo$organization$repository.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRepositoryInfo$organization$repository;

  TRes call({
    String? name,
    String? description,
    CustomURI? url,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRepositoryInfo$organization$repository<TRes>
    implements CopyWith$Query$getRepositoryInfo$organization$repository<TRes> {
  _CopyWithImpl$Query$getRepositoryInfo$organization$repository(
    this._instance,
    this._then,
  );

  final Query$getRepositoryInfo$organization$repository _instance;

  final TRes Function(Query$getRepositoryInfo$organization$repository) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? description = _undefined,
    Object? url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRepositoryInfo$organization$repository(
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

class _CopyWithStubImpl$Query$getRepositoryInfo$organization$repository<TRes>
    implements CopyWith$Query$getRepositoryInfo$organization$repository<TRes> {
  _CopyWithStubImpl$Query$getRepositoryInfo$organization$repository(this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    CustomURI? url,
    String? $__typename,
  }) =>
      _res;
}
