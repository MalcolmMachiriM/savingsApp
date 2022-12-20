import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:raundtable/constants/color_constants.dart';

import 'components/material_swatch_generator.dart';
import 'constants/routes.dart';
import 'constants/routing_constants.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: generateMaterialColor(mainAppColor),
        scaffoldBackgroundColor: mainWhiteColor,
      ),
      initialRoute: RoutingConstants.login,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
