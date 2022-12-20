// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:raundtable/constants/color_constants.dart';
import 'package:relative_scale/relative_scale.dart';

import 'custom_input_decoration.dart';
import 'form_constants.dart';

Widget CustomDateField({
  String? title,
  required BuildContext context,
  required String? formName,
  TextEditingController? controller,
  String validateError = '',
  FormFieldValidator<DateTime?>? validator,
  DateFormat? format,
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
  Function? customOnChangeCallback,

  /// determine if this is a custom phone input field or general textfield. Text by default
  String labelText = '',
  Widget suffixIcon = const SizedBox.shrink(),
}) {
  return RelativeBuilder(
    builder: (context, height, width, sy, sx) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            title == null
                ? const SizedBox.shrink()
                : Text(title, style: titleTextStyle(context)),
            customDateField(
              formName: formName,
              context: context,
              controller: controller,
              hintText: hintText,
              maxLines: maxLines,
              autoFocus: autoFocus,
              format: format,
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
              customOnChangeCallback: customOnChangeCallback,
            ),
          ],
        ),
      );
    },
  );
}

Widget customDateField({
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
  String labelText = '',
  bool autoFocus = false,
  var customOnChangeCallback,
  FormFieldValidator<DateTime?>? validator,
  String errorString = 'this field is required',
  Widget suffixIcon = const Icon(
    Icons.calendar_month,
    color: mainAppColor,
  ),
  DateFormat? format,
}) {
  var date = DateTime.now();
  date = DateTime(date.year - 16);

  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: FormBuilderDateTimePicker(
      // firstDate: date,
      name: formName!,
      controller: controller,
      autofocus: autoFocus,
      alwaysUse24HourFormat: true,
      format: format,
      validator: validator,
      transitionBuilder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
              colorScheme:
                  const ColorScheme.light().copyWith(primary: mainAppColor)),
          child: child!,
        );
      },
      style: fieldTextStyle(context),
      inputType: InputType.date,
      maxLines: maxLines,
      obscureText: obscureText,
      // firstDate: date,
      lastDate: date,
      initialDate: date,
      // initialValue: DateTime.now(),
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
