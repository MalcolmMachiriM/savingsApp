// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:raundtable/constants/color_constants.dart';
import 'package:relative_scale/relative_scale.dart';

import 'custom_input_decoration.dart';
import 'form_constants.dart';

Widget CustomFormField({
  String? title,
  required BuildContext context,
  required String? formName,
  TextEditingController? controller,
  String validateError = '',
  FormFieldValidator<String>? validator,
  String hintText = '',
  String? initialText,
  bool autoFocus = false,
  int maxLines = 1,
  bool obscureText = false,
  bool isPhoneField = false,
  bool readOnly = false,
  bool enforceLength = false,
  bool unfocus = false,
  TextInputType? keyboardType = TextInputType.text,
  Color? titleColor,
  Color fillColor=fieldFillColor,
  Function? customOnChangeCallback,

  /// determine if this is a custom phone input field or general textfield. Text by default
  String labelText = '',
  Widget? suffixIcon,
   Widget? prefixIcon,
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
                :   Text(
              title, style: titleTextStyle(context)),
            customTextField(
              formName: formName,
              context: context,
              fillColor: fillColor,
              controller: controller,
              hintText: hintText,
              maxLines: maxLines,
              autoFocus: autoFocus,
              obscureText: obscureText,
              readOnly: readOnly,
              errorString: validateError,
              validator: validator,
              labelText: labelText,
              enforceLength: enforceLength,
              unfocus: unfocus,
              suffixIcon: suffixIcon,
              keyboardType: keyboardType,
              initialText: initialText,
              prefixIcon: prefixIcon,
              customOnChangeCallback: customOnChangeCallback,
            ),
          ],
        ),
      );
    },
  );
}

Widget customTextField({
  TextEditingController? controller,
  required BuildContext context,
  TextInputType? keyboardType,
  String? initialText,
  String hintText = '',
  String? formName,
  int maxLines = 1,
  bool readOnly = false,
  bool obscureText = false,
  bool unfocus = false,
  bool enforceLength = false,
   Color fillColor=fieldFillColor,
  String labelText = '',
  bool autoFocus = false,
  var customOnChangeCallback,
  FormFieldValidator<String>? validator,
  String errorString = 'this field is required',
   Widget? suffixIcon,
   Widget? prefixIcon,
}) {
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: FormBuilderTextField(
        name: formName!,
        readOnly: readOnly,
        initialValue: initialText,
        controller: controller,
        autofocus: autoFocus,
        style: fieldTextStyle(context),
        maxLines: maxLines,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        onEditingComplete: () => unfocus
            ? FocusScope.of(context).unfocus()
            : FocusScope.of(context).nextFocus(),
        onChanged: customOnChangeCallback,
        decoration: CustomInputDecoration(
          radius: borderRadius,
          fillColor: fillColor,
          textStyle: fieldTextStyle(context)!,
          labelText: labelText,
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
      ),
    ),
  );
}
