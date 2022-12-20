import 'package:flutter/material.dart';

import 'custom_bottom_navigation.dart';
import 'custom_rounded_btn.dart';
import 'forms/custom_dropdown_field.dart';
import 'forms/custom_form_field.dart';
import 'forms/custom_form_phone_field.dart';

class WidgetsExamplePage extends StatefulWidget {
  const WidgetsExamplePage({Key? key}) : super(key: key);

  @override
  State<WidgetsExamplePage> createState() => _WidgetsExamplePageState();
}

class _WidgetsExamplePageState extends State<WidgetsExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Example Page RaundTable')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomFormPhoneField(
                context: context,
                formName: 'phone',
                title: 'Phone',
              ),
              CustomFormField(
                context: context,
                formName: 'email',
                keyboardType: TextInputType.emailAddress,
                title: 'Email',
              ),
              CustomFormField(
                context: context,
                formName: 'pwd',
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                title: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye),
                ),
              ),
              CustomDropdownField(
                context: context,
                formName: 'name',
                title: 'Frequency',
                items: ['None', 'FortNight', 'Monthly']
                    .map(
                      (e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ),
                    )
                    .toList(),
              ),
              CustomRoundedButton(text: 'Send New Invitation', onTap: () {}),
              const SizedBox(height: 15),
              CustomRoundedButton(
                  text: 'Dashboard', isOutlined: true, onTap: () {}),
            ],
          ),
        ),
        bottomNavigationBar: const RTBottomNavigation());
  }
}
