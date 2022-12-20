import 'package:flutter/material.dart';
import 'package:raundtable/constants/color_constants.dart';
import 'package:raundtable/shared/models/table/rt_table_member.dart';

class SentInvitesTable extends StatelessWidget {
  const SentInvitesTable({Key? key, this.people = const []}) : super(key: key);

  final List<RtTableMember> people;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        final e = people[index];

        return ListTile(
          title: Text(e.name,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontSize: 16)),
          subtitle: Text(e.memberID),
          trailing: e.inviteSent
              ? const Icon(Icons.task_alt, color: mainAppColor)
              : const Icon(Icons.circle_outlined, color: appGreyColor),
        );
      },
      separatorBuilder: (_, x) => const Divider(),
      itemCount: people.length,
    );
  }
}
