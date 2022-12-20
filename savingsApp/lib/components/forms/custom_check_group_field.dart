// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:raundtable/constants/color_constants.dart';
import 'package:relative_scale/relative_scale.dart';

import 'custom_input_decoration.dart';
import 'form_constants.dart';

Widget CustomCheckGroupField({
  String? title,
  required BuildContext context,
  required String? formName,
  String validateError = '',
  required List<FormBuilderFieldOption<Object?>> items,
  FormFieldValidator<Object>? validator,
  String hintText = '',
  var initialValue,
  bool autoFocus = false,
  bool readOnly = false,
  bool unfocus = true,
  Color? titleColor,
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
              title,
              style: titleTextStyle(context),
            ),
            customCheckboxField(
              formName: formName,
              context: context,
              hintText: hintText,
              autoFocus: autoFocus,
              readOnly: readOnly,
              errorString: validateError,
              validator: validator,
              unfocus: unfocus,
              initialValue: initialValue,
              items: items,
            ),
          ],
        ),
      );
    },
  );
}

Widget customCheckboxField({
  required BuildContext context,
  var initialValue,
  String hintText = '',
  String? formName,
  bool readOnly = false,
  bool unfocus = false,
  bool autoFocus = false,
  required List<FormBuilderFieldOption<Object?>> items,
  var customOnChangeCallback,
  FormFieldValidator<Object>? validator,
  String errorString = 'this field is required',
}) {
  return FormBuilderCheckboxGroup<Object?>(
    name: formName!,
    activeColor: mainAppColor,
    checkColor: mainWhiteColor,
    separator: const SizedBox(width: 8),
    initialValue: initialValue,
    validator: validator,
    options: items,
    decoration: CustomInputDecoration(
      radius: borderRadius,
      disableBorder: true,
      fillColor: Colors.transparent,
      textStyle: fieldTextStyle(context)!,
    ),
  );
}
