import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sravel/screens/signup_screen1.dart';
import 'package:sravel/screens/signup_screen2.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(1),
      initialRoute: '/signup1',
      onGenerateRoute: (settings) {
        if (settings.name == '/signup1') {
          return GetPageRoute(page: () => const SignUpPage1());
        } else if (settings.name == '/signup2') {
          return GetPageRoute(page: () => SignUpPage2());
        }
        return null;
      },
    );
  }
}
