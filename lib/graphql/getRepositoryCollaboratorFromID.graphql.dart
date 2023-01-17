import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:repositoryviewer/graphql/type/custom_id.dart';
import 'package:repositoryviewer/graphql/type/custom_url.dart';

class Fragment$Collaborator {
  Fragment$Collaborator({
    this.collaborators,
    required this.$__typename,
  });

  factory Fragment$Collaborator.fromJson(Map<String, dynamic> json) {
    final l$collaborators = json['collaborators'];
    final l$$__typename = json['__typename'];
    return Fragment$Collaborator(
      collaborators: l$collaborators == null
          ? null
          : Fragment$Collaborator$collaborators.fromJson(
              (l$collaborators as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$Collaborator$collaborators? collaborators;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$collaborators = collaborators;
    _resultData['collaborators'] = l$collaborators?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$collaborators = collaborators;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$collaborators,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Collaborator) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$collaborators = collaborators;
    final lOther$collaborators = other.collaborators;
    if (l$collaborators != lOther$collaborators) {
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

extension UtilityExtension$Fragment$Collaborator on Fragment$Collaborator {
  CopyWith$Fragment$Collaborator<Fragment$Collaborator> get copyWith =>
      CopyWith$Fragment$Collaborator(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$Collaborator<TRes> {
  factory CopyWith$Fragment$Collaborator(
    Fragment$Collaborator instance,
    TRes Function(Fragment$Collaborator) then,
  ) = _CopyWithImpl$Fragment$Collaborator;

  factory CopyWith$Fragment$Collaborator.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Collaborator;

  TRes call({
    Fragment$Collaborator$collaborators? collaborators,
    String? $__typename,
  });
  CopyWith$Fragment$Collaborator$collaborators<TRes> get collaborators;
}

class _CopyWithImpl$Fragment$Collaborator<TRes>
    implements CopyWith$Fragment$Collaborator<TRes> {
  _CopyWithImpl$Fragment$Collaborator(
    this._instance,
    this._then,
  );

  final Fragment$Collaborator _instance;

  final TRes Function(Fragment$Collaborator) _then;

  static const _undefined = {};

  TRes call({
    Object? collaborators = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Collaborator(
        collaborators: collaborators == _undefined
            ? _instance.collaborators
            : (collaborators as Fragment$Collaborator$collaborators?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Collaborator$collaborators<TRes> get collaborators {
    final local$collaborators = _instance.collaborators;
    return local$collaborators == null
        ? CopyWith$Fragment$Collaborator$collaborators.stub(_then(_instance))
        : CopyWith$Fragment$Collaborator$collaborators(
            local$collaborators, (e) => call(collaborators: e));
  }
}

class _CopyWithStubImpl$Fragment$Collaborator<TRes>
    implements CopyWith$Fragment$Collaborator<TRes> {
  _CopyWithStubImpl$Fragment$Collaborator(this._res);

  TRes _res;

  call({
    Fragment$Collaborator$collaborators? collaborators,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Collaborator$collaborators<TRes> get collaborators =>
      CopyWith$Fragment$Collaborator$collaborators.stub(_res);
}

const fragmentDefinitionCollaborator = FragmentDefinitionNode(
  name: NameNode(value: 'Collaborator'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Repository'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'collaborators'),
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
);
const documentNodeFragmentCollaborator = DocumentNode(definitions: [
  fragmentDefinitionCollaborator,
]);

extension ClientExtension$Fragment$Collaborator on graphql.GraphQLClient {
  void writeFragment$Collaborator({
    required Fragment$Collaborator data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'Collaborator',
            document: documentNodeFragmentCollaborator,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$Collaborator? readFragment$Collaborator({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'Collaborator',
          document: documentNodeFragmentCollaborator,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$Collaborator.fromJson(result);
  }
}

class Fragment$Collaborator$collaborators {
  Fragment$Collaborator$collaborators({
    this.edges,
    required this.$__typename,
  });

  factory Fragment$Collaborator$collaborators.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Fragment$Collaborator$collaborators(
      edges: (l$edges as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$Collaborator$collaborators$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Collaborator$collaborators$edges?>? edges;

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
    if (!(other is Fragment$Collaborator$collaborators) ||
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

extension UtilityExtension$Fragment$Collaborator$collaborators
    on Fragment$Collaborator$collaborators {
  CopyWith$Fragment$Collaborator$collaborators<
          Fragment$Collaborator$collaborators>
      get copyWith => CopyWith$Fragment$Collaborator$collaborators(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Collaborator$collaborators<TRes> {
  factory CopyWith$Fragment$Collaborator$collaborators(
    Fragment$Collaborator$collaborators instance,
    TRes Function(Fragment$Collaborator$collaborators) then,
  ) = _CopyWithImpl$Fragment$Collaborator$collaborators;

  factory CopyWith$Fragment$Collaborator$collaborators.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Collaborator$collaborators;

  TRes call({
    List<Fragment$Collaborator$collaborators$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Fragment$Collaborator$collaborators$edges?>? Function(
              Iterable<
                  CopyWith$Fragment$Collaborator$collaborators$edges<
                      Fragment$Collaborator$collaborators$edges>?>?)
          _fn);
}

class _CopyWithImpl$Fragment$Collaborator$collaborators<TRes>
    implements CopyWith$Fragment$Collaborator$collaborators<TRes> {
  _CopyWithImpl$Fragment$Collaborator$collaborators(
    this._instance,
    this._then,
  );

  final Fragment$Collaborator$collaborators _instance;

  final TRes Function(Fragment$Collaborator$collaborators) _then;

  static const _undefined = {};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Collaborator$collaborators(
        edges: edges == _undefined
            ? _instance.edges
            : (edges as List<Fragment$Collaborator$collaborators$edges?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes edges(
          Iterable<Fragment$Collaborator$collaborators$edges?>? Function(
                  Iterable<
                      CopyWith$Fragment$Collaborator$collaborators$edges<
                          Fragment$Collaborator$collaborators$edges>?>?)
              _fn) =>
      call(
          edges: _fn(_instance.edges?.map((e) => e == null
              ? null
              : CopyWith$Fragment$Collaborator$collaborators$edges(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Fragment$Collaborator$collaborators<TRes>
    implements CopyWith$Fragment$Collaborator$collaborators<TRes> {
  _CopyWithStubImpl$Fragment$Collaborator$collaborators(this._res);

  TRes _res;

  call({
    List<Fragment$Collaborator$collaborators$edges?>? edges,
    String? $__typename,
  }) =>
      _res;
  edges(_fn) => _res;
}

class Fragment$Collaborator$collaborators$edges {
  Fragment$Collaborator$collaborators$edges({
    required this.node,
    required this.$__typename,
  });

  factory Fragment$Collaborator$collaborators$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Fragment$Collaborator$collaborators$edges(
      node: Fragment$Collaborator$collaborators$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$Collaborator$collaborators$edges$node node;

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
    if (!(other is Fragment$Collaborator$collaborators$edges) ||
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

extension UtilityExtension$Fragment$Collaborator$collaborators$edges
    on Fragment$Collaborator$collaborators$edges {
  CopyWith$Fragment$Collaborator$collaborators$edges<
          Fragment$Collaborator$collaborators$edges>
      get copyWith => CopyWith$Fragment$Collaborator$collaborators$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Collaborator$collaborators$edges<TRes> {
  factory CopyWith$Fragment$Collaborator$collaborators$edges(
    Fragment$Collaborator$collaborators$edges instance,
    TRes Function(Fragment$Collaborator$collaborators$edges) then,
  ) = _CopyWithImpl$Fragment$Collaborator$collaborators$edges;

  factory CopyWith$Fragment$Collaborator$collaborators$edges.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Collaborator$collaborators$edges;

  TRes call({
    Fragment$Collaborator$collaborators$edges$node? node,
    String? $__typename,
  });
  CopyWith$Fragment$Collaborator$collaborators$edges$node<TRes> get node;
}

class _CopyWithImpl$Fragment$Collaborator$collaborators$edges<TRes>
    implements CopyWith$Fragment$Collaborator$collaborators$edges<TRes> {
  _CopyWithImpl$Fragment$Collaborator$collaborators$edges(
    this._instance,
    this._then,
  );

  final Fragment$Collaborator$collaborators$edges _instance;

  final TRes Function(Fragment$Collaborator$collaborators$edges) _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Collaborator$collaborators$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Fragment$Collaborator$collaborators$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Collaborator$collaborators$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Fragment$Collaborator$collaborators$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Fragment$Collaborator$collaborators$edges<TRes>
    implements CopyWith$Fragment$Collaborator$collaborators$edges<TRes> {
  _CopyWithStubImpl$Fragment$Collaborator$collaborators$edges(this._res);

  TRes _res;

  call({
    Fragment$Collaborator$collaborators$edges$node? node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Collaborator$collaborators$edges$node<TRes> get node =>
      CopyWith$Fragment$Collaborator$collaborators$edges$node.stub(_res);
}

class Fragment$Collaborator$collaborators$edges$node {
  Fragment$Collaborator$collaborators$edges$node({
    required this.id,
    required this.avatarUrl,
    required this.url,
    required this.$__typename,
  });

  factory Fragment$Collaborator$collaborators$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$avatarUrl = json['avatarUrl'];
    final l$url = json['url'];
    final l$$__typename = json['__typename'];
    return Fragment$Collaborator$collaborators$edges$node(
      id: githubAPIIDFromJson(l$id),
      avatarUrl: customUriFromJson(l$avatarUrl),
      url: customUriFromJson(l$url),
      $__typename: (l$$__typename as String),
    );
  }

  final GithubAPIID id;

  final CustomURI avatarUrl;

  final CustomURI url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = githubAPIIDToJson(l$id);
    final l$avatarUrl = avatarUrl;
    _resultData['avatarUrl'] = customUriToJson(l$avatarUrl);
    final l$url = url;
    _resultData['url'] = customUriToJson(l$url);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$avatarUrl = avatarUrl;
    final l$url = url;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
    if (!(other is Fragment$Collaborator$collaborators$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Fragment$Collaborator$collaborators$edges$node
    on Fragment$Collaborator$collaborators$edges$node {
  CopyWith$Fragment$Collaborator$collaborators$edges$node<
          Fragment$Collaborator$collaborators$edges$node>
      get copyWith => CopyWith$Fragment$Collaborator$collaborators$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Collaborator$collaborators$edges$node<TRes> {
  factory CopyWith$Fragment$Collaborator$collaborators$edges$node(
    Fragment$Collaborator$collaborators$edges$node instance,
    TRes Function(Fragment$Collaborator$collaborators$edges$node) then,
  ) = _CopyWithImpl$Fragment$Collaborator$collaborators$edges$node;

  factory CopyWith$Fragment$Collaborator$collaborators$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Collaborator$collaborators$edges$node;

  TRes call({
    GithubAPIID? id,
    CustomURI? avatarUrl,
    CustomURI? url,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Collaborator$collaborators$edges$node<TRes>
    implements CopyWith$Fragment$Collaborator$collaborators$edges$node<TRes> {
  _CopyWithImpl$Fragment$Collaborator$collaborators$edges$node(
    this._instance,
    this._then,
  );

  final Fragment$Collaborator$collaborators$edges$node _instance;

  final TRes Function(Fragment$Collaborator$collaborators$edges$node) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? avatarUrl = _undefined,
    Object? url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Collaborator$collaborators$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as GithubAPIID),
        avatarUrl: avatarUrl == _undefined || avatarUrl == null
            ? _instance.avatarUrl
            : (avatarUrl as CustomURI),
        url: url == _undefined || url == null
            ? _instance.url
            : (url as CustomURI),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Collaborator$collaborators$edges$node<TRes>
    implements CopyWith$Fragment$Collaborator$collaborators$edges$node<TRes> {
  _CopyWithStubImpl$Fragment$Collaborator$collaborators$edges$node(this._res);

  TRes _res;

  call({
    GithubAPIID? id,
    CustomURI? avatarUrl,
    CustomURI? url,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRepositoryCollaboratorFromID {
  factory Variables$Query$getRepositoryCollaboratorFromID(
          {required GithubAPIID id}) =>
      Variables$Query$getRepositoryCollaboratorFromID._({
        r'id': id,
      });

  Variables$Query$getRepositoryCollaboratorFromID._(this._$data);

  factory Variables$Query$getRepositoryCollaboratorFromID.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = githubAPIIDFromJson(l$id);
    return Variables$Query$getRepositoryCollaboratorFromID._(result$data);
  }

  Map<String, dynamic> _$data;

  GithubAPIID get id => (_$data['id'] as GithubAPIID);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = githubAPIIDToJson(l$id);
    return result$data;
  }

  CopyWith$Variables$Query$getRepositoryCollaboratorFromID<
          Variables$Query$getRepositoryCollaboratorFromID>
      get copyWith => CopyWith$Variables$Query$getRepositoryCollaboratorFromID(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRepositoryCollaboratorFromID) ||
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

abstract class CopyWith$Variables$Query$getRepositoryCollaboratorFromID<TRes> {
  factory CopyWith$Variables$Query$getRepositoryCollaboratorFromID(
    Variables$Query$getRepositoryCollaboratorFromID instance,
    TRes Function(Variables$Query$getRepositoryCollaboratorFromID) then,
  ) = _CopyWithImpl$Variables$Query$getRepositoryCollaboratorFromID;

  factory CopyWith$Variables$Query$getRepositoryCollaboratorFromID.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$getRepositoryCollaboratorFromID;

  TRes call({GithubAPIID? id});
}

class _CopyWithImpl$Variables$Query$getRepositoryCollaboratorFromID<TRes>
    implements CopyWith$Variables$Query$getRepositoryCollaboratorFromID<TRes> {
  _CopyWithImpl$Variables$Query$getRepositoryCollaboratorFromID(
    this._instance,
    this._then,
  );

  final Variables$Query$getRepositoryCollaboratorFromID _instance;

  final TRes Function(Variables$Query$getRepositoryCollaboratorFromID) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getRepositoryCollaboratorFromID._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as GithubAPIID),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRepositoryCollaboratorFromID<TRes>
    implements CopyWith$Variables$Query$getRepositoryCollaboratorFromID<TRes> {
  _CopyWithStubImpl$Variables$Query$getRepositoryCollaboratorFromID(this._res);

  TRes _res;

  call({GithubAPIID? id}) => _res;
}

class Query$getRepositoryCollaboratorFromID {
  Query$getRepositoryCollaboratorFromID({
    this.node,
    required this.$__typename,
  });

  factory Query$getRepositoryCollaboratorFromID.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$getRepositoryCollaboratorFromID(
      node: l$node == null
          ? null
          : Query$getRepositoryCollaboratorFromID$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getRepositoryCollaboratorFromID$node? node;

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
    if (!(other is Query$getRepositoryCollaboratorFromID) ||
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

extension UtilityExtension$Query$getRepositoryCollaboratorFromID
    on Query$getRepositoryCollaboratorFromID {
  CopyWith$Query$getRepositoryCollaboratorFromID<
          Query$getRepositoryCollaboratorFromID>
      get copyWith => CopyWith$Query$getRepositoryCollaboratorFromID(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryCollaboratorFromID<TRes> {
  factory CopyWith$Query$getRepositoryCollaboratorFromID(
    Query$getRepositoryCollaboratorFromID instance,
    TRes Function(Query$getRepositoryCollaboratorFromID) then,
  ) = _CopyWithImpl$Query$getRepositoryCollaboratorFromID;

  factory CopyWith$Query$getRepositoryCollaboratorFromID.stub(TRes res) =
      _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID;

  TRes call({
    Query$getRepositoryCollaboratorFromID$node? node,
    String? $__typename,
  });
  CopyWith$Query$getRepositoryCollaboratorFromID$node<TRes> get node;
}

class _CopyWithImpl$Query$getRepositoryCollaboratorFromID<TRes>
    implements CopyWith$Query$getRepositoryCollaboratorFromID<TRes> {
  _CopyWithImpl$Query$getRepositoryCollaboratorFromID(
    this._instance,
    this._then,
  );

  final Query$getRepositoryCollaboratorFromID _instance;

  final TRes Function(Query$getRepositoryCollaboratorFromID) _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRepositoryCollaboratorFromID(
        node: node == _undefined
            ? _instance.node
            : (node as Query$getRepositoryCollaboratorFromID$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRepositoryCollaboratorFromID$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$getRepositoryCollaboratorFromID$node.stub(
            _then(_instance))
        : CopyWith$Query$getRepositoryCollaboratorFromID$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID<TRes>
    implements CopyWith$Query$getRepositoryCollaboratorFromID<TRes> {
  _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID(this._res);

  TRes _res;

  call({
    Query$getRepositoryCollaboratorFromID$node? node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRepositoryCollaboratorFromID$node<TRes> get node =>
      CopyWith$Query$getRepositoryCollaboratorFromID$node.stub(_res);
}

const documentNodeQuerygetRepositoryCollaboratorFromID =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRepositoryCollaboratorFromID'),
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
            name: NameNode(value: 'Collaborator'),
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
  fragmentDefinitionCollaborator,
]);
Query$getRepositoryCollaboratorFromID
    _parserFn$Query$getRepositoryCollaboratorFromID(
            Map<String, dynamic> data) =>
        Query$getRepositoryCollaboratorFromID.fromJson(data);

class Options$Query$getRepositoryCollaboratorFromID
    extends graphql.QueryOptions<Query$getRepositoryCollaboratorFromID> {
  Options$Query$getRepositoryCollaboratorFromID({
    String? operationName,
    required Variables$Query$getRepositoryCollaboratorFromID variables,
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
          document: documentNodeQuerygetRepositoryCollaboratorFromID,
          parserFn: _parserFn$Query$getRepositoryCollaboratorFromID,
        );
}

class WatchOptions$Query$getRepositoryCollaboratorFromID
    extends graphql.WatchQueryOptions<Query$getRepositoryCollaboratorFromID> {
  WatchOptions$Query$getRepositoryCollaboratorFromID({
    String? operationName,
    required Variables$Query$getRepositoryCollaboratorFromID variables,
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
          document: documentNodeQuerygetRepositoryCollaboratorFromID,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRepositoryCollaboratorFromID,
        );
}

class FetchMoreOptions$Query$getRepositoryCollaboratorFromID
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRepositoryCollaboratorFromID({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRepositoryCollaboratorFromID variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRepositoryCollaboratorFromID,
        );
}

extension ClientExtension$Query$getRepositoryCollaboratorFromID
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRepositoryCollaboratorFromID>>
      query$getRepositoryCollaboratorFromID(
              Options$Query$getRepositoryCollaboratorFromID options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRepositoryCollaboratorFromID>
      watchQuery$getRepositoryCollaboratorFromID(
              WatchOptions$Query$getRepositoryCollaboratorFromID options) =>
          this.watchQuery(options);
  void writeQuery$getRepositoryCollaboratorFromID({
    required Query$getRepositoryCollaboratorFromID data,
    required Variables$Query$getRepositoryCollaboratorFromID variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetRepositoryCollaboratorFromID),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRepositoryCollaboratorFromID?
      readQuery$getRepositoryCollaboratorFromID({
    required Variables$Query$getRepositoryCollaboratorFromID variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetRepositoryCollaboratorFromID),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getRepositoryCollaboratorFromID.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getRepositoryCollaboratorFromID>
    useQuery$getRepositoryCollaboratorFromID(
            Options$Query$getRepositoryCollaboratorFromID options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getRepositoryCollaboratorFromID>
    useWatchQuery$getRepositoryCollaboratorFromID(
            WatchOptions$Query$getRepositoryCollaboratorFromID options) =>
        graphql_flutter.useWatchQuery(options);

class Query$getRepositoryCollaboratorFromID$Widget
    extends graphql_flutter.Query<Query$getRepositoryCollaboratorFromID> {
  Query$getRepositoryCollaboratorFromID$Widget({
    widgets.Key? key,
    required Options$Query$getRepositoryCollaboratorFromID options,
    required graphql_flutter.QueryBuilder<Query$getRepositoryCollaboratorFromID>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$getRepositoryCollaboratorFromID$node {
  Query$getRepositoryCollaboratorFromID$node({required this.$__typename});

  factory Query$getRepositoryCollaboratorFromID$node.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Repository":
        return Query$getRepositoryCollaboratorFromID$node$$Repository.fromJson(
            json);

      default:
        final l$$__typename = json['__typename'];
        return Query$getRepositoryCollaboratorFromID$node(
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
    if (!(other is Query$getRepositoryCollaboratorFromID$node) ||
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

extension UtilityExtension$Query$getRepositoryCollaboratorFromID$node
    on Query$getRepositoryCollaboratorFromID$node {
  CopyWith$Query$getRepositoryCollaboratorFromID$node<
          Query$getRepositoryCollaboratorFromID$node>
      get copyWith => CopyWith$Query$getRepositoryCollaboratorFromID$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryCollaboratorFromID$node<TRes> {
  factory CopyWith$Query$getRepositoryCollaboratorFromID$node(
    Query$getRepositoryCollaboratorFromID$node instance,
    TRes Function(Query$getRepositoryCollaboratorFromID$node) then,
  ) = _CopyWithImpl$Query$getRepositoryCollaboratorFromID$node;

  factory CopyWith$Query$getRepositoryCollaboratorFromID$node.stub(TRes res) =
      _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID$node;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$getRepositoryCollaboratorFromID$node<TRes>
    implements CopyWith$Query$getRepositoryCollaboratorFromID$node<TRes> {
  _CopyWithImpl$Query$getRepositoryCollaboratorFromID$node(
    this._instance,
    this._then,
  );

  final Query$getRepositoryCollaboratorFromID$node _instance;

  final TRes Function(Query$getRepositoryCollaboratorFromID$node) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$getRepositoryCollaboratorFromID$node(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID$node<TRes>
    implements CopyWith$Query$getRepositoryCollaboratorFromID$node<TRes> {
  _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID$node(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$getRepositoryCollaboratorFromID$node$$Repository
    implements
        Fragment$Collaborator,
        Query$getRepositoryCollaboratorFromID$node {
  Query$getRepositoryCollaboratorFromID$node$$Repository({
    required this.$__typename,
    this.collaborators,
  });

  factory Query$getRepositoryCollaboratorFromID$node$$Repository.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$collaborators = json['collaborators'];
    return Query$getRepositoryCollaboratorFromID$node$$Repository(
      $__typename: (l$$__typename as String),
      collaborators: l$collaborators == null
          ? null
          : Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators
              .fromJson((l$collaborators as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators?
      collaborators;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$collaborators = collaborators;
    _resultData['collaborators'] = l$collaborators?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$collaborators = collaborators;
    return Object.hashAll([
      l$$__typename,
      l$collaborators,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRepositoryCollaboratorFromID$node$$Repository) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$collaborators = collaborators;
    final lOther$collaborators = other.collaborators;
    if (l$collaborators != lOther$collaborators) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getRepositoryCollaboratorFromID$node$$Repository
    on Query$getRepositoryCollaboratorFromID$node$$Repository {
  CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository<
          Query$getRepositoryCollaboratorFromID$node$$Repository>
      get copyWith =>
          CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository<
    TRes> {
  factory CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository(
    Query$getRepositoryCollaboratorFromID$node$$Repository instance,
    TRes Function(Query$getRepositoryCollaboratorFromID$node$$Repository) then,
  ) = _CopyWithImpl$Query$getRepositoryCollaboratorFromID$node$$Repository;

  factory CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID$node$$Repository;

  TRes call({
    String? $__typename,
    Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators?
        collaborators,
  });
  CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators<
      TRes> get collaborators;
}

class _CopyWithImpl$Query$getRepositoryCollaboratorFromID$node$$Repository<TRes>
    implements
        CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository<TRes> {
  _CopyWithImpl$Query$getRepositoryCollaboratorFromID$node$$Repository(
    this._instance,
    this._then,
  );

  final Query$getRepositoryCollaboratorFromID$node$$Repository _instance;

  final TRes Function(Query$getRepositoryCollaboratorFromID$node$$Repository)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? collaborators = _undefined,
  }) =>
      _then(Query$getRepositoryCollaboratorFromID$node$$Repository(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        collaborators: collaborators == _undefined
            ? _instance.collaborators
            : (collaborators
                as Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators?),
      ));
  CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators<
      TRes> get collaborators {
    final local$collaborators = _instance.collaborators;
    return local$collaborators == null
        ? CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators
            .stub(_then(_instance))
        : CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators(
            local$collaborators, (e) => call(collaborators: e));
  }
}

class _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID$node$$Repository<
        TRes>
    implements
        CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository<TRes> {
  _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID$node$$Repository(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators?
        collaborators,
  }) =>
      _res;
  CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators<
          TRes>
      get collaborators =>
          CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators
              .stub(_res);
}

class Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators
    implements Fragment$Collaborator$collaborators {
  Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators({
    this.edges,
    required this.$__typename,
  });

  factory Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators(
      edges: (l$edges as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<
          Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges?>?
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
    if (!(other
            is Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators) ||
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

extension UtilityExtension$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators
    on Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators {
  CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators<
          Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators>
      get copyWith =>
          CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators<
    TRes> {
  factory CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators(
    Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators
        instance,
    TRes Function(
            Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators)
        then,
  ) = _CopyWithImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators;

  factory CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators;

  TRes call({
    List<Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges?>?
        edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges?>? Function(
              Iterable<
                  CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges<
                      Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges>?>?)
          _fn);
}

class _CopyWithImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators<
        TRes>
    implements
        CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators<
            TRes> {
  _CopyWithImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators(
    this._instance,
    this._then,
  );

  final Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators
      _instance;

  final TRes Function(
          Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators)
      _then;

  static const _undefined = {};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators(
        edges: edges == _undefined
            ? _instance.edges
            : (edges as List<
                Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes edges(
          Iterable<Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges?>? Function(
                  Iterable<
                      CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges<
                          Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges>?>?)
              _fn) =>
      call(
          edges: _fn(_instance.edges?.map((e) => e == null
              ? null
              : CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators<
        TRes>
    implements
        CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators<
            TRes> {
  _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators(
      this._res);

  TRes _res;

  call({
    List<Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges?>?
        edges,
    String? $__typename,
  }) =>
      _res;
  edges(_fn) => _res;
}

class Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges
    implements Fragment$Collaborator$collaborators$edges {
  Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges({
    required this.node,
    required this.$__typename,
  });

  factory Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges(
      node:
          Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node
              .fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node
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
            is Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges) ||
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

extension UtilityExtension$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges
    on Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges {
  CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges<
          Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges>
      get copyWith =>
          CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges<
    TRes> {
  factory CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges(
    Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges
        instance,
    TRes Function(
            Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges)
        then,
  ) = _CopyWithImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges;

  factory CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges;

  TRes call({
    Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node?
        node,
    String? $__typename,
  });
  CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node<
      TRes> get node;
}

class _CopyWithImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges<
        TRes>
    implements
        CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges<
            TRes> {
  _CopyWithImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges(
    this._instance,
    this._then,
  );

  final Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges
      _instance;

  final TRes Function(
          Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges)
      _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node
                as Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node<
      TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges<
        TRes>
    implements
        CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges<
            TRes> {
  _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges(
      this._res);

  TRes _res;

  call({
    Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node?
        node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node<
          TRes>
      get node =>
          CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node
              .stub(_res);
}

class Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node
    implements Fragment$Collaborator$collaborators$edges$node {
  Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node({
    required this.id,
    required this.avatarUrl,
    required this.url,
    required this.$__typename,
  });

  factory Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$avatarUrl = json['avatarUrl'];
    final l$url = json['url'];
    final l$$__typename = json['__typename'];
    return Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node(
      id: githubAPIIDFromJson(l$id),
      avatarUrl: customUriFromJson(l$avatarUrl),
      url: customUriFromJson(l$url),
      $__typename: (l$$__typename as String),
    );
  }

  final GithubAPIID id;

  final CustomURI avatarUrl;

  final CustomURI url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = githubAPIIDToJson(l$id);
    final l$avatarUrl = avatarUrl;
    _resultData['avatarUrl'] = customUriToJson(l$avatarUrl);
    final l$url = url;
    _resultData['url'] = customUriToJson(l$url);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$avatarUrl = avatarUrl;
    final l$url = url;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node
    on Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node {
  CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node<
          Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node>
      get copyWith =>
          CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node<
    TRes> {
  factory CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node(
    Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node
        instance,
    TRes Function(
            Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node)
        then,
  ) = _CopyWithImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node;

  factory CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node;

  TRes call({
    GithubAPIID? id,
    CustomURI? avatarUrl,
    CustomURI? url,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node<
        TRes>
    implements
        CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node<
            TRes> {
  _CopyWithImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node(
    this._instance,
    this._then,
  );

  final Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node
      _instance;

  final TRes Function(
          Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? avatarUrl = _undefined,
    Object? url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as GithubAPIID),
        avatarUrl: avatarUrl == _undefined || avatarUrl == null
            ? _instance.avatarUrl
            : (avatarUrl as CustomURI),
        url: url == _undefined || url == null
            ? _instance.url
            : (url as CustomURI),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node<
        TRes>
    implements
        CopyWith$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node<
            TRes> {
  _CopyWithStubImpl$Query$getRepositoryCollaboratorFromID$node$$Repository$collaborators$edges$node(
      this._res);

  TRes _res;

  call({
    GithubAPIID? id,
    CustomURI? avatarUrl,
    CustomURI? url,
    String? $__typename,
  }) =>
      _res;
}
