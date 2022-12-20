import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../constants/others.dart';

class RTBottomNavigation extends StatefulWidget {
  const RTBottomNavigation({Key? key}) : super(key: key);

  @override
  State<RTBottomNavigation> createState() => _RTBottomNavigationState();
}

class _RTBottomNavigationState extends State<RTBottomNavigation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _selectedTextStyle =
        Theme.of(context).textTheme.bodyText2?.copyWith(color: mainWhiteColor);
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(navBarBorderRadius),
          topLeft: Radius.circular(navBarBorderRadius)),
      child: CustomNavigationBar(
        iconSize: 25.0,
        selectedColor: mainWhiteColor,
        strokeColor: Colors.transparent,
        unSelectedColor: mainWhiteColor.withOpacity(0.5),
        backgroundColor: mainAppColor,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            selectedTitle: Text(
              'Home',
              style: _selectedTextStyle,
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.equalizer_outlined),
            selectedTitle: Text(
              "Stats",
              style: _selectedTextStyle,
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.filter_alt_outlined),
            selectedTitle: Text(
              "Filter",
              style: _selectedTextStyle,
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.account_circle_outlined),
            selectedTitle: Text(
              "Profile",
              style: _selectedTextStyle,
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
