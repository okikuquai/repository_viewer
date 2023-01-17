import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:repositoryviewer/graphql/type/custom_id.dart';

class Fragment$Readme {
  Fragment$Readme({
    this.object,
    required this.$__typename,
  });

  factory Fragment$Readme.fromJson(Map<String, dynamic> json) {
    final l$object = json['object'];
    final l$$__typename = json['__typename'];
    return Fragment$Readme(
      object: l$object == null
          ? null
          : Fragment$Readme$object.fromJson((l$object as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$Readme$object? object;

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
    if (!(other is Fragment$Readme) || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$Readme on Fragment$Readme {
  CopyWith$Fragment$Readme<Fragment$Readme> get copyWith =>
      CopyWith$Fragment$Readme(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$Readme<TRes> {
  factory CopyWith$Fragment$Readme(
    Fragment$Readme instance,
    TRes Function(Fragment$Readme) then,
  ) = _CopyWithImpl$Fragment$Readme;

  factory CopyWith$Fragment$Readme.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Readme;

  TRes call({
    Fragment$Readme$object? object,
    String? $__typename,
  });
  CopyWith$Fragment$Readme$object<TRes> get object;
}

class _CopyWithImpl$Fragment$Readme<TRes>
    implements CopyWith$Fragment$Readme<TRes> {
  _CopyWithImpl$Fragment$Readme(
    this._instance,
    this._then,
  );

  final Fragment$Readme _instance;

  final TRes Function(Fragment$Readme) _then;

  static const _undefined = {};

  TRes call({
    Object? object = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Readme(
        object: object == _undefined
            ? _instance.object
            : (object as Fragment$Readme$object?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Readme$object<TRes> get object {
    final local$object = _instance.object;
    return local$object == null
        ? CopyWith$Fragment$Readme$object.stub(_then(_instance))
        : CopyWith$Fragment$Readme$object(local$object, (e) => call(object: e));
  }
}

class _CopyWithStubImpl$Fragment$Readme<TRes>
    implements CopyWith$Fragment$Readme<TRes> {
  _CopyWithStubImpl$Fragment$Readme(this._res);

  TRes _res;

  call({
    Fragment$Readme$object? object,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Readme$object<TRes> get object =>
      CopyWith$Fragment$Readme$object.stub(_res);
}

const fragmentDefinitionReadme = FragmentDefinitionNode(
  name: NameNode(value: 'Readme'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Repository'),
    isNonNull: false,
  )),
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
        FragmentSpreadNode(
          name: NameNode(value: 'ReadmeMDString'),
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
);
const documentNodeFragmentReadme = DocumentNode(definitions: [
  fragmentDefinitionReadme,
  fragmentDefinitionReadmeMDString,
]);

extension ClientExtension$Fragment$Readme on graphql.GraphQLClient {
  void writeFragment$Readme({
    required Fragment$Readme data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'Readme',
            document: documentNodeFragmentReadme,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$Readme? readFragment$Readme({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'Readme',
          document: documentNodeFragmentReadme,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$Readme.fromJson(result);
  }
}

class Fragment$Readme$object {
  Fragment$Readme$object({required this.$__typename});

  factory Fragment$Readme$object.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Blob":
        return Fragment$Readme$object$$Blob.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$Readme$object($__typename: (l$$__typename as String));
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
    if (!(other is Fragment$Readme$object) ||
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

extension UtilityExtension$Fragment$Readme$object on Fragment$Readme$object {
  CopyWith$Fragment$Readme$object<Fragment$Readme$object> get copyWith =>
      CopyWith$Fragment$Readme$object(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$Readme$object<TRes> {
  factory CopyWith$Fragment$Readme$object(
    Fragment$Readme$object instance,
    TRes Function(Fragment$Readme$object) then,
  ) = _CopyWithImpl$Fragment$Readme$object;

  factory CopyWith$Fragment$Readme$object.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Readme$object;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$Readme$object<TRes>
    implements CopyWith$Fragment$Readme$object<TRes> {
  _CopyWithImpl$Fragment$Readme$object(
    this._instance,
    this._then,
  );

  final Fragment$Readme$object _instance;

  final TRes Function(Fragment$Readme$object) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) => _then(Fragment$Readme$object(
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$Readme$object<TRes>
    implements CopyWith$Fragment$Readme$object<TRes> {
  _CopyWithStubImpl$Fragment$Readme$object(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$Readme$object$$Blob
    implements Fragment$ReadmeMDString, Fragment$Readme$object {
  Fragment$Readme$object$$Blob({
    required this.$__typename,
    this.text,
  });

  factory Fragment$Readme$object$$Blob.fromJson(Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$text = json['text'];
    return Fragment$Readme$object$$Blob(
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
    if (!(other is Fragment$Readme$object$$Blob) ||
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

extension UtilityExtension$Fragment$Readme$object$$Blob
    on Fragment$Readme$object$$Blob {
  CopyWith$Fragment$Readme$object$$Blob<Fragment$Readme$object$$Blob>
      get copyWith => CopyWith$Fragment$Readme$object$$Blob(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Readme$object$$Blob<TRes> {
  factory CopyWith$Fragment$Readme$object$$Blob(
    Fragment$Readme$object$$Blob instance,
    TRes Function(Fragment$Readme$object$$Blob) then,
  ) = _CopyWithImpl$Fragment$Readme$object$$Blob;

  factory CopyWith$Fragment$Readme$object$$Blob.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Readme$object$$Blob;

  TRes call({
    String? $__typename,
    String? text,
  });
}

class _CopyWithImpl$Fragment$Readme$object$$Blob<TRes>
    implements CopyWith$Fragment$Readme$object$$Blob<TRes> {
  _CopyWithImpl$Fragment$Readme$object$$Blob(
    this._instance,
    this._then,
  );

  final Fragment$Readme$object$$Blob _instance;

  final TRes Function(Fragment$Readme$object$$Blob) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? text = _undefined,
  }) =>
      _then(Fragment$Readme$object$$Blob(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        text: text == _undefined ? _instance.text : (text as String?),
      ));
}

class _CopyWithStubImpl$Fragment$Readme$object$$Blob<TRes>
    implements CopyWith$Fragment$Readme$object$$Blob<TRes> {
  _CopyWithStubImpl$Fragment$Readme$object$$Blob(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? text,
  }) =>
      _res;
}

class Fragment$ReadmeMDString {
  Fragment$ReadmeMDString({
    this.text,
    required this.$__typename,
  });

  factory Fragment$ReadmeMDString.fromJson(Map<String, dynamic> json) {
    final l$text = json['text'];
    final l$$__typename = json['__typename'];
    return Fragment$ReadmeMDString(
      text: (l$text as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? text;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$text = text;
    _resultData['text'] = l$text;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$text = text;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$text,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ReadmeMDString) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
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

extension UtilityExtension$Fragment$ReadmeMDString on Fragment$ReadmeMDString {
  CopyWith$Fragment$ReadmeMDString<Fragment$ReadmeMDString> get copyWith =>
      CopyWith$Fragment$ReadmeMDString(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$ReadmeMDString<TRes> {
  factory CopyWith$Fragment$ReadmeMDString(
    Fragment$ReadmeMDString instance,
    TRes Function(Fragment$ReadmeMDString) then,
  ) = _CopyWithImpl$Fragment$ReadmeMDString;

  factory CopyWith$Fragment$ReadmeMDString.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ReadmeMDString;

  TRes call({
    String? text,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$ReadmeMDString<TRes>
    implements CopyWith$Fragment$ReadmeMDString<TRes> {
  _CopyWithImpl$Fragment$ReadmeMDString(
    this._instance,
    this._then,
  );

  final Fragment$ReadmeMDString _instance;

  final TRes Function(Fragment$ReadmeMDString) _then;

  static const _undefined = {};

  TRes call({
    Object? text = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ReadmeMDString(
        text: text == _undefined ? _instance.text : (text as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$ReadmeMDString<TRes>
    implements CopyWith$Fragment$ReadmeMDString<TRes> {
  _CopyWithStubImpl$Fragment$ReadmeMDString(this._res);

  TRes _res;

  call({
    String? text,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionReadmeMDString = FragmentDefinitionNode(
  name: NameNode(value: 'ReadmeMDString'),
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
);
const documentNodeFragmentReadmeMDString = DocumentNode(definitions: [
  fragmentDefinitionReadmeMDString,
]);

extension ClientExtension$Fragment$ReadmeMDString on graphql.GraphQLClient {
  void writeFragment$ReadmeMDString({
    required Fragment$ReadmeMDString data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'ReadmeMDString',
            document: documentNodeFragmentReadmeMDString,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$ReadmeMDString? readFragment$ReadmeMDString({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ReadmeMDString',
          document: documentNodeFragmentReadmeMDString,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$ReadmeMDString.fromJson(result);
  }
}

class Variables$Query$getRepositoryReadmeFromID {
  factory Variables$Query$getRepositoryReadmeFromID(
          {required GithubAPIID id}) =>
      Variables$Query$getRepositoryReadmeFromID._({
        r'id': id,
      });

  Variables$Query$getRepositoryReadmeFromID._(this._$data);

  factory Variables$Query$getRepositoryReadmeFromID.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = githubAPIIDFromJson(l$id);
    return Variables$Query$getRepositoryReadmeFromID._(result$data);
  }

  Map<String, dynamic> _$data;

  GithubAPIID get id => (_$data['id'] as GithubAPIID);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = githubAPIIDToJson(l$id);
    return result$data;
  }

  CopyWith$Variables$Query$getRepositoryReadmeFromID<
          Variables$Query$getRepositoryReadmeFromID>
      get copyWith => CopyWith$Variables$Query$getRepositoryReadmeFromID(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRepositoryReadmeFromID) ||
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

abstract class CopyWith$Variables$Query$getRepositoryReadmeFromID<TRes> {
  factory CopyWith$Variables$Query$getRepositoryReadmeFromID(
    Variables$Query$getRepositoryReadmeFromID instance,
    TRes Function(Variables$Query$getRepositoryReadmeFromID) then,
  ) = _CopyWithImpl$Variables$Query$getRepositoryReadmeFromID;

  factory CopyWith$Variables$Query$getRepositoryReadmeFromID.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRepositoryReadmeFromID;

  TRes call({GithubAPIID? id});
}

class _CopyWithImpl$Variables$Query$getRepositoryReadmeFromID<TRes>
    implements CopyWith$Variables$Query$getRepositoryReadmeFromID<TRes> {
  _CopyWithImpl$Variables$Query$getRepositoryReadmeFromID(
    this._instance,
    this._then,
  );

  final Variables$Query$getRepositoryReadmeFromID _instance;

  final TRes Function(Variables$Query$getRepositoryReadmeFromID) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getRepositoryReadmeFromID._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as GithubAPIID),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRepositoryReadmeFromID<TRes>
    implements CopyWith$Variables$Query$getRepositoryReadmeFromID<TRes> {
  _CopyWithStubImpl$Variables$Query$getRepositoryReadmeFromID(this._res);

  TRes _res;

  call({GithubAPIID? id}) => _res;
}

class Query$getRepositoryReadmeFromID {
  Query$getRepositoryReadmeFromID({
    this.node,
    required this.$__typename,
  });

  factory Query$getRepositoryReadmeFromID.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$getRepositoryReadmeFromID(
      node: l$node == null
          ? null
          : Query$getRepositoryReadmeFromID$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getRepositoryReadmeFromID$node? node;

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
    if (!(other is Query$getRepositoryReadmeFromID) ||
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

extension UtilityExtension$Query$getRepositoryReadmeFromID
    on Query$getRepositoryReadmeFromID {
  CopyWith$Query$getRepositoryReadmeFromID<Query$getRepositoryReadmeFromID>
      get copyWith => CopyWith$Query$getRepositoryReadmeFromID(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryReadmeFromID<TRes> {
  factory CopyWith$Query$getRepositoryReadmeFromID(
    Query$getRepositoryReadmeFromID instance,
    TRes Function(Query$getRepositoryReadmeFromID) then,
  ) = _CopyWithImpl$Query$getRepositoryReadmeFromID;

  factory CopyWith$Query$getRepositoryReadmeFromID.stub(TRes res) =
      _CopyWithStubImpl$Query$getRepositoryReadmeFromID;

  TRes call({
    Query$getRepositoryReadmeFromID$node? node,
    String? $__typename,
  });
  CopyWith$Query$getRepositoryReadmeFromID$node<TRes> get node;
}

class _CopyWithImpl$Query$getRepositoryReadmeFromID<TRes>
    implements CopyWith$Query$getRepositoryReadmeFromID<TRes> {
  _CopyWithImpl$Query$getRepositoryReadmeFromID(
    this._instance,
    this._then,
  );

  final Query$getRepositoryReadmeFromID _instance;

  final TRes Function(Query$getRepositoryReadmeFromID) _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRepositoryReadmeFromID(
        node: node == _undefined
            ? _instance.node
            : (node as Query$getRepositoryReadmeFromID$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRepositoryReadmeFromID$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$getRepositoryReadmeFromID$node.stub(_then(_instance))
        : CopyWith$Query$getRepositoryReadmeFromID$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$getRepositoryReadmeFromID<TRes>
    implements CopyWith$Query$getRepositoryReadmeFromID<TRes> {
  _CopyWithStubImpl$Query$getRepositoryReadmeFromID(this._res);

  TRes _res;

  call({
    Query$getRepositoryReadmeFromID$node? node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRepositoryReadmeFromID$node<TRes> get node =>
      CopyWith$Query$getRepositoryReadmeFromID$node.stub(_res);
}

const documentNodeQuerygetRepositoryReadmeFromID = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRepositoryReadmeFromID'),
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
            name: NameNode(value: 'Readme'),
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
  fragmentDefinitionReadme,
  fragmentDefinitionReadmeMDString,
]);
Query$getRepositoryReadmeFromID _parserFn$Query$getRepositoryReadmeFromID(
        Map<String, dynamic> data) =>
    Query$getRepositoryReadmeFromID.fromJson(data);

class Options$Query$getRepositoryReadmeFromID
    extends graphql.QueryOptions<Query$getRepositoryReadmeFromID> {
  Options$Query$getRepositoryReadmeFromID({
    String? operationName,
    required Variables$Query$getRepositoryReadmeFromID variables,
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
          document: documentNodeQuerygetRepositoryReadmeFromID,
          parserFn: _parserFn$Query$getRepositoryReadmeFromID,
        );
}

class WatchOptions$Query$getRepositoryReadmeFromID
    extends graphql.WatchQueryOptions<Query$getRepositoryReadmeFromID> {
  WatchOptions$Query$getRepositoryReadmeFromID({
    String? operationName,
    required Variables$Query$getRepositoryReadmeFromID variables,
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
          document: documentNodeQuerygetRepositoryReadmeFromID,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRepositoryReadmeFromID,
        );
}

class FetchMoreOptions$Query$getRepositoryReadmeFromID
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRepositoryReadmeFromID({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRepositoryReadmeFromID variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRepositoryReadmeFromID,
        );
}

extension ClientExtension$Query$getRepositoryReadmeFromID
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRepositoryReadmeFromID>>
      query$getRepositoryReadmeFromID(
              Options$Query$getRepositoryReadmeFromID options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRepositoryReadmeFromID>
      watchQuery$getRepositoryReadmeFromID(
              WatchOptions$Query$getRepositoryReadmeFromID options) =>
          this.watchQuery(options);
  void writeQuery$getRepositoryReadmeFromID({
    required Query$getRepositoryReadmeFromID data,
    required Variables$Query$getRepositoryReadmeFromID variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetRepositoryReadmeFromID),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRepositoryReadmeFromID? readQuery$getRepositoryReadmeFromID({
    required Variables$Query$getRepositoryReadmeFromID variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetRepositoryReadmeFromID),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getRepositoryReadmeFromID.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getRepositoryReadmeFromID>
    useQuery$getRepositoryReadmeFromID(
            Options$Query$getRepositoryReadmeFromID options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getRepositoryReadmeFromID>
    useWatchQuery$getRepositoryReadmeFromID(
            WatchOptions$Query$getRepositoryReadmeFromID options) =>
        graphql_flutter.useWatchQuery(options);

class Query$getRepositoryReadmeFromID$Widget
    extends graphql_flutter.Query<Query$getRepositoryReadmeFromID> {
  Query$getRepositoryReadmeFromID$Widget({
    widgets.Key? key,
    required Options$Query$getRepositoryReadmeFromID options,
    required graphql_flutter.QueryBuilder<Query$getRepositoryReadmeFromID>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$getRepositoryReadmeFromID$node {
  Query$getRepositoryReadmeFromID$node({required this.$__typename});

  factory Query$getRepositoryReadmeFromID$node.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Repository":
        return Query$getRepositoryReadmeFromID$node$$Repository.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$getRepositoryReadmeFromID$node(
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
    if (!(other is Query$getRepositoryReadmeFromID$node) ||
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

extension UtilityExtension$Query$getRepositoryReadmeFromID$node
    on Query$getRepositoryReadmeFromID$node {
  CopyWith$Query$getRepositoryReadmeFromID$node<
          Query$getRepositoryReadmeFromID$node>
      get copyWith => CopyWith$Query$getRepositoryReadmeFromID$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryReadmeFromID$node<TRes> {
  factory CopyWith$Query$getRepositoryReadmeFromID$node(
    Query$getRepositoryReadmeFromID$node instance,
    TRes Function(Query$getRepositoryReadmeFromID$node) then,
  ) = _CopyWithImpl$Query$getRepositoryReadmeFromID$node;

  factory CopyWith$Query$getRepositoryReadmeFromID$node.stub(TRes res) =
      _CopyWithStubImpl$Query$getRepositoryReadmeFromID$node;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$getRepositoryReadmeFromID$node<TRes>
    implements CopyWith$Query$getRepositoryReadmeFromID$node<TRes> {
  _CopyWithImpl$Query$getRepositoryReadmeFromID$node(
    this._instance,
    this._then,
  );

  final Query$getRepositoryReadmeFromID$node _instance;

  final TRes Function(Query$getRepositoryReadmeFromID$node) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$getRepositoryReadmeFromID$node(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$getRepositoryReadmeFromID$node<TRes>
    implements CopyWith$Query$getRepositoryReadmeFromID$node<TRes> {
  _CopyWithStubImpl$Query$getRepositoryReadmeFromID$node(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$getRepositoryReadmeFromID$node$$Repository
    implements Fragment$Readme, Query$getRepositoryReadmeFromID$node {
  Query$getRepositoryReadmeFromID$node$$Repository({
    required this.$__typename,
    this.object,
  });

  factory Query$getRepositoryReadmeFromID$node$$Repository.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$object = json['object'];
    return Query$getRepositoryReadmeFromID$node$$Repository(
      $__typename: (l$$__typename as String),
      object: l$object == null
          ? null
          : Query$getRepositoryReadmeFromID$node$$Repository$object.fromJson(
              (l$object as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final Query$getRepositoryReadmeFromID$node$$Repository$object? object;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$object = object;
    _resultData['object'] = l$object?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$object = object;
    return Object.hashAll([
      l$$__typename,
      l$object,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRepositoryReadmeFromID$node$$Repository) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$object = object;
    final lOther$object = other.object;
    if (l$object != lOther$object) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getRepositoryReadmeFromID$node$$Repository
    on Query$getRepositoryReadmeFromID$node$$Repository {
  CopyWith$Query$getRepositoryReadmeFromID$node$$Repository<
          Query$getRepositoryReadmeFromID$node$$Repository>
      get copyWith => CopyWith$Query$getRepositoryReadmeFromID$node$$Repository(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryReadmeFromID$node$$Repository<TRes> {
  factory CopyWith$Query$getRepositoryReadmeFromID$node$$Repository(
    Query$getRepositoryReadmeFromID$node$$Repository instance,
    TRes Function(Query$getRepositoryReadmeFromID$node$$Repository) then,
  ) = _CopyWithImpl$Query$getRepositoryReadmeFromID$node$$Repository;

  factory CopyWith$Query$getRepositoryReadmeFromID$node$$Repository.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRepositoryReadmeFromID$node$$Repository;

  TRes call({
    String? $__typename,
    Query$getRepositoryReadmeFromID$node$$Repository$object? object,
  });
  CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object<TRes>
      get object;
}

class _CopyWithImpl$Query$getRepositoryReadmeFromID$node$$Repository<TRes>
    implements CopyWith$Query$getRepositoryReadmeFromID$node$$Repository<TRes> {
  _CopyWithImpl$Query$getRepositoryReadmeFromID$node$$Repository(
    this._instance,
    this._then,
  );

  final Query$getRepositoryReadmeFromID$node$$Repository _instance;

  final TRes Function(Query$getRepositoryReadmeFromID$node$$Repository) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? object = _undefined,
  }) =>
      _then(Query$getRepositoryReadmeFromID$node$$Repository(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        object: object == _undefined
            ? _instance.object
            : (object
                as Query$getRepositoryReadmeFromID$node$$Repository$object?),
      ));
  CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object<TRes>
      get object {
    final local$object = _instance.object;
    return local$object == null
        ? CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object.stub(
            _then(_instance))
        : CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object(
            local$object, (e) => call(object: e));
  }
}

class _CopyWithStubImpl$Query$getRepositoryReadmeFromID$node$$Repository<TRes>
    implements CopyWith$Query$getRepositoryReadmeFromID$node$$Repository<TRes> {
  _CopyWithStubImpl$Query$getRepositoryReadmeFromID$node$$Repository(this._res);

  TRes _res;

  call({
    String? $__typename,
    Query$getRepositoryReadmeFromID$node$$Repository$object? object,
  }) =>
      _res;
  CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object<TRes>
      get object =>
          CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object.stub(
              _res);
}

class Query$getRepositoryReadmeFromID$node$$Repository$object
    implements Fragment$Readme$object {
  Query$getRepositoryReadmeFromID$node$$Repository$object(
      {required this.$__typename});

  factory Query$getRepositoryReadmeFromID$node$$Repository$object.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Blob":
        return Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$getRepositoryReadmeFromID$node$$Repository$object(
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
    if (!(other is Query$getRepositoryReadmeFromID$node$$Repository$object) ||
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

extension UtilityExtension$Query$getRepositoryReadmeFromID$node$$Repository$object
    on Query$getRepositoryReadmeFromID$node$$Repository$object {
  CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object<
          Query$getRepositoryReadmeFromID$node$$Repository$object>
      get copyWith =>
          CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object<
    TRes> {
  factory CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object(
    Query$getRepositoryReadmeFromID$node$$Repository$object instance,
    TRes Function(Query$getRepositoryReadmeFromID$node$$Repository$object) then,
  ) = _CopyWithImpl$Query$getRepositoryReadmeFromID$node$$Repository$object;

  factory CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRepositoryReadmeFromID$node$$Repository$object;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$getRepositoryReadmeFromID$node$$Repository$object<
        TRes>
    implements
        CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object<TRes> {
  _CopyWithImpl$Query$getRepositoryReadmeFromID$node$$Repository$object(
    this._instance,
    this._then,
  );

  final Query$getRepositoryReadmeFromID$node$$Repository$object _instance;

  final TRes Function(Query$getRepositoryReadmeFromID$node$$Repository$object)
      _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$getRepositoryReadmeFromID$node$$Repository$object(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$getRepositoryReadmeFromID$node$$Repository$object<
        TRes>
    implements
        CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object<TRes> {
  _CopyWithStubImpl$Query$getRepositoryReadmeFromID$node$$Repository$object(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob
    implements
        Fragment$Readme$object$$Blob,
        Fragment$ReadmeMDString,
        Query$getRepositoryReadmeFromID$node$$Repository$object {
  Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob({
    required this.$__typename,
    this.text,
  });

  factory Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$text = json['text'];
    return Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob(
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
            is Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob) ||
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

extension UtilityExtension$Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob
    on Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob {
  CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob<
          Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob>
      get copyWith =>
          CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob<
    TRes> {
  factory CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob(
    Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob instance,
    TRes Function(Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob)
        then,
  ) = _CopyWithImpl$Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob;

  factory CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob;

  TRes call({
    String? $__typename,
    String? text,
  });
}

class _CopyWithImpl$Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob<
        TRes>
    implements
        CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob<
            TRes> {
  _CopyWithImpl$Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob(
    this._instance,
    this._then,
  );

  final Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob _instance;

  final TRes Function(
      Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? text = _undefined,
  }) =>
      _then(Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        text: text == _undefined ? _instance.text : (text as String?),
      ));
}

class _CopyWithStubImpl$Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob<
        TRes>
    implements
        CopyWith$Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob<
            TRes> {
  _CopyWithStubImpl$Query$getRepositoryReadmeFromID$node$$Repository$object$$Blob(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? text,
  }) =>
      _res;
}
