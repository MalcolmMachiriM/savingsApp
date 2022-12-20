import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:raundtable/constants/color_constants.dart';
import 'package:relative_scale/relative_scale.dart';

import '../invite_people.dart';
import '../invite_sent.dart';
import 'create_table.dart';

class MainCreateTableFormView extends StatefulWidget {
  const MainCreateTableFormView({Key? key}) : super(key: key);

  @override
  State<MainCreateTableFormView> createState() =>
      _MainCreateTableFormViewState();
}

class _MainCreateTableFormViewState extends State<MainCreateTableFormView> {
  bool haveConfirmed = false;
  int activeStep = 0;

  int upperBound = 2;

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
      CreateTableFormView(
        onNextCallback: nextAction,
        onCancelCallback: cancelAction,
      ),
      InvitePeopleView(
        onNextCallback: nextAction,
        onCancelCallback: cancelAction,
      ),
      // todo pass callback
      const InviteSentView(),
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
                    'Create New Table',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RelativeBuilder(builder: (context, height, width, sy, sx) {
              return NumberStepper(
                numbers: const [1, 2, 3],
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
