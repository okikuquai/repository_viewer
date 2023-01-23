import 'github_node_id_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'git_repository_contributor.g.dart';

@JsonSerializable()
class GitRepositoryContributor {

  @JsonKey(name: 'node_id', fromJson: githubNodeIdFromJson, toJson: githubNodeIdToJson)
  GithubNodeId nodeId;
  @JsonKey(name: 'avatar_url')
  Uri avatarUri;

  GitRepositoryContributor({required this.avatarUri, required this.nodeId});

  factory GitRepositoryContributor.fromJson(Map<String, dynamic> json) => _$GitRepositoryContributorFromJson(json);

  Map<String, dynamic> toJson() => _$GitRepositoryContributorToJson(this);
}