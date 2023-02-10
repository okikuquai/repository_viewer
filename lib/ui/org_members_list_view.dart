import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repositoryviewer/ui/user_info_view.dart';

import '../graphql/get_members_from_organization.graphql.dart';
import 'module/loading_animation.dart';

class OrgMemberListView extends HookConsumerWidget {
  const OrgMemberListView({Key? key, required this.orgName}) : super(key: key);
  final String orgName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryResult = useQuery$getMembersFromOrganization(
      Options$Query$getMembersFromOrganization(
          variables: Variables$Query$getMembersFromOrganization(
              orgName: orgName, first: 100)),
    );

    //ロード完了していない場合
    if (qryResult.result.isLoading) {
      return const LoadingAnimation();
    }
    //例外スローした場合
    else if (qryResult.result.hasException) {
      return Text(qryResult.result.exception.toString());
    }

    final members = qryResult
            .result.parsedData?.organization?.membersWithRole.edges
            ?.whereNotNull()
            .toList() ??
        [];

    return Scaffold(
        appBar: AppBar(
          title: Text('$orgName Members'),
        ),
        body: ListView.builder(
            itemCount: members.length,
            itemBuilder: (context, index) {
              final member = members[index].node;
              if (member == null) return Container();
              return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UserInfoView(userId: member.id),
                        ),
                      ),
                  child: MemberCardView(
                      name: member.name ?? '',
                      bio: member.bio ?? '',
                      login: member.login,
                      avatarUri: member.avatarUrl));
            }));
  }
}

class MemberCardView extends StatelessWidget {
  const MemberCardView(
      {super.key,
      required this.name,
      required this.bio,
      required this.login,
      required this.avatarUri});

  final String name;
  final String bio;
  final String login;
  final Uri avatarUri;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          AvatarIcon(
            avatarUri: avatarUri,
          ),
          Expanded(
              child: MemberDescriptionView(
            name: name,
            bio: bio,
            login: login,
          )),
        ],
      ),
    );
  }
}

class AvatarIcon extends StatelessWidget {
  const AvatarIcon({super.key, required this.avatarUri});

  final Uri avatarUri;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      width: 80.0,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill, image: NetworkImage(avatarUri.toString()))),
      ),
    );
  }
}

class MemberDescriptionView extends StatelessWidget {
  const MemberDescriptionView(
      {super.key, required this.name, required this.bio, required this.login});

  final String name;
  final String bio;
  final String login;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: textTheme.titleLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            login,
            style: textTheme.labelLarge?.apply(color: Colors.black45),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10.0),
          Text(
            bio,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
