import 'package:flutter/material.dart';
import 'package:raundtable/constants/color_constants.dart';

import '../../components/custom_bottom_navigation.dart';
import 'body.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: mainAppColor,
            body: Body(),
            bottomNavigationBar: RTBottomNavigation(),
          ),
        ),
      ),
    );
  }
}
