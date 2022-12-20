import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:raundtable/components/custom_checkbox_tile.dart';
import 'package:raundtable/components/custom_rounded_btn.dart';
import 'package:raundtable/components/forms/index.dart';
import 'package:raundtable/components/img_source_selector.dart';
import 'package:raundtable/constants/color_constants.dart';
import 'package:raundtable/shared/utils/index.dart';

import 'income_expense_view.dart';

class PersonalDetailsView extends StatefulWidget {
  const PersonalDetailsView({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsView> createState() => _PersonalDetailsViewState();
}

class _PersonalDetailsViewState extends State<PersonalDetailsView> {
  final formKey = GlobalKey<FormBuilderState>();

  bool acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.chevron_left),
          ),
          title: const Text('Step 1 of 3'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: FormBuilder(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Personal Details',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 30),
                AdvancedAvatar(
                  name: 'John Doe',
                  size: 100,
                  decoration: const BoxDecoration(
                    color: mainAppColor,
                    shape: BoxShape.circle,
                  ),
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () async {
                          final res = await ImageSourceSelector(context);

                          if (res != null) {
                            // TODO: pick profile image
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: mainWhiteColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add_circle,
                            color: mainAppColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomFormField(
                  context: context,
                  formName: 'firstName',
                  initialText: 'Jenny',
                  labelText: 'First Name',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context, errorText: ''),
                    ],
                  ),
                ),
                CustomFormField(
                  context: context,
                  formName: 'lastName',
                  initialText: 'Willy',
                  labelText: 'Last Name',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context, errorText: ''),
                    ],
                  ),
                ),
                CustomFormField(
                  context: context,
                  formName: 'email',
                  initialText: 'jack@example.com',
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context, errorText: ''),
                      FormBuilderValidators.email(context, errorText: ''),
                    ],
                  ),
                ),
                CustomFormField(
                  context: context,
                  formName: 'phoneNumber',
                  initialText: '+263778000999',
                  labelText: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context, errorText: ''),
                    ],
                  ),
                ),
                CustomFormField(
                  context: context,
                  formName: 'password',
                  initialText: '123456',
                  labelText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context, errorText: ''),
                    ],
                  ),
                ),
                CustomFormField(
                  context: context,
                  formName: 'dateOfBirth',
                  initialText: '26-09-2003',
                  labelText: 'Password',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context, errorText: ''),
                    ],
                  ),
                ),
                CustomCheckBoxTile(
                  onChanged: (value) {
                    setState(() {
                      acceptTerms = value ?? false;
                    });
                  },
                  text: 'I accept Terms and Conditions and \n Privacy Policy',
                  activeColor: mainAppColor,
                  value: acceptTerms,
                  checkColor: mainWhiteColor,
                ),
                const SizedBox(height: 10),
                Center(
                  child: CustomRoundedButton(
                    text: 'Next',
                    onTap: acceptTerms
                        ? () async {
                            // TODO: Validate form and route
                            routeTo(context, const IncomeExpenseView());
                          }
                        : () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
