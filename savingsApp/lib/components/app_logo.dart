
import 'package:flutter/material.dart';
import 'package:raundtable/constants/color_constants.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
              fit: BoxFit.cover,
            )),
            height: 150,
            width: 250,
          ),
          const Text(
            'Together. Better. Stronger',
            style: TextStyle(fontSize: 24, color: textColor),
          )
        ],
      ),
    );
  }
}
