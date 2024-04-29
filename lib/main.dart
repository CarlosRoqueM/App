//import 'package:app/src/pages/login/login_page.dart';
import 'package:app/src/Screen/main_screen.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/pages/Onboarding/onboarding_page.dart';
import 'package:app/src/pages/home/home_page.dart';
import 'package:app/src/pages/register/splashRegister_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:app/src/pages/login/login_page.dart';
import 'package:app/src/pages/onboarding/onboarding_page2.dart';
import 'package:app/src/pages/onboarding/onboarding_page3.dart';
import 'package:app/src/pages/register/register_page.dart';
import 'package:app/src/pages/register/register_page2.dart';
import 'package:app/src/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

User userSession = User.fromJson(GetStorage().read('user') ?? {});

void main() async {
  await GetStorage.init();
  dotenv.load(fileName: '.env');
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
      initialRoute: userSession.id != null ? '/main' : '/',
      getPages: [
        GetPage(name: '/', page: () =>  SplashPage()),
        GetPage(name: '/On1', page: () => OnboardingPage()),
        GetPage(name: '/On2', page: () => OnboardingPage2()),
        GetPage(name: '/On3', page: () => OnboardingPage3()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/main', page: () => MainScreen()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/register2', page: () =>  RegisterPage2()),
        GetPage(name: '/splashRegister', page: () =>  SplashRegisterPage()),
      ],
      navigatorKey: Get.key,
    );
  }
}
