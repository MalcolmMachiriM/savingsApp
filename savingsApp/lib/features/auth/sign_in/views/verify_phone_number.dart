import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:raundtable/components/app_logo.dart';
import 'package:raundtable/components/custom_snackbar.dart';
import 'package:raundtable/constants/routes.dart';
import 'package:raundtable/features/dashboard/dashboard.dart';
import 'package:raundtable/shared/models/registration/rt_user.dart';
import 'package:raundtable/shared/services/firestore_user_service.dart';
import 'package:raundtable/shared/services/shared_pref_service.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:timer_button/timer_button.dart';

class VerifyPhonePinPage extends StatefulWidget {
  const VerifyPhonePinPage({Key? key, required this.phoneNumber})
      : super(key: key);

  final String phoneNumber;

  @override
  _VerifyPhonePinPageState createState() => _VerifyPhonePinPageState();
}

class _VerifyPhonePinPageState extends State<VerifyPhonePinPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _sharedPref = SharedPreferencesService();
  final formKey = GlobalKey<FormState>();

  // TextEditingController textEditingController = TextEditingController();

  bool hasError = false;
  bool loading = false;
  bool verifying = false;

  String currentText = "";
  int? _resendToken;

  late String _verificationId;

  // late StreamController<ErrorAnimationType> errorController;
  late TapGestureRecognizer onTapRecognizer;

  @override
  void initState() {
    super.initState();

    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    //  errorController = StreamController<ErrorAnimationType>();

    verifyPhoneNumber();
  }

  Future<RtUser?> getLoggedInUserProfile() async {
    String _num = widget.phoneNumber.replaceAll('+', '').trim();
    final rtUserProfile =
        await FirestoreUserService(uid: _num).getRtUserByMobileFuture(_num);

    log('[RT-USER] ${rtUserProfile.toString()}');

    if (rtUserProfile == null) {
      return rtUserProfile;
    }

    // TODO: Perform needed operations or persist fbUser in db or state management | shared pref
    // TODO: also on user profile, rtUserProfile

    await _sharedPref.cacheCurrentUser(rtUserProfile);

    return rtUserProfile;
  }

  Future<void> verifyPhoneNumber() async {
    setState(() {
      verifying = true;
    });

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            final _user = await _auth.signInWithCredential(credential);

            if (_user.user == null) {
              customSnackBar(context, "failed to get user details",
                  bgColor: Colors.red);
              setState(() {
                verifying = false;
              });
              return;
            }

            customSnackBar(
                context, "Phone number automatically verified and signed in");

            final res = await getLoggedInUserProfile();

            if (res == null) {
              customSnackBar(context, "failed to get user profile",
                  bgColor: Colors.red);
              setState(() {
                loading = false;
              });
              return;
            }

            try {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                routerGoToWithClear(context, const Dashboard());
              });
            } catch (e) {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                routerGoToWithClear(context, const Dashboard());
              });
            }
          }

          // fb err
          on FirebaseAuthException catch (e) {
            customSnackBar(context, e.message ?? 'failed to verify number',
                bgColor: Colors.red);
          }

          // other err
          catch (e) {
            customSnackBar(context, "failed to automatically verify number!",
                bgColor: Colors.red);
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          log('Phone number verification failed. Code: ${e.code}. Message: ${e.message}');

          customSnackBar(context,
              'Phone number verification failed. Code: ${e.code}. Message: ${e.message}',
              bgColor: Colors.red);
          setState(() {
            hasError = true;
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          customSnackBar(context,
              'Code sent. Please check your phone for the verification code.');
          setState(() {
            _verificationId = verificationId;
            _resendToken = resendToken;
          });
        },
        timeout: const Duration(seconds: 45),
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _verificationId = verificationId;
          });
        },
        forceResendingToken: _resendToken,
      );

      setState(() {
        verifying = false;
      });
    }

    // err
    catch (e) {
      customSnackBar(context, "Failed to Verify Phone Number: ${e.toString()}",
          bgColor: Colors.red);
      setState(() {
        verifying = false;
      });
    }
  }

  Future<void> signInWithPhoneNumber() async {
    setState(() {
      loading = true;
    });

    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: currentText,
      );

      final _user = await _auth.signInWithCredential(credential);

      if (_user.user == null) {
        customSnackBar(context, "failed to sign in with phone number",
            bgColor: Colors.red);
        setState(() {
          loading = false;
        });
        return;
      }

      customSnackBar(
          context, "Phone number verified successfully. Sign in success");

      final res = await getLoggedInUserProfile();

      if (res == null) {
        customSnackBar(context, "failed to get user profile",
            bgColor: Colors.red);
        setState(() {
          loading = false;
        });
        return;
      }

      try {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          routerGoToWithClear(context, const Dashboard());
        });
      } catch (e) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          routerGoToWithClear(context, const Dashboard());
        });
      }
    }

    // error
    catch (e) {
      customSnackBar(context, "Failed to sign using phone: ${e.toString()}",
          bgColor: Colors.red);
    }

    setState(() {
      loading = false;
    });
  }

  // @override
  // void dispose() {
  //   errorController.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mobile Verification'),
        ),
        body: RelativeBuilder(builder: (context, height, width, sy, sx) {
          return verifying
              ? Center(
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.3),
                      Text(
                        'Verifying phone number: ${widget.phoneNumber}...',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const CircularProgressIndicator(),
                    ],
                  ),
                )
              : loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      height: height,
                      width: width,
                      child: ListView(
                        children: <Widget>[
                          const AppLogo(),
                          const SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Please type verification code sent\nto ${widget.phoneNumber}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // mounted
                          //     ?
                          Form(
                            key: formKey,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 30,
                                ),
                                child: PinCodeTextField(
                                  appContext: context,
                                  length: 6,
                                  animationType: AnimationType.fade,
                                  validator: (v) {
                                    return null;
                                  },
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(5),
                                    fieldHeight: 50,
                                    fieldWidth: 40,
                                    activeFillColor:
                                        hasError ? Colors.red : Colors.white,
                                  ),
                                  cursorColor: Colors.black,
                                  animationDuration:
                                      const Duration(milliseconds: 300),
                                  enableActiveFill: true,
                                  // errorAnimationController: errorController,
                                  // controller: textEditingController,
                                  keyboardType: TextInputType.number,
                                  boxShadows: const [
                                    BoxShadow(
                                      offset: Offset(0, 1),
                                      color: Colors.black12,
                                      blurRadius: 10,
                                    )
                                  ],
                                  onCompleted: (v) async {
                                    formKey.currentState?.validate();
                                    await signInWithPhoneNumber();
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      currentText = value;
                                    });
                                  },
                                )),
                          ),
                          // : const Center(
                          //     child: CircularProgressIndicator()),
                          Center(
                            child: Text(
                              hasError ? "Error, please try again!" : "",
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: sx(50),
                              vertical: 15,
                            ),
                            child: TimerButton(
                              label: "Resend Code",
                              timeOutInSeconds: 60,
                              onPressed: () async {
                                await verifyPhoneNumber();
                              },
                              disabledColor: Colors.grey,
                              color: Colors.green,
                              disabledTextStyle: TextStyle(fontSize: sx(20.0)),
                              activeTextStyle: TextStyle(
                                  fontSize: sx(20.0), color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
        }),
      ),
    );
  }
}
