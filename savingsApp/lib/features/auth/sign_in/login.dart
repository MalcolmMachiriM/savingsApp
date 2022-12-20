import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:raundtable/components/app_logo.dart';
import 'package:raundtable/components/forms/password_formfield.dart';
import 'package:raundtable/constants/color_constants.dart';
import 'package:raundtable/constants/routing_constants.dart';

import '../../../components/forms/phone_field.dart';
import 'views/verify_phone_number.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  get prefixIcon => null;
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 45.0, left: 10, right: 10),
              child: Center(
                child: SizedBox(
                  child: Column(
                    children: [
                      const AppLogo(),
                      const Divider(
                        color: Colors.transparent,
                      ),
                      const Divider(
                        color: Colors.transparent,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            const Divider(
                              color: Colors.transparent,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Sign In',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const Divider(
                                  color: Colors.transparent,
                                ),
                                // const Text(
                                //   'Phone Number',
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.w400,
                                //       fontSize: 15,
                                //       color: mainAppColor),
                                // ),
                                const Divider(color: Colors.transparent),
                                CustomPhoneNumberInput(
                                  onChanged: (phone) {},
                                  textFieldController: phoneController,
                                ),
                                const Divider(
                                  color: Colors.transparent,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Divider(
                                        color: Colors.transparent,
                                      ),
                                      const PasswordField(),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 5.0),
                                        alignment: const Alignment(1.0, 0.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                RoutingConstants
                                                    .forgotPassword);
                                          },
                                          child: const Text('Forgot Password?',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: mainAppColor,
                                              )),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 30.0),
                                        child: Container(
                                          height: 50,
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: mainAppColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: MaterialButton(
                                            onPressed: () async {
                                              log('logging in..');
                                              log(phoneController.text
                                                  .replaceAll('+', '')
                                                  .trim());
                                              // final rtUserProfile =
                                              //     await FirestoreUserService(
                                              //             uid: '263778060126')
                                              //         .getRtUserByMobileFuture(
                                              //             '263778060126');

                                              // log(rtUserProfile.toString());
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        VerifyPhonePinPage(
                                                            phoneNumber:
                                                                phoneController
                                                                    .text),
                                                  ));
                                            },
                                            child: const Text(
                                              'Sign in',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 60.0, bottom: 15.0),
                                        child: Container(
                                          alignment: Alignment.bottomCenter,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                "Don't have an account? ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              const Divider(
                                                color: Colors.transparent,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushNamed(RoutingConstants
                                                          .mobileRegistration);
                                                },
                                                child: const Text(
                                                  'Sign Up here',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
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
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
