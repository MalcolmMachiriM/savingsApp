// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:raundtable/constants/color_constants.dart';
import 'package:raundtable/shared/libs/index.dart';
import 'package:relative_scale/relative_scale.dart';

import 'custom_input_decoration.dart';
import 'form_constants.dart';

Widget CustomFormPhoneField({
  String? title,
  required BuildContext context,
  required String? formName,
  TextEditingController? controller,
  String validateError = '',
  FormFieldValidator<String>? validator,
  String hintText = '',
  String? initialText,
  bool autoFocus = false,
  bool obscureText = false,
  bool isPhoneField = false,
  bool enforceLength = false,
  bool unfocus = false,
  Color? titleColor,
  Function? customOnChangeCallback,

  /// determine if this is a custom phone input field or general textfield. Text by default
  String labelText = '',
  Widget suffixIcon = const SizedBox.shrink(),
}) {
  return RelativeBuilder(
    builder: (context, height, width, sy, sx) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            title == null
                ? const SizedBox.shrink()
                : Text(title, style: titleTextStyle(context)),
            _customPhoneField(
              formName: formName,
              context: context,
              controller: controller,
              hintText: hintText,
              autoFocus: autoFocus,
              obscureText: obscureText,
              errorString: validateError,
              validator: validator,
              labelText: labelText,
              enforceLength: enforceLength,
              unfocus: unfocus,
              suffixIcon: suffixIcon,
              initialText: initialText,
              customOnChangeCallback: customOnChangeCallback,
            ),
          ],
        ),
      );
    },
  );
}

Widget _customPhoneField({
  TextEditingController? controller,
  required BuildContext context,
  String? initialText,
  String hintText = '',
  String? formName,
  bool obscureText = false,
  bool unfocus = false,
  bool enforceLength = false,
  String labelText = '',
  bool autoFocus = false,
  var customOnChangeCallback,
  FormFieldValidator<String>? validator,
  String errorString = 'this field is required',
  Widget suffixIcon = const SizedBox.shrink(),
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: FormBuilderPhoneField(
      priorityListByIsoCode: const ['AU'],
      defaultSelectedCountryIsoCode: 'AU',
      name: formName!,
      initialValue: initialText,
      controller: controller,
      autofocus: autoFocus,
      style: fieldTextStyle(context),
      obscureText: obscureText,
      validator: validator,
      onEditingComplete: () => unfocus
          ? FocusScope.of(context).unfocus()
          : FocusScope.of(context).nextFocus(),
      onChanged: customOnChangeCallback,
      decoration: CustomInputDecoration(
        radius: borderRadius,
        textStyle: fieldTextStyle(context)!,
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    ),
  );
}
