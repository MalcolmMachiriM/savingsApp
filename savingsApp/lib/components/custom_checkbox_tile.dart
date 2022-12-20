import 'package:flutter/material.dart';
import 'package:raundtable/constants/color_constants.dart';

class CustomCheckBoxTile extends StatelessWidget {
  const CustomCheckBoxTile({
    Key? key,
    this.value,
    this.activeColor = mainAppColor,
    this.checkColor = mainWhiteColor,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  final bool? value;
  final Color activeColor;
  final Color checkColor;
  final String text;

  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.grey,
          ),
          child: Checkbox(
            checkColor: checkColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            activeColor: activeColor,
            value: value,
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 3),
        Text(
          text,
          softWrap: true,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
