import 'package:flutter/material.dart';
import 'package:raundtable/components/custom_rounded_btn.dart';
import 'package:raundtable/components/custom_rounded_card.dart';
import 'package:raundtable/components/forms/index.dart';
import 'package:raundtable/shared/models/table/rt_table.dart';
import 'package:raundtable/shared/services/shared_pref_service.dart';

import 'sent_invite_table_view.dart';

class InviteSentView extends StatefulWidget {
  const InviteSentView({Key? key}) : super(key: key);

  @override
  State<InviteSentView> createState() => _InviteSentViewState();
}

class _InviteSentViewState extends State<InviteSentView> {
  final SharedPreferencesService sharedPref = SharedPreferencesService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<RtTable?>(
            future: sharedPref.getCachedTableCreate(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final table = snapshot.data;

                if (table == null) {
                  return const Center(
                    child: Text('failed to load Table'),
                  );
                }

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset('assets/images/invite_people.png'),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Table Number',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: table.number
                            .split('')
                            .map(
                              (e) => Expanded(
                                child: CustomFormField(
                                  readOnly: true,
                                  context: context,
                                  formName: 'tabNum_$e',
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Invitation Sent to:',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: CustomRoundedCard(
                          height: 800,
                          bgColor: Theme.of(context).scaffoldBackgroundColor,
                          child: SentInvitesTable(people: table.members),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomRoundedButton(
                                text: 'Send More',
                                isOutlined: true,
                                onTap: () {
                                  // TODO add logic
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomRoundedButton(
                                text: 'My Dashboard',
                                onTap: () {
                                  // todo go to dashboard
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }

              // loading
              else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
