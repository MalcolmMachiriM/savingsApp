import 'package:flutter/material.dart';
import 'package:raundtable/constants/color_constants.dart';

class DefaultButton extends StatelessWidget {
  final String displayText;
  final bool fillcolor;
  var press;
  static const circularRadius = 10.0;
  DefaultButton(
      {Key? key,
      required this.displayText,
      required this.fillcolor,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: width, height: height,
      child: TextButton(
        style: TextButton.styleFrom(
            primary: fillcolor ? Colors.white : mainAppColor,
            backgroundColor: fillcolor ? mainAppColor : Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(circularRadius),
                side: const BorderSide(color: mainAppColor))),
        child: Text(
          displayText,
          style: TextStyle(
            color: fillcolor ? Colors.white : mainAppColor,
          ),
        ),
        onPressed: press,
      ),
    );
  }
}
