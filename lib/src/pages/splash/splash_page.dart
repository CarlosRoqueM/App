import 'dart:async';

import 'package:app/src/pages/login/login_page.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () { 
      Get.to(LoginPage());
      });
    return Scaffold(
      backgroundColor: GlobalColors.thirdColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/logo.png', // Corregido el typo en 'assets'
              width: 250,
              height: 250,
            ),
            Text(
              '',
              style: TextStyle(
                color: GlobalColors.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}