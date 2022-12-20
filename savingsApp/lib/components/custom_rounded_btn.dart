import 'package:flutter/material.dart';
import 'package:raundtable/constants/color_constants.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    Key? key,
    required this.text,
    this.onTap,
    this.widthRatio = 0.8,
    this.height = 50,
    this.isOutlined = false,
    this.radius = 13,
    this.fontWeight = FontWeight.w600,
  }) : super(key: key);

  final String text;
  final VoidCallback? onTap;
  final double widthRatio; // button width as %age of device width size
  final double height;
  final bool isOutlined;
  final double radius;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: isOutlined ? appOutlinedBtnColor : mainAppColor,
        onPrimary: isOutlined ? mainAppColor : mainWhiteColor,
        side: const BorderSide(color: mainAppColor, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        fixedSize: Size(
          MediaQuery.of(context).size.width * widthRatio,
          height,
        ),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: isOutlined ? mainAppColor : mainWhiteColor,
              fontWeight: fontWeight,
            ),
      ),
    );
  }
}
