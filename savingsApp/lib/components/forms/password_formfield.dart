import 'package:flutter/material.dart';
import 'package:raundtable/constants/color_constants.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  const PasswordField({Key? key, this.controller}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          TextFormField(
            // onChanged: (String password) {
            //   widget.controller?.text = password;
            // },
            validator: (value) {
              if (widget.controller!.text.isEmpty) {
                return 'this field is required';
              }
              return null;
            },
            controller: widget.controller,
            obscureText: isPassword,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon:
                    Icon(isPassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  var ff = isPassword;
                  setState(() {
                    isPassword = !ff;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: mainAppColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: mainAppColor),
              ),
              focusColor: const Color(0xFFBCBBBE),
            ),
          ),
        ],
      ),
    );
  }
}
