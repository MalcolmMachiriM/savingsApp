// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:raundtable/constants/color_constants.dart';

InputDecoration CustomInputDecoration({
  required double radius,
  required TextStyle textStyle,
  Color fillColor = Colors.transparent,
  bool disableBorder = false,
  String? labelText,
  String? hintText,
  Widget? suffixIcon,
  Widget? prefixIcon,
}) {
  return InputDecoration(
    border: InputBorder.none,
    filled: true,
    labelText: labelText,
    fillColor: fillColor,
    // focusedBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(radius),
    //   borderSide:
    //       BorderSide(color: disableBorder ? Colors.transparent : mainAppColor),
    // ),
    hintText: hintText,
    labelStyle: textStyle,
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    hintStyle: const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: disableBorder ? mainAppColor : mainAppColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: const BorderSide(color: Colors.red),
    ),
  );
}
