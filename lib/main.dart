import 'package:flutter/material.dart';

import 'configs/routes.dart';
import 'screens/create_scan_screen/create_web_qr_screen.dart';
import 'screens/screen_exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.blue, fontFamily: "poppins_semibold"),
      initialRoute: Routes.homeScreen,
      routes: {
        Routes.homeScreen: (context) => const HomePage(),
        Routes.createQrWebsite: (context) => const CreateWebQrScreen(),
        Routes.recentsScreen: (context) => const RecentsScreen(),
      },
    );
  }
}