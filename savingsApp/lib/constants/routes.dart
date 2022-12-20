import 'package:flutter/material.dart';
import 'package:raundtable/constants/routing_constants.dart';
import 'package:raundtable/features/auth/sign_in/login.dart';
import 'package:raundtable/features/auth/sign_in/views/verify_phone_number.dart';

import '../features/auth/registration/mobile_registration.dart';
import '../features/auth/sign_in/forgot_password.dart';
import '../features/dashboard/dashboard.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutingConstants.verifyPhone:
        return navigateToPage(const VerifyPhonePinPage(
          phoneNumber: '',
        ));
      case RoutingConstants.login:
        return navigateToPage(const Login());
      case RoutingConstants.mobileRegistration:
        return navigateToPage(const MobileRegistration());
      case RoutingConstants.forgotPassword:
        return navigateToPage(const ForgotPassword());
      case RoutingConstants.dashboard:
        return navigateToPage(const Dashboard());
      default:
        return navigateToPage(const Login());
    }
  }

  static MaterialPageRoute<dynamic> navigateToPage(dynamic page) {
    return MaterialPageRoute(builder: (_) {
      return page;
    });
  }
}

routerGoTo(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

routerGoToWithClear(BuildContext context, Widget page) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}