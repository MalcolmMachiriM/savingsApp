import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

class DashCard extends StatelessWidget {
  const DashCard({
    Key? key,
    required this.size,
    required this.cardChild,
  }) : super(key: key);

  final Size size;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(80),
          ),
        ),
        width: 3 / 4 * size.width,
        height: 1 / 5 * size.height,
        child: Card(
          shadowColor: Colors.transparent,
          color: fadeAppColor,
          child: cardChild,
        ),
      ),
    );
  }
}
