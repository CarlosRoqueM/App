//import 'package:app/src/pages/login/login_page.dart';

import 'package:app/src/models/user.dart';
import 'package:app/src/pages/Onboarding/onboarding_page.dart';
import 'package:app/src/pages/client/Search/searchPage.dart';
import 'package:app/src/pages/client/address/create/client_address_create_page.dart';
import 'package:app/src/pages/client/address/list/client_address_list_page.dart';
import 'package:app/src/pages/client/enfermeros/clientMainPage.dart';
import 'package:app/src/pages/client/profile/info/profilePage.dart';
import 'package:app/src/pages/client/profile/update/updateProfilePage.dart';
import 'package:app/src/pages/client/home/home_page.dart';
import 'package:app/src/pages/client/profiles/create/client_profiles_create_page.dart';
import 'package:app/src/pages/client/profiles/list/client_profiles_list_page.dart';
import 'package:app/src/pages/nurse/home/homeNurse_page.dart';
import 'package:app/src/pages/nurse/reservas/nuseMainPage.dart';
import 'package:app/src/pages/nurse/settings/settingsNurse_page.dart';
import 'package:app/src/pages/regisrterNurse/registerNurse_page.dart';
import 'package:app/src/pages/register/splashRegister_page.dart';
import 'package:app/src/pages/client/settings/settings_page.dart';
import 'package:app/src/pages/client/settings/settings_page_controller.dart';
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
      //initialRoute: userSession.id != null ? '/main' : '/',
      initialRoute: userSession.id != null ? userSession.roles!.length > 1 ? '/mainNurse' : '/main' : '/', //DEpendiendo del id redigira a diferentes rutas tanto del cliente como del enfermero
      getPages: [
        /*------------- General Page --------------------*/
        GetPage(name: '/', page: () => SplashPage()),
        GetPage(name: '/On1', page: () => OnboardingPage()),
        GetPage(name: '/On2', page: () => OnboardingPage2()),
        GetPage(name: '/On3', page: () => OnboardingPage3()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/registerNurse', page: () => RegisterNursePage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/register2', page: () => RegisterPage2()),
        GetPage(name: '/splashRegister', page: () => SplashRegisterPage()),

        /*------------- Client Page --------------------*/
        GetPage(name: '/main', page: () => ClientMainPage()),
        GetPage(name: '/client/home', page: () => HomePage()),
        GetPage(name: '/client/profile/info', page: () => profilePage()),
        GetPage(
            name: '/client/profile/update', page: () => updateProfilePage()),
        GetPage(name: '/client/settings', page: () => SettingsPage()),
        GetPage(name: '/client/home', page: () => HomePage()),
        GetPage(name: '/client/search', page: () => SearchPage()),
        GetPage(
            name: '/client/address/create',
            page: () => ClientAddressCreatePage()),
        GetPage(
            name: '/client/address/list', page: () => ClientAddressListPage()),
        GetPage(
            name: '/client/profiles/create',
            page: () => ClientProfilesCreatePage()),
        GetPage(
            name: '/client/profiles/list', page: () => ClientProfilesListPage()),

        /*------------- Nurse Page --------------------*/

        GetPage(name: '/mainNurse', page: () => NurseMainPage()),
        GetPage(name: '/nurse/home', page: () => HomeNursePage()),
        GetPage(name: '/nurse/settings', page: () => SettingsNursePage()),

        
      ],
      navigatorKey: Get.key,
    );
  }
}
