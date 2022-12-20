import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:raundtable/constants/color_constants.dart';

class CustomPhoneNumberInput extends StatelessWidget {
  final TextEditingController textFieldController;

  const CustomPhoneNumberInput({
    Key? key,
    required this.textFieldController,
    required Null Function(dynamic phone) onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: mainAppColor),
      ),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {
          textFieldController.text = number.phoneNumber!;
        },
        initialValue: PhoneNumber(isoCode: 'AU'),
        selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.DIALOG,
            leadingPadding: 12,
            // showFlags: false,
            setSelectorButtonAsPrefixIcon: true),
        inputDecoration: const InputDecoration(
          hintText: 'Phone Number',
          //label: Text('Phone Number'),
          fillColor: mainWhiteColor,
          suffixIcon: Icon(Icons.check_circle, color: Colors.green),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        validator: (value) {
          if (value != null && value.isEmpty) {
            return value;
          }
          return null;
        },
      ),
    );
  }
}
