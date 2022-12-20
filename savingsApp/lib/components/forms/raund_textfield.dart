import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

class RaundTextField extends StatelessWidget {
  const RaundTextField(
      {Key? key,
      required this.context,
      required this.labelText,
      required this.keyboard,
      required this.controller,
      required this.validator,
      this.icon})
      : super(key: key);

  final BuildContext context;
  final String labelText;
  final TextInputType keyboard;
  final TextEditingController controller;
  final String? Function(String? p1) validator;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: Theme.of(context).textTheme.subtitle1),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: mainAppColor)),
            child: TextFormField(
                controller: controller,
                keyboardType: keyboard,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    prefix: icon,
                    // labelText: labelText,
                    border: InputBorder.none),
                validator: validator),
          ),
        ],
      ),
    );
  }
}
