import 'package:flutter/material.dart';
import 'package:raundtable/constants/color_constants.dart';

import '../../../components/custom_rounded_btn.dart';
import '../../../components/forms/custom_form_field.dart';
import '../../../shared/libs/firebase_auth_service.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = 9 / 10 * MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    FirebaseAuthService firebaseauthService = FirebaseAuthService();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainWhiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              Text(
                'Forgot Password',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: mainAppColor),
              ),
              const Divider(
                color: Colors.transparent,
              ),
              Text(
                'Enter your email address and we will send you a link to reset your password',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const Divider(
                color: Colors.transparent,
              ),
              CustomFormField(
                  context: context, formName: '', controller: emailController),
              const Divider(
                color: Colors.transparent,
              ),
              CustomRoundedButton(
                text: 'Send Email',
                onTap: () {
                  firebaseauthService
                      .sendPasswordResetEmail(emailController.text);
                  Navigator.pop(context);
                },
                widthRatio: 0.8,
                isOutlined: false,
                radius: 13,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
