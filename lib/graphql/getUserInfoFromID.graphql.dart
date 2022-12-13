import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$UserInfo {
  Fragment$UserInfo({
    required this.id,
    required this.login,
    this.name,
    required this.url,
    required this.avatarUrl,
    required this.isViewer,
    required this.starredRepositories,
    required this.$__typename,
  });

  factory Fragment$UserInfo.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$login = json['login'];
    final l$name = json['name'];
    final l$url = json['url'];
    final l$avatarUrl = json['avatarUrl'];
    final l$isViewer = json['isViewer'];
    final l$starredRepositories = json['starredRepositories'];
    final l$$__typename = json['__typename'];
    return Fragment$UserInfo(
      id: (l$id as String),
      login: (l$login as String),
      name: (l$name as String?),
      url: (l$url as String),
      avatarUrl: (l$avatarUrl as String),
      isViewer: (l$isViewer as bool),
      starredRepositories: Fragment$UserInfo$starredRepositories.fromJson(
          (l$starredRepositories as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String login;

  final String? name;

  final String url;

  final String avatarUrl;

  final bool isViewer;

  final Fragment$UserInfo$starredRepositories starredRepositories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$login = login;
    _resultData['login'] = l$login;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$url = url;
    _resultData['url'] = l$url;
    final l$avatarUrl = avatarUrl;
    _resultData['avatarUrl'] = l$avatarUrl;
    final l$isViewer = isViewer;
    _resultData['isViewer'] = l$isViewer;
    final l$starredRepositories = starredRepositories;
    _resultData['starredRepositories'] = l$starredRepositories.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$login = login;
    final l$name = name;
    final l$url = url;
    final l$avatarUrl = avatarUrl;
    final l$isViewer = isViewer;
    final l$starredRepositories = starredRepositories;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$login,
      l$name,
      l$url,
      l$avatarUrl,
      l$isViewer,
      l$starredRepositories,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$UserInfo) || runtimeType != other.runtimeType) {
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
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    final l$avatarUrl = avatarUrl;
    final lOther$avatarUrl = other.avatarUrl;
    if (l$avatarUrl != lOther$avatarUrl) {
      return false;
    }
    final l$isViewer = isViewer;
    final lOther$isViewer = other.isViewer;
    if (l$isViewer != lOther$isViewer) {
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

extension UtilityExtension$Fragment$UserInfo on Fragment$UserInfo {
  CopyWith$Fragment$UserInfo<Fragment$UserInfo> get copyWith =>
      CopyWith$Fragment$UserInfo(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$UserInfo<TRes> {
  factory CopyWith$Fragment$UserInfo(
    Fragment$UserInfo instance,
    TRes Function(Fragment$UserInfo) then,
  ) = _CopyWithImpl$Fragment$UserInfo;

  factory CopyWith$Fragment$UserInfo.stub(TRes res) =
      _CopyWithStubImpl$Fragment$UserInfo;

  TRes call({
    String? id,
    String? login,
    String? name,
    String? url,
    String? avatarUrl,
    bool? isViewer,
    Fragment$UserInfo$starredRepositories? starredRepositories,
    String? $__typename,
  });
  CopyWith$Fragment$UserInfo$starredRepositories<TRes> get starredRepositories;
}

class _CopyWithImpl$Fragment$UserInfo<TRes>
    implements CopyWith$Fragment$UserInfo<TRes> {
  _CopyWithImpl$Fragment$UserInfo(
    this._instance,
    this._then,
  );

  final Fragment$UserInfo _instance;

  final TRes Function(Fragment$UserInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? login = _undefined,
    Object? name = _undefined,
    Object? url = _undefined,
    Object? avatarUrl = _undefined,
    Object? isViewer = _undefined,
    Object? starredRepositories = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$UserInfo(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        login: login == _undefined || login == null
            ? _instance.login
            : (login as String),
        name: name == _undefined ? _instance.name : (name as String?),
        url: url == _undefined || url == null ? _instance.url : (url as String),
        avatarUrl: avatarUrl == _undefined || avatarUrl == null
            ? _instance.avatarUrl
            : (avatarUrl as String),
        isViewer: isViewer == _undefined || isViewer == null
            ? _instance.isViewer
            : (isViewer as bool),
        starredRepositories: starredRepositories == _undefined ||
                starredRepositories == null
            ? _instance.starredRepositories
            : (starredRepositories as Fragment$UserInfo$starredRepositories),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$UserInfo$starredRepositories<TRes> get starredRepositories {
    final local$starredRepositories = _instance.starredRepositories;
    return CopyWith$Fragment$UserInfo$starredRepositories(
        local$starredRepositories, (e) => call(starredRepositories: e));
  }
}

class _CopyWithStubImpl$Fragment$UserInfo<TRes>
    implements CopyWith$Fragment$UserInfo<TRes> {
  _CopyWithStubImpl$Fragment$UserInfo(this._res);

  TRes _res;

  call({
    String? id,
    String? login,
    String? name,
    String? url,
    String? avatarUrl,
    bool? isViewer,
    Fragment$UserInfo$starredRepositories? starredRepositories,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$UserInfo$starredRepositories<TRes>
      get starredRepositories =>
          CopyWith$Fragment$UserInfo$starredRepositories.stub(_res);
}

const fragmentDefinitionUserInfo = FragmentDefinitionNode(
  name: NameNode(value: 'UserInfo'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'User'),
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
      name: NameNode(value: 'url'),
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
      name: NameNode(value: 'isViewer'),
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
);
const documentNodeFragmentUserInfo = DocumentNode(definitions: [
  fragmentDefinitionUserInfo,
]);

extension ClientExtension$Fragment$UserInfo on graphql.GraphQLClient {
  void writeFragment$UserInfo({
    required Fragment$UserInfo data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'UserInfo',
            document: documentNodeFragmentUserInfo,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$UserInfo? readFragment$UserInfo({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'UserInfo',
          document: documentNodeFragmentUserInfo,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$UserInfo.fromJson(result);
  }
}

class Fragment$UserInfo$starredRepositories {
  Fragment$UserInfo$starredRepositories({
    this.edges,
    required this.$__typename,
  });

  factory Fragment$UserInfo$starredRepositories.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Fragment$UserInfo$starredRepositories(
      edges: (l$edges as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$UserInfo$starredRepositories$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$UserInfo$starredRepositories$edges?>? edges;

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
    if (!(other is Fragment$UserInfo$starredRepositories) ||
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

extension UtilityExtension$Fragment$UserInfo$starredRepositories
    on Fragment$UserInfo$starredRepositories {
  CopyWith$Fragment$UserInfo$starredRepositories<
          Fragment$UserInfo$starredRepositories>
      get copyWith => CopyWith$Fragment$UserInfo$starredRepositories(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$UserInfo$starredRepositories<TRes> {
  factory CopyWith$Fragment$UserInfo$starredRepositories(
    Fragment$UserInfo$starredRepositories instance,
    TRes Function(Fragment$UserInfo$starredRepositories) then,
  ) = _CopyWithImpl$Fragment$UserInfo$starredRepositories;

  factory CopyWith$Fragment$UserInfo$starredRepositories.stub(TRes res) =
      _CopyWithStubImpl$Fragment$UserInfo$starredRepositories;

  TRes call({
    List<Fragment$UserInfo$starredRepositories$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Fragment$UserInfo$starredRepositories$edges?>? Function(
              Iterable<
                  CopyWith$Fragment$UserInfo$starredRepositories$edges<
                      Fragment$UserInfo$starredRepositories$edges>?>?)
          _fn);
}

class _CopyWithImpl$Fragment$UserInfo$starredRepositories<TRes>
    implements CopyWith$Fragment$UserInfo$starredRepositories<TRes> {
  _CopyWithImpl$Fragment$UserInfo$starredRepositories(
    this._instance,
    this._then,
  );

  final Fragment$UserInfo$starredRepositories _instance;

  final TRes Function(Fragment$UserInfo$starredRepositories) _then;

  static const _undefined = {};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$UserInfo$starredRepositories(
        edges: edges == _undefined
            ? _instance.edges
            : (edges as List<Fragment$UserInfo$starredRepositories$edges?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes edges(
          Iterable<Fragment$UserInfo$starredRepositories$edges?>? Function(
                  Iterable<
                      CopyWith$Fragment$UserInfo$starredRepositories$edges<
                          Fragment$UserInfo$starredRepositories$edges>?>?)
              _fn) =>
      call(
          edges: _fn(_instance.edges?.map((e) => e == null
              ? null
              : CopyWith$Fragment$UserInfo$starredRepositories$edges(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Fragment$UserInfo$starredRepositories<TRes>
    implements CopyWith$Fragment$UserInfo$starredRepositories<TRes> {
  _CopyWithStubImpl$Fragment$UserInfo$starredRepositories(this._res);

  TRes _res;

  call({
    List<Fragment$UserInfo$starredRepositories$edges?>? edges,
    String? $__typename,
  }) =>
      _res;
  edges(_fn) => _res;
}

class Fragment$UserInfo$starredRepositories$edges {
  Fragment$UserInfo$starredRepositories$edges({
    required this.node,
    required this.$__typename,
  });

  factory Fragment$UserInfo$starredRepositories$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Fragment$UserInfo$starredRepositories$edges(
      node: Fragment$UserInfo$starredRepositories$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$UserInfo$starredRepositories$edges$node node;

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
    if (!(other is Fragment$UserInfo$starredRepositories$edges) ||
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

extension UtilityExtension$Fragment$UserInfo$starredRepositories$edges
    on Fragment$UserInfo$starredRepositories$edges {
  CopyWith$Fragment$UserInfo$starredRepositories$edges<
          Fragment$UserInfo$starredRepositories$edges>
      get copyWith => CopyWith$Fragment$UserInfo$starredRepositories$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$UserInfo$starredRepositories$edges<TRes> {
  factory CopyWith$Fragment$UserInfo$starredRepositories$edges(
    Fragment$UserInfo$starredRepositories$edges instance,
    TRes Function(Fragment$UserInfo$starredRepositories$edges) then,
  ) = _CopyWithImpl$Fragment$UserInfo$starredRepositories$edges;

  factory CopyWith$Fragment$UserInfo$starredRepositories$edges.stub(TRes res) =
      _CopyWithStubImpl$Fragment$UserInfo$starredRepositories$edges;

  TRes call({
    Fragment$UserInfo$starredRepositories$edges$node? node,
    String? $__typename,
  });
  CopyWith$Fragment$UserInfo$starredRepositories$edges$node<TRes> get node;
}

class _CopyWithImpl$Fragment$UserInfo$starredRepositories$edges<TRes>
    implements CopyWith$Fragment$UserInfo$starredRepositories$edges<TRes> {
  _CopyWithImpl$Fragment$UserInfo$starredRepositories$edges(
    this._instance,
    this._then,
  );

  final Fragment$UserInfo$starredRepositories$edges _instance;

  final TRes Function(Fragment$UserInfo$starredRepositories$edges) _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$UserInfo$starredRepositories$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Fragment$UserInfo$starredRepositories$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$UserInfo$starredRepositories$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Fragment$UserInfo$starredRepositories$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Fragment$UserInfo$starredRepositories$edges<TRes>
    implements CopyWith$Fragment$UserInfo$starredRepositories$edges<TRes> {
  _CopyWithStubImpl$Fragment$UserInfo$starredRepositories$edges(this._res);

  TRes _res;

  call({
    Fragment$UserInfo$starredRepositories$edges$node? node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$UserInfo$starredRepositories$edges$node<TRes> get node =>
      CopyWith$Fragment$UserInfo$starredRepositories$edges$node.stub(_res);
}

class Fragment$UserInfo$starredRepositories$edges$node {
  Fragment$UserInfo$starredRepositories$edges$node({
    required this.id,
    required this.$__typename,
  });

  factory Fragment$UserInfo$starredRepositories$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Fragment$UserInfo$starredRepositories$edges$node(
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
    if (!(other is Fragment$UserInfo$starredRepositories$edges$node) ||
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

extension UtilityExtension$Fragment$UserInfo$starredRepositories$edges$node
    on Fragment$UserInfo$starredRepositories$edges$node {
  CopyWith$Fragment$UserInfo$starredRepositories$edges$node<
          Fragment$UserInfo$starredRepositories$edges$node>
      get copyWith => CopyWith$Fragment$UserInfo$starredRepositories$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$UserInfo$starredRepositories$edges$node<TRes> {
  factory CopyWith$Fragment$UserInfo$starredRepositories$edges$node(
    Fragment$UserInfo$starredRepositories$edges$node instance,
    TRes Function(Fragment$UserInfo$starredRepositories$edges$node) then,
  ) = _CopyWithImpl$Fragment$UserInfo$starredRepositories$edges$node;

  factory CopyWith$Fragment$UserInfo$starredRepositories$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$UserInfo$starredRepositories$edges$node;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$UserInfo$starredRepositories$edges$node<TRes>
    implements CopyWith$Fragment$UserInfo$starredRepositories$edges$node<TRes> {
  _CopyWithImpl$Fragment$UserInfo$starredRepositories$edges$node(
    this._instance,
    this._then,
  );

  final Fragment$UserInfo$starredRepositories$edges$node _instance;

  final TRes Function(Fragment$UserInfo$starredRepositories$edges$node) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$UserInfo$starredRepositories$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$UserInfo$starredRepositories$edges$node<TRes>
    implements CopyWith$Fragment$UserInfo$starredRepositories$edges$node<TRes> {
  _CopyWithStubImpl$Fragment$UserInfo$starredRepositories$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getUserInfoFromID {
  factory Variables$Query$getUserInfoFromID({required String id}) =>
      Variables$Query$getUserInfoFromID._({
        r'id': id,
      });

  Variables$Query$getUserInfoFromID._(this._$data);

  factory Variables$Query$getUserInfoFromID.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$getUserInfoFromID._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getUserInfoFromID<Variables$Query$getUserInfoFromID>
      get copyWith => CopyWith$Variables$Query$getUserInfoFromID(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getUserInfoFromID) ||
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

abstract class CopyWith$Variables$Query$getUserInfoFromID<TRes> {
  factory CopyWith$Variables$Query$getUserInfoFromID(
    Variables$Query$getUserInfoFromID instance,
    TRes Function(Variables$Query$getUserInfoFromID) then,
  ) = _CopyWithImpl$Variables$Query$getUserInfoFromID;

  factory CopyWith$Variables$Query$getUserInfoFromID.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getUserInfoFromID;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$getUserInfoFromID<TRes>
    implements CopyWith$Variables$Query$getUserInfoFromID<TRes> {
  _CopyWithImpl$Variables$Query$getUserInfoFromID(
    this._instance,
    this._then,
  );

  final Variables$Query$getUserInfoFromID _instance;

  final TRes Function(Variables$Query$getUserInfoFromID) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getUserInfoFromID._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$getUserInfoFromID<TRes>
    implements CopyWith$Variables$Query$getUserInfoFromID<TRes> {
  _CopyWithStubImpl$Variables$Query$getUserInfoFromID(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$getUserInfoFromID {
  Query$getUserInfoFromID({
    this.node,
    required this.$__typename,
  });

  factory Query$getUserInfoFromID.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$getUserInfoFromID(
      node: l$node == null
          ? null
          : Query$getUserInfoFromID$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getUserInfoFromID$node? node;

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
    if (!(other is Query$getUserInfoFromID) ||
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

extension UtilityExtension$Query$getUserInfoFromID on Query$getUserInfoFromID {
  CopyWith$Query$getUserInfoFromID<Query$getUserInfoFromID> get copyWith =>
      CopyWith$Query$getUserInfoFromID(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getUserInfoFromID<TRes> {
  factory CopyWith$Query$getUserInfoFromID(
    Query$getUserInfoFromID instance,
    TRes Function(Query$getUserInfoFromID) then,
  ) = _CopyWithImpl$Query$getUserInfoFromID;

  factory CopyWith$Query$getUserInfoFromID.stub(TRes res) =
      _CopyWithStubImpl$Query$getUserInfoFromID;

  TRes call({
    Query$getUserInfoFromID$node? node,
    String? $__typename,
  });
  CopyWith$Query$getUserInfoFromID$node<TRes> get node;
}

class _CopyWithImpl$Query$getUserInfoFromID<TRes>
    implements CopyWith$Query$getUserInfoFromID<TRes> {
  _CopyWithImpl$Query$getUserInfoFromID(
    this._instance,
    this._then,
  );

  final Query$getUserInfoFromID _instance;

  final TRes Function(Query$getUserInfoFromID) _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getUserInfoFromID(
        node: node == _undefined
            ? _instance.node
            : (node as Query$getUserInfoFromID$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getUserInfoFromID$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$getUserInfoFromID$node.stub(_then(_instance))
        : CopyWith$Query$getUserInfoFromID$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$getUserInfoFromID<TRes>
    implements CopyWith$Query$getUserInfoFromID<TRes> {
  _CopyWithStubImpl$Query$getUserInfoFromID(this._res);

  TRes _res;

  call({
    Query$getUserInfoFromID$node? node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getUserInfoFromID$node<TRes> get node =>
      CopyWith$Query$getUserInfoFromID$node.stub(_res);
}

const documentNodeQuerygetUserInfoFromID = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getUserInfoFromID'),
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
            name: NameNode(value: 'UserInfo'),
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
  fragmentDefinitionUserInfo,
]);
Query$getUserInfoFromID _parserFn$Query$getUserInfoFromID(
        Map<String, dynamic> data) =>
    Query$getUserInfoFromID.fromJson(data);

class Options$Query$getUserInfoFromID
    extends graphql.QueryOptions<Query$getUserInfoFromID> {
  Options$Query$getUserInfoFromID({
    String? operationName,
    required Variables$Query$getUserInfoFromID variables,
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
          document: documentNodeQuerygetUserInfoFromID,
          parserFn: _parserFn$Query$getUserInfoFromID,
        );
}

class WatchOptions$Query$getUserInfoFromID
    extends graphql.WatchQueryOptions<Query$getUserInfoFromID> {
  WatchOptions$Query$getUserInfoFromID({
    String? operationName,
    required Variables$Query$getUserInfoFromID variables,
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
          document: documentNodeQuerygetUserInfoFromID,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getUserInfoFromID,
        );
}

class FetchMoreOptions$Query$getUserInfoFromID
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getUserInfoFromID({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getUserInfoFromID variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetUserInfoFromID,
        );
}

extension ClientExtension$Query$getUserInfoFromID on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getUserInfoFromID>> query$getUserInfoFromID(
          Options$Query$getUserInfoFromID options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getUserInfoFromID> watchQuery$getUserInfoFromID(
          WatchOptions$Query$getUserInfoFromID options) =>
      this.watchQuery(options);
  void writeQuery$getUserInfoFromID({
    required Query$getUserInfoFromID data,
    required Variables$Query$getUserInfoFromID variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetUserInfoFromID),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getUserInfoFromID? readQuery$getUserInfoFromID({
    required Variables$Query$getUserInfoFromID variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetUserInfoFromID),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getUserInfoFromID.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getUserInfoFromID>
    useQuery$getUserInfoFromID(Options$Query$getUserInfoFromID options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getUserInfoFromID>
    useWatchQuery$getUserInfoFromID(
            WatchOptions$Query$getUserInfoFromID options) =>
        graphql_flutter.useWatchQuery(options);

class Query$getUserInfoFromID$Widget
    extends graphql_flutter.Query<Query$getUserInfoFromID> {
  Query$getUserInfoFromID$Widget({
    widgets.Key? key,
    required Options$Query$getUserInfoFromID options,
    required graphql_flutter.QueryBuilder<Query$getUserInfoFromID> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$getUserInfoFromID$node {
  Query$getUserInfoFromID$node({required this.$__typename});

  factory Query$getUserInfoFromID$node.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "User":
        return Query$getUserInfoFromID$node$$User.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$getUserInfoFromID$node(
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
    if (!(other is Query$getUserInfoFromID$node) ||
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

extension UtilityExtension$Query$getUserInfoFromID$node
    on Query$getUserInfoFromID$node {
  CopyWith$Query$getUserInfoFromID$node<Query$getUserInfoFromID$node>
      get copyWith => CopyWith$Query$getUserInfoFromID$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getUserInfoFromID$node<TRes> {
  factory CopyWith$Query$getUserInfoFromID$node(
    Query$getUserInfoFromID$node instance,
    TRes Function(Query$getUserInfoFromID$node) then,
  ) = _CopyWithImpl$Query$getUserInfoFromID$node;

  factory CopyWith$Query$getUserInfoFromID$node.stub(TRes res) =
      _CopyWithStubImpl$Query$getUserInfoFromID$node;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$getUserInfoFromID$node<TRes>
    implements CopyWith$Query$getUserInfoFromID$node<TRes> {
  _CopyWithImpl$Query$getUserInfoFromID$node(
    this._instance,
    this._then,
  );

  final Query$getUserInfoFromID$node _instance;

  final TRes Function(Query$getUserInfoFromID$node) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$getUserInfoFromID$node(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$getUserInfoFromID$node<TRes>
    implements CopyWith$Query$getUserInfoFromID$node<TRes> {
  _CopyWithStubImpl$Query$getUserInfoFromID$node(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$getUserInfoFromID$node$$User
    implements Fragment$UserInfo, Query$getUserInfoFromID$node {
  Query$getUserInfoFromID$node$$User({
    required this.$__typename,
    required this.id,
    required this.login,
    this.name,
    required this.url,
    required this.avatarUrl,
    required this.isViewer,
    required this.starredRepositories,
  });

  factory Query$getUserInfoFromID$node$$User.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$login = json['login'];
    final l$name = json['name'];
    final l$url = json['url'];
    final l$avatarUrl = json['avatarUrl'];
    final l$isViewer = json['isViewer'];
    final l$starredRepositories = json['starredRepositories'];
    return Query$getUserInfoFromID$node$$User(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      login: (l$login as String),
      name: (l$name as String?),
      url: (l$url as String),
      avatarUrl: (l$avatarUrl as String),
      isViewer: (l$isViewer as bool),
      starredRepositories:
          Query$getUserInfoFromID$node$$User$starredRepositories.fromJson(
              (l$starredRepositories as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final String login;

  final String? name;

  final String url;

  final String avatarUrl;

  final bool isViewer;

  final Query$getUserInfoFromID$node$$User$starredRepositories
      starredRepositories;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$login = login;
    _resultData['login'] = l$login;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$url = url;
    _resultData['url'] = l$url;
    final l$avatarUrl = avatarUrl;
    _resultData['avatarUrl'] = l$avatarUrl;
    final l$isViewer = isViewer;
    _resultData['isViewer'] = l$isViewer;
    final l$starredRepositories = starredRepositories;
    _resultData['starredRepositories'] = l$starredRepositories.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$login = login;
    final l$name = name;
    final l$url = url;
    final l$avatarUrl = avatarUrl;
    final l$isViewer = isViewer;
    final l$starredRepositories = starredRepositories;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$login,
      l$name,
      l$url,
      l$avatarUrl,
      l$isViewer,
      l$starredRepositories,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getUserInfoFromID$node$$User) ||
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
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    final l$avatarUrl = avatarUrl;
    final lOther$avatarUrl = other.avatarUrl;
    if (l$avatarUrl != lOther$avatarUrl) {
      return false;
    }
    final l$isViewer = isViewer;
    final lOther$isViewer = other.isViewer;
    if (l$isViewer != lOther$isViewer) {
      return false;
    }
    final l$starredRepositories = starredRepositories;
    final lOther$starredRepositories = other.starredRepositories;
    if (l$starredRepositories != lOther$starredRepositories) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getUserInfoFromID$node$$User
    on Query$getUserInfoFromID$node$$User {
  CopyWith$Query$getUserInfoFromID$node$$User<
          Query$getUserInfoFromID$node$$User>
      get copyWith => CopyWith$Query$getUserInfoFromID$node$$User(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getUserInfoFromID$node$$User<TRes> {
  factory CopyWith$Query$getUserInfoFromID$node$$User(
    Query$getUserInfoFromID$node$$User instance,
    TRes Function(Query$getUserInfoFromID$node$$User) then,
  ) = _CopyWithImpl$Query$getUserInfoFromID$node$$User;

  factory CopyWith$Query$getUserInfoFromID$node$$User.stub(TRes res) =
      _CopyWithStubImpl$Query$getUserInfoFromID$node$$User;

  TRes call({
    String? $__typename,
    String? id,
    String? login,
    String? name,
    String? url,
    String? avatarUrl,
    bool? isViewer,
    Query$getUserInfoFromID$node$$User$starredRepositories? starredRepositories,
  });
  CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories<TRes>
      get starredRepositories;
}

class _CopyWithImpl$Query$getUserInfoFromID$node$$User<TRes>
    implements CopyWith$Query$getUserInfoFromID$node$$User<TRes> {
  _CopyWithImpl$Query$getUserInfoFromID$node$$User(
    this._instance,
    this._then,
  );

  final Query$getUserInfoFromID$node$$User _instance;

  final TRes Function(Query$getUserInfoFromID$node$$User) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? login = _undefined,
    Object? name = _undefined,
    Object? url = _undefined,
    Object? avatarUrl = _undefined,
    Object? isViewer = _undefined,
    Object? starredRepositories = _undefined,
  }) =>
      _then(Query$getUserInfoFromID$node$$User(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        login: login == _undefined || login == null
            ? _instance.login
            : (login as String),
        name: name == _undefined ? _instance.name : (name as String?),
        url: url == _undefined || url == null ? _instance.url : (url as String),
        avatarUrl: avatarUrl == _undefined || avatarUrl == null
            ? _instance.avatarUrl
            : (avatarUrl as String),
        isViewer: isViewer == _undefined || isViewer == null
            ? _instance.isViewer
            : (isViewer as bool),
        starredRepositories:
            starredRepositories == _undefined || starredRepositories == null
                ? _instance.starredRepositories
                : (starredRepositories
                    as Query$getUserInfoFromID$node$$User$starredRepositories),
      ));
  CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories<TRes>
      get starredRepositories {
    final local$starredRepositories = _instance.starredRepositories;
    return CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories(
        local$starredRepositories, (e) => call(starredRepositories: e));
  }
}

class _CopyWithStubImpl$Query$getUserInfoFromID$node$$User<TRes>
    implements CopyWith$Query$getUserInfoFromID$node$$User<TRes> {
  _CopyWithStubImpl$Query$getUserInfoFromID$node$$User(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    String? login,
    String? name,
    String? url,
    String? avatarUrl,
    bool? isViewer,
    Query$getUserInfoFromID$node$$User$starredRepositories? starredRepositories,
  }) =>
      _res;
  CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories<TRes>
      get starredRepositories =>
          CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories.stub(
              _res);
}

class Query$getUserInfoFromID$node$$User$starredRepositories
    implements Fragment$UserInfo$starredRepositories {
  Query$getUserInfoFromID$node$$User$starredRepositories({
    this.edges,
    required this.$__typename,
  });

  factory Query$getUserInfoFromID$node$$User$starredRepositories.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$getUserInfoFromID$node$$User$starredRepositories(
      edges: (l$edges as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$getUserInfoFromID$node$$User$starredRepositories$edges
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$getUserInfoFromID$node$$User$starredRepositories$edges?>?
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
    if (!(other is Query$getUserInfoFromID$node$$User$starredRepositories) ||
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

extension UtilityExtension$Query$getUserInfoFromID$node$$User$starredRepositories
    on Query$getUserInfoFromID$node$$User$starredRepositories {
  CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories<
          Query$getUserInfoFromID$node$$User$starredRepositories>
      get copyWith =>
          CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories<
    TRes> {
  factory CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories(
    Query$getUserInfoFromID$node$$User$starredRepositories instance,
    TRes Function(Query$getUserInfoFromID$node$$User$starredRepositories) then,
  ) = _CopyWithImpl$Query$getUserInfoFromID$node$$User$starredRepositories;

  factory CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getUserInfoFromID$node$$User$starredRepositories;

  TRes call({
    List<Query$getUserInfoFromID$node$$User$starredRepositories$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$getUserInfoFromID$node$$User$starredRepositories$edges?>? Function(
              Iterable<
                  CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges<
                      Query$getUserInfoFromID$node$$User$starredRepositories$edges>?>?)
          _fn);
}

class _CopyWithImpl$Query$getUserInfoFromID$node$$User$starredRepositories<TRes>
    implements
        CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories<TRes> {
  _CopyWithImpl$Query$getUserInfoFromID$node$$User$starredRepositories(
    this._instance,
    this._then,
  );

  final Query$getUserInfoFromID$node$$User$starredRepositories _instance;

  final TRes Function(Query$getUserInfoFromID$node$$User$starredRepositories)
      _then;

  static const _undefined = {};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getUserInfoFromID$node$$User$starredRepositories(
        edges: edges == _undefined
            ? _instance.edges
            : (edges as List<
                Query$getUserInfoFromID$node$$User$starredRepositories$edges?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes edges(
          Iterable<Query$getUserInfoFromID$node$$User$starredRepositories$edges?>? Function(
                  Iterable<
                      CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges<
                          Query$getUserInfoFromID$node$$User$starredRepositories$edges>?>?)
              _fn) =>
      call(
          edges: _fn(_instance.edges?.map((e) => e == null
              ? null
              : CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$getUserInfoFromID$node$$User$starredRepositories<
        TRes>
    implements
        CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories<TRes> {
  _CopyWithStubImpl$Query$getUserInfoFromID$node$$User$starredRepositories(
      this._res);

  TRes _res;

  call({
    List<Query$getUserInfoFromID$node$$User$starredRepositories$edges?>? edges,
    String? $__typename,
  }) =>
      _res;
  edges(_fn) => _res;
}

class Query$getUserInfoFromID$node$$User$starredRepositories$edges
    implements Fragment$UserInfo$starredRepositories$edges {
  Query$getUserInfoFromID$node$$User$starredRepositories$edges({
    required this.node,
    required this.$__typename,
  });

  factory Query$getUserInfoFromID$node$$User$starredRepositories$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$getUserInfoFromID$node$$User$starredRepositories$edges(
      node: Query$getUserInfoFromID$node$$User$starredRepositories$edges$node
          .fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getUserInfoFromID$node$$User$starredRepositories$edges$node node;

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
            is Query$getUserInfoFromID$node$$User$starredRepositories$edges) ||
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

extension UtilityExtension$Query$getUserInfoFromID$node$$User$starredRepositories$edges
    on Query$getUserInfoFromID$node$$User$starredRepositories$edges {
  CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges<
          Query$getUserInfoFromID$node$$User$starredRepositories$edges>
      get copyWith =>
          CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges<
    TRes> {
  factory CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges(
    Query$getUserInfoFromID$node$$User$starredRepositories$edges instance,
    TRes Function(Query$getUserInfoFromID$node$$User$starredRepositories$edges)
        then,
  ) = _CopyWithImpl$Query$getUserInfoFromID$node$$User$starredRepositories$edges;

  factory CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getUserInfoFromID$node$$User$starredRepositories$edges;

  TRes call({
    Query$getUserInfoFromID$node$$User$starredRepositories$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node<
      TRes> get node;
}

class _CopyWithImpl$Query$getUserInfoFromID$node$$User$starredRepositories$edges<
        TRes>
    implements
        CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges<
            TRes> {
  _CopyWithImpl$Query$getUserInfoFromID$node$$User$starredRepositories$edges(
    this._instance,
    this._then,
  );

  final Query$getUserInfoFromID$node$$User$starredRepositories$edges _instance;

  final TRes Function(
      Query$getUserInfoFromID$node$$User$starredRepositories$edges) _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getUserInfoFromID$node$$User$starredRepositories$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node
                as Query$getUserInfoFromID$node$$User$starredRepositories$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node<
      TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$getUserInfoFromID$node$$User$starredRepositories$edges<
        TRes>
    implements
        CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges<
            TRes> {
  _CopyWithStubImpl$Query$getUserInfoFromID$node$$User$starredRepositories$edges(
      this._res);

  TRes _res;

  call({
    Query$getUserInfoFromID$node$$User$starredRepositories$edges$node? node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node<
          TRes>
      get node =>
          CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node
              .stub(_res);
}

class Query$getUserInfoFromID$node$$User$starredRepositories$edges$node
    implements Fragment$UserInfo$starredRepositories$edges$node {
  Query$getUserInfoFromID$node$$User$starredRepositories$edges$node({
    required this.id,
    required this.$__typename,
  });

  factory Query$getUserInfoFromID$node$$User$starredRepositories$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getUserInfoFromID$node$$User$starredRepositories$edges$node(
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
            is Query$getUserInfoFromID$node$$User$starredRepositories$edges$node) ||
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

extension UtilityExtension$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node
    on Query$getUserInfoFromID$node$$User$starredRepositories$edges$node {
  CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node<
          Query$getUserInfoFromID$node$$User$starredRepositories$edges$node>
      get copyWith =>
          CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node<
    TRes> {
  factory CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node(
    Query$getUserInfoFromID$node$$User$starredRepositories$edges$node instance,
    TRes Function(
            Query$getUserInfoFromID$node$$User$starredRepositories$edges$node)
        then,
  ) = _CopyWithImpl$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node;

  factory CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node<
        TRes>
    implements
        CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node<
            TRes> {
  _CopyWithImpl$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node(
    this._instance,
    this._then,
  );

  final Query$getUserInfoFromID$node$$User$starredRepositories$edges$node
      _instance;

  final TRes Function(
      Query$getUserInfoFromID$node$$User$starredRepositories$edges$node) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getUserInfoFromID$node$$User$starredRepositories$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node<
        TRes>
    implements
        CopyWith$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node<
            TRes> {
  _CopyWithStubImpl$Query$getUserInfoFromID$node$$User$starredRepositories$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}
