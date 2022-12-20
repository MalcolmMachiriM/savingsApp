// a handy navigation function

import 'package:flutter/material.dart';

// go to [routeTo] widget page
routeTo(BuildContext context, Widget routeTo) {
  return Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => routeTo,
    ),
  );
}

/// route to next view while clearing navigation history
routeToWithClear(BuildContext context, Widget routeTo) {
  return Navigator.of(context).pushReplacement<void, void>(
    MaterialPageRoute<void>(
      builder: (BuildContext context) => routeTo,
    ),
  );
}

routeBack(BuildContext context) {
  return Navigator.of(context).pop();
}

/// useful for logout
// routeBackWithClear(BuildContext context) {
//   return Navigator.of(context).pushAndRemoveUntil(
//       MaterialPageRoute(builder: (c) => SplashView()), (route) => false);
// }
