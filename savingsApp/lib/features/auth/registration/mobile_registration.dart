import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:raundtable/components/forms/index.dart';
import 'package:raundtable/components/forms/password_formfield.dart';
import 'package:raundtable/constants/color_constants.dart';
import 'package:raundtable/constants/routing_constants.dart';
import 'package:raundtable/shared/models/custom_exception.dart';
import 'package:raundtable/shared/models/registration/rt_user.dart';

import '../../../components/forms/raund_textfield.dart';
import '../../../shared/libs/firebase_auth_service.dart';
import '../../../shared/services/firestore_user_service.dart';

class MobileRegistration extends StatefulWidget {
  const MobileRegistration({Key? key}) : super(key: key);

  @override
  State<MobileRegistration> createState() => _MobileRegistrationState();
}

class _MobileRegistrationState extends State<MobileRegistration> {
  final _formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final mobile = TextEditingController();
  final dob = TextEditingController();
  final income = TextEditingController();
  final password = TextEditingController();
  final secondName = TextEditingController();

  final required = RequiredValidator(errorText: 'Field Required');
  final emailVal = EmailValidator(errorText: 'Not an email');

  bool checkValue = false;
  bool hasSecondName = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (2 * kToolbarHeight);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        backgroundColor: mainAppColor,
        title: const Text('Registration'),
        centerTitle: true,
      ),
      body: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                RaundTextField(
                    context: context,
                    labelText: 'First Name',
                    keyboard: TextInputType.name,
                    controller: firstName,
                    validator: required),
                Visibility(
                  visible: !hasSecondName,
                  child: RaundTextField(
                      context: context,
                      labelText: 'Second Name',
                      keyboard: TextInputType.name,
                      controller: secondName,
                      validator: required),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: hasSecondName,
                          onChanged: (value) {
                            setState(() {
                              secondName.text = '';
                              hasSecondName = !hasSecondName;
                            });
                          }),
                      const VerticalDivider(color: Colors.transparent),
                      const Text(
                        'Do not have second name',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                RaundTextField(
                    context: context,
                    labelText: 'Last Name',
                    keyboard: TextInputType.name,
                    controller: lastName,
                    validator: required),
                CustomDateField(
                  context: context,
                  formName: 'Datefield',
                  title: 'Date of Birth',
                  hintText: ' mm/dd/yyyy',
                  controller: dob,
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
                RaundTextField(
                    context: context,
                    labelText: 'Phone Number',
                    keyboard: TextInputType.phone,
                    controller: mobile,
                    validator: required),
                RaundTextField(
                    context: context,
                    labelText: 'Address',
                    keyboard: TextInputType.streetAddress,
                    controller: address,
                    validator: required),
                RaundTextField(
                    context: context,
                    labelText: 'Email Address',
                    keyboard: TextInputType.emailAddress,
                    controller: email,
                    validator: emailVal),
                RaundTextField(
                    context: context,
                    icon: const Text(
                      'AUD ',
                    ),
                    labelText: 'Monthly Income',
                    keyboard:
                        const TextInputType.numberWithOptions(decimal: true),
                    controller: income,
                    validator: required),
                // RaundTextField(
                //     context: context,
                //     labelText: 'Password',
                //     keyboard: TextInputType.text,
                //     controller: password,
                //     validator: required),
                PasswordField(controller: password),

                // const Pass(),
                // InkWell(
                //   onTap: () => setState(() => checkValue = !checkValue),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Checkbox(
                //         value: checkValue,
                //         activeColor: mainAppColor,
                //         onChanged: (value) {
                //           setState(() {
                //             checkValue = !checkValue;
                //           });
                //         },
                //       ),
                //       RaundTextField(
                //           context: context,
                //           labelText: 'Last Name',
                //           keyboard: TextInputType.name,
                //           controller: lastName,
                //           validator: required),
                //       DateField(
                //           dateController: dob,
                //           onSaved: (value) {
                //             value = dob.text;
                //           },
                //           labelText: 'Date of Birth'),
                //       RaundTextField(
                //           context: context,
                //           labelText: 'Phone Number',
                //           keyboard: TextInputType.phone,
                //           controller: mobile,
                //           validator: required),
                //       RaundTextField(
                //           context: context,
                //           labelText: 'Address',
                //           keyboard: TextInputType.streetAddress,
                //           controller: address,
                //           validator: required),
                //       RaundTextField(
                //           context: context,
                //           labelText: 'Email Address',
                //           keyboard: TextInputType.emailAddress,
                //           controller: email,
                //           validator: emailVal),
                //       RaundTextField(
                //           context: context,
                //           labelText: 'Monthly Income',
                //           keyboard: const TextInputType.numberWithOptions(
                //               decimal: true),
                //           controller: income,
                //           validator: required),
                //       RaundTextField(
                //           context: context,
                //           labelText: 'Password',
                //           keyboard: TextInputType.text,
                //           controller: password,
                //           validator: required),
                //       InkWell(
                //         onTap: () => setState(() => checkValue = !checkValue),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             Checkbox(
                //               value: checkValue,
                //               activeColor: mainAppColor,
                //               onChanged: (value) {
                //                 setState(() {
                //                   checkValue = !checkValue;
                //                 });
                //               },
                //             ),
                //             SizedBox(
                //               width: 2 / 3 * MediaQuery.of(context).size.width,
                //               child: Text(
                //                 "By Creating an acoount you agree to RaundTable's Terms & Conditions and Privacy Policy ",
                //                 overflow: TextOverflow.ellipsis,
                //                 maxLines: 4,
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .subtitle1!
                //                     .copyWith(color: Colors.grey),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                InkWell(
                  onTap: () => setState(() => checkValue = !checkValue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: checkValue,
                        activeColor: mainAppColor,
                        onChanged: (value) {
                          setState(() {
                            checkValue = !checkValue;
                          });
                        },
                      ),
                      SizedBox(
                        width: 2 / 3 * MediaQuery.of(context).size.width,
                        child: Text(
                          "By creating an account you agree to RaundTable's Terms & Conditions and Privacy Policy ",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, onPrimary: mainAppColor),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      const VerticalDivider(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: mainAppColor,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (checkValue == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing'),
                                ),
                              );

                              final user = await FirebaseAuthService()
                                  .registerNewUser(email.text, password.text);

                              // log(user.toString());

                              if (user is CustomException) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text(user.message ?? 'Failed to login'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }

                              //
                              else {
                                final rtUser = RtUser(
                                  firstName: firstName.text,
                                  lastName: lastName.text,
                                  email: email.text,
                                  phoneNumber: mobile.text,
                                  address: address.text,
                                  monthlyIncome: double.parse(income.text),
                                  dob: DateTime.now(),
                                  uid: user.uid,
                                );

                                await FirestoreUserService(uid: user.uid)
                                    .addRtUser(rtUser)
                                    .then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Success'),
                                    ),
                                  );
                                }).then((value) => Navigator.of(context)
                                        .pushReplacementNamed(
                                            RoutingConstants.login));
                              }
                            }

                            //
                            else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Agree to terms and conditions'),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text('Register'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        const Divider(
                          color: Colors.transparent,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(RoutingConstants.login);
                          },
                          child: const Text(
                            'Sign In here',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: mainAppColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  submit() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Processing'),
        ),
      );
      await FirebaseAuthService()
          .registerNewUser(email.text, password.text)
          .then((user) async {
        final uid = user.uid;
        final rtUser = RtUser(
            firstName: firstName.text,
            lastName: lastName.text,
            email: email.text,
            // TODO: Format phone number in international format but with no + e.g
            // if Zim, format to 263770123456 instead of 0770123456 || +263770123456
            phoneNumber: mobile.text,
            address: address.text,
            monthlyIncome: double.parse(income.text),
            dob: DateTime.parse(dob.text),
            uid: uid);
        await FirestoreUserService(uid: rtUser.phoneNumber).addRtUser(rtUser);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Success')),
        );
      });
    }
  }
}
