import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:raundtable/constants/color_constants.dart';
import 'package:relative_scale/relative_scale.dart';

import '../invite_sent.dart';
import 'select_table.dart';
import 'table_details.dart';

class MainJoinTableView extends StatefulWidget {
  const MainJoinTableView({Key? key}) : super(key: key);

  @override
  State<MainJoinTableView> createState() => _MainJoinTableViewState();
}

class _MainJoinTableViewState extends State<MainJoinTableView> {
  bool haveConfirmed = false;
  int activeStep = 0;

  int upperBound = 1;

  void nextAction() {
    if (activeStep < upperBound) {
      setState(() {
        activeStep++;
      });
    }
  }

  void cancelAction() {
    if (activeStep > 0) {
      setState(() {
        activeStep--;
      });
    } else {
      setState(() {
        activeStep = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      SelectTableFormView(
        onNextCallback: nextAction,
        onCancelCallback: cancelAction,
      ),
      TableDetailsView(
        onNextCallback: nextAction,
        onCancelCallback: cancelAction,
      ),
    ];

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 35,
                    ),
                  ),
                  const SizedBox(width: 50),
                  Text(
                    'Join Table',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RelativeBuilder(builder: (context, height, width, sy, sx) {
              return NumberStepper(
                numbers: const [1, 2],
                enableStepTapping: false,
                enableNextPreviousButtons: false,
                activeStepColor: mainAppColor,
                activeStepBorderColor: mainAppColor,
                stepRadius: 15,
                numberStyle: const TextStyle(color: mainWhiteColor),
                lineColor: mainAppColor,
                lineLength: width * 0.23,
                activeStep: activeStep,
                onStepReached: (index) {
                  setState(() {
                    activeStep = index;
                  });
                },
              );
            }),
            const SizedBox(height: 30),
            Expanded(child: _screens[activeStep]),
          ],
        ),
      ),
    );
  }
}
