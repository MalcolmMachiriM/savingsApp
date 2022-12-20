import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:raundtable/components/custom_checkbox_tile.dart';
import 'package:raundtable/components/custom_rounded_btn.dart';
import 'package:raundtable/components/forms/index.dart';
import 'package:raundtable/constants/color_constants.dart';
import 'package:raundtable/shared/models/table/rt_table_member.dart';
import 'package:raundtable/shared/services/firestore_table_service.dart';
import 'package:raundtable/shared/services/shared_pref_service.dart';

class PersonAdd {
  final String fullname;

  /// email | mobile
  final String contact;

  PersonAdd({
    required this.fullname,
    required this.contact,
  });
}

class InvitePeopleView extends StatefulWidget {
  const InvitePeopleView({
    Key? key,
    required this.onNextCallback,
    required this.onCancelCallback,
  }) : super(key: key);

  final Function onNextCallback;
  final Function onCancelCallback;

  @override
  State<InvitePeopleView> createState() => _InvitePeopleViewState();
}

class _InvitePeopleViewState extends State<InvitePeopleView> {
  final SharedPreferencesService sharedPref = SharedPreferencesService();
  late FirestoreTableService firestoreTableService;

  final formKey = GlobalKey<FormBuilderState>();

  bool skipToInviteLater = false;

  bool setFromContacts = false;

  List<PersonAdd> addedPeopleFromContacts = [];

  List<PersonAdd> addedPeopleInternal = [];

  List<Contact> phoneBook = [];

  void _initFirestore() async {
    final user = await sharedPref.getCurrentUser();

    setState(() {
      firestoreTableService = FirestoreTableService(uid: user!.uid!);
    });
  }

  Future checkPermissions() async {
    if (await Permission.contacts.isGranted) {
      var c = await ContactsService.getContacts();

      setState(() {
        phoneBook = c;
      });
    } else {
      var res = await Permission.contacts.request();

      if (res.isGranted) {
        var c = await ContactsService.getContacts();

        setState(() {
          phoneBook = c;
        });
      }
    }
  }

  void addToPeopleFromContacts(var c) {
    final List<PersonAdd> currentList = addedPeopleFromContacts;

    c is Contact
        ? currentList.add(PersonAdd(
            fullname: c.displayName!,
            contact: c.phones!.first.value!,
          ))
        : currentList.add(c);

    final List<PersonAdd> updated = List.from(currentList);

    setState(() {
      addedPeopleFromContacts = updated.toSet().toList();
    });
  }

  void removeFromPeopleFromContacts(PersonAdd c) {
    final List<PersonAdd> currentList = addedPeopleFromContacts;

    currentList.remove(c);

    final List<PersonAdd> updated = List.from(currentList);

    setState(() {
      addedPeopleFromContacts = updated;
    });
  }

  void addToPeopleInternal(PersonAdd pa) {
    final List<PersonAdd> currentList = addedPeopleInternal;

    currentList.add(pa);

    final List<PersonAdd> updated = List.from(currentList);

    setState(() {
      addedPeopleInternal = updated.toSet().toList();
    });
  }

  void removeFromPeopleInternal(PersonAdd c) {
    final List<PersonAdd> currentList = addedPeopleInternal;

    currentList.remove(c);

    final List<PersonAdd> updated = List.from(currentList);

    setState(() {
      addedPeopleInternal = updated;
    });
  }

  List<Contact> getSuggestions(String query) {
    List<Contact> matches = [];

    matches.addAll(phoneBook);

    phoneBook.retainWhere((s) => s.displayName == null
        ? false
        : s.displayName!.toLowerCase().contains(query.toLowerCase()));

    return matches;
  }

