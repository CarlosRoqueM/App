import 'dart:async';

import 'package:app/src/pages/login/login_page.dart';
import 'package:app/src/pages/onboarding/onboarding_page.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashRegisterPage extends StatefulWidget {
  const SplashRegisterPage({super.key});

  @override
  State<SplashRegisterPage> createState() => _SplashRegisterPageState();
}

class _SplashRegisterPageState extends State<SplashRegisterPage> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Get.to(LoginPage());
    });
    return BackgroundTemplate(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/Group.png', // Corregido el typo en 'assets'
                width: 200,
                height: 150,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Gracias',
                style: GoogleFonts.rubik(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Su cuenta a sido registrada',
                style: GoogleFonts.rubik(
                  color: GlobalColors.secondColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
