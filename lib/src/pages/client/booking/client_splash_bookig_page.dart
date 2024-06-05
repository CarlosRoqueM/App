import 'package:app/src/pages/client/enfermeros/clientMainPage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:app/src/pages/login/login_page.dart';
import 'package:app/src/pages/onboarding/onboarding_page.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:google_fonts/google_fonts.dart';


class ClientSplashBookingPage extends StatefulWidget {
  const ClientSplashBookingPage({super.key});

  @override
  State<ClientSplashBookingPage> createState() => _ClientSplashBookingPageState();
}

class _ClientSplashBookingPageState extends State<ClientSplashBookingPage> {
  @override
  Widget build(BuildContext context) {
   Timer(const Duration(seconds: 4), () {
      Get.to(ClientMainPage());
    });
    return BackgroundTemplate(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/logo.png', // Corregido el typo en 'assets'
                width: 200,
                height: 150,
              ),
              Text(
                'Reserva Registrada',
                style: GoogleFonts.rubik(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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