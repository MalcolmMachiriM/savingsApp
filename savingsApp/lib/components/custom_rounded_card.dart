import 'package:flutter/material.dart';
import 'package:raundtable/constants/color_constants.dart';

class CustomRoundedCard extends StatelessWidget {
  const CustomRoundedCard({
    Key? key,
    this.child,
    this.height = 300,
    this.width = double.infinity,
    this.bgColor = cardBgColor,
    this.radius = 12,
    this.padding = 24,
  }) : super(key: key);

  final Widget? child;
  final double height;
  final double width;
  final Color bgColor;
  final double radius;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            // color: fieldFillColor,
            spreadRadius: 9,
            blurRadius: 9,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}
