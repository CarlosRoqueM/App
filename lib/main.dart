//import 'package:app/src/pages/login/login_page.dart';
import 'package:app/src/Screen/main_screen.dart';
import 'package:app/src/pages/Onboarding/onboarding_page.dart';
import 'package:app/src/pages/login/login_page.dart';
import 'package:app/src/pages/onboarding/onboarding_page2.dart';
import 'package:app/src/pages/onboarding/onboarding_page3.dart';
import 'package:app/src/pages/register/register_page.dart';
import 'package:app/src/pages/register2/register_page2.dart';
import 'package:app/src/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App Tesis',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const MainScreen()),
        GetPage(name: '/On1', page: () => OnboardingPage()),
        GetPage(name: '/On2', page: () => OnboardingPage2()),
        GetPage(name: '/On3', page: () => OnboardingPage3()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/register2', page: () => const RegisterPage2()),
      ],
      navigatorKey: Get.key,
    );
  }
}