  @override
  void initState() {
    super.initState();
    _initFirestore();
    checkPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: FormBuilder(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Get names from my contacts',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      FlutterSwitch(
                        value: setFromContacts,
                        width: 60,
                        toggleColor: mainAppColor,
                        inactiveColor: fieldFillColor,
                        activeColor: mainAppColor,
                        activeToggleColor: fieldFillColor,
                        onToggle: (val) {
                          if (val) {
                            checkPermissions();
                          }

                          setState(() {
                            setFromContacts = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                setFromContacts
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                        child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            autofocus: true,
                            style: fieldTextStyle(context),
                            decoration: CustomInputDecoration(
                              radius: borderRadius,
                              fillColor: mainWhiteColor,
                              textStyle: fieldTextStyle(context)!,
                              hintText: 'search',
                              prefixIcon:
                                  const Icon(Icons.search, color: mainAppColor),
                            ),
                          ),
                          suggestionsCallback: (pattern) async {
                            return getSuggestions(pattern);
                          },
                          loadingBuilder: (context) {
                            return FutureBuilder(
                              future: checkPermissions(),
                              builder: (_, snap) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              },
                            );
                          },
                          itemBuilder: (context, Contact suggestion) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        suggestion.displayName ?? 'Contact',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        suggestion.phones!.isEmpty
                                            ? 'n/a'
                                            : suggestion.phones!.first.value!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2
                                            ?.copyWith(
                                              color: Colors.grey,
                                            ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  CustomRoundedButton(
                                    text: 'Add',
                                    isOutlined: true,
                                    widthRatio: 0.23,
                                    height: 20,
                                    onTap: () {
                                      addToPeopleFromContacts(suggestion);
                                    },
                                  ),
                                ],
                              ),
                            );

                            // ListTile(
                            //   leading: const Icon(Icons.person),
                            //   title: Text(suggestion.displayName!),
                            //   subtitle: Text(suggestion.phones!.first.value!),
                            // );
                          },
                          onSuggestionSelected: (Contact suggestion) {
                            addToPeopleFromContacts(suggestion);
                          },
                        ),
                      )
                    : const SizedBox.shrink(),
                addedPeopleFromContacts.isNotEmpty
                    ? SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var c = addedPeopleFromContacts[index];

                                return Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          c.fullname,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          c.contact,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              ?.copyWith(
                                                color: Colors.grey,
                                              ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    CustomRoundedButton(
                                      text: 'Remove',
                                      widthRatio: 0.23,
                                      height: 20,
                                      onTap: () {
                                        removeFromPeopleFromContacts(c);
                                      },
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (ctx, x) =>
                                  const SizedBox(height: 0.1),
                              itemCount: addedPeopleFromContacts.length,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Not in your contacts? ',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Add here',
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: mainAppColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: CustomFormField(
                        context: context,
                        formName: 'fullname',
                        labelText: 'Full Name',
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: CustomFormField(
                        context: context,
                        formName: 'phone_number',
                        labelText: 'Phone number',
                        unfocus: true,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomRoundedButton(
                          text: '✔',
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();

                              final _data = formKey.currentState!.value;

                              final PersonAdd pa = PersonAdd(
                                fullname: _data['fullname'],
                                contact: _data['phone_number'],
                              );

                              // add to list
                              addToPeopleInternal(pa);
                            }
                          }),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    formKey.currentState?.reset();
                  },
                  child: Row(
                    children: [
                      const Spacer(),
                      const Icon(
                        Icons.person_add_alt,
                        color: mainAppColor,
                        size: 20,
                      ),
                      const SizedBox(width: 7),
                      Text(
                        'Add more',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(color: mainAppColor),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                addedPeopleInternal.isNotEmpty
                    ? SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var c = addedPeopleInternal[index];

                                return Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          c.fullname,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          c.contact,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              ?.copyWith(
                                                color: Colors.grey,
                                              ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    CustomRoundedButton(
                                      text: 'Remove',
                                      widthRatio: 0.23,
                                      isOutlined: true,
                                      height: 15,
                                      onTap: () {
                                        removeFromPeopleInternal(c);
                                      },
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (ctx, x) => const Divider(),
                              itemCount: addedPeopleInternal.length,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 20),
                CustomCheckBoxTile(
                  onChanged: (value) {
                    setState(() {
                      skipToInviteLater = value ?? false;
                    });
                  },
                  text: 'Skip to invite later',
                  activeColor: mainAppColor,
                  value: skipToInviteLater,
                  checkColor: mainWhiteColor,
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: CustomRoundedButton(
                        text: 'Cancel',
                        isOutlined: true,
                        onTap: () {
                          widget.onCancelCallback();
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomRoundedButton(
                        text: 'Next',
                        onTap: skipToInviteLater
                            ? () {
                                // proceed
                                widget.onNextCallback();
                              }
                            : () async {
                                // check if all contacts are set
                                final _allContacts = addedPeopleFromContacts +
                                    addedPeopleInternal;

                                if (_allContacts.isNotEmpty) {
                                  // TODO: send invite to contacts

                                  final _table =
                                      await sharedPref.getCachedTableCreate();

                                  if (_table == null) {
                                    return;
                                  }

                                  final _tableCopy = _table.copyWith(
                                      members: _allContacts
                                          .map(
                                            (e) => RtTableMember(
                                              memberID: e.contact,
                                              name: e.fullname,
                                              // TODO: depends on send invite response
                                              inviteSent: false,
                                            ),
                                          )
                                          .toList());

                                  await sharedPref
                                      .cacheCurrentCreatedTable(_tableCopy);

                                  // add to firebase

                                  await firestoreTableService
                                      .addTable(_tableCopy);

                                  widget.onNextCallback();
                                }
                              },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
