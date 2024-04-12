import 'package:app/src/pages/onboarding/onboarding_controller.dart';
import 'package:app/src/pages/onboarding/onboarding_page3.dart';
import 'package:app/src/widgets/BackgroundtemplateOnI.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage2 extends StatelessWidget {
  OnboardingController cont = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return BackgroundTemplateOnI(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Container(
            height: 200,
            child: Column(
              children: [_nextbutton(), _textSkip()],
            )),
        body: Center(
          child: Column(
            children: [
              Column(
                children: [_img(), _tittle(), _subtittle()],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _nextbutton() {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      //onPrimary: Color.fromRGBO(103, 114, 148, 100),
      backgroundColor: GlobalColors.primaryColor,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 120, vertical: 18),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
    return Container(
      margin: const EdgeInsets.only(
          top: 20), // Puedes comentar o eliminar esta línea
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              style: raisedButtonStyle,
              //onPressed: () => cont.login(), (para cuandose obtenga la coneccion )
              onPressed: () {
                Get.to(OnboardingPage3());
              },
              child: Text(
                'Siguiente',
                style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }

  Widget _img() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          child: Column(
            children: [
              Image.asset('assets/img/img2.png'), // Utiliza el SVG desenfocado
            ],
          ),
        ),
      ),
    );
  }

  Widget _tittle() {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Text(
              'Busca enfermeros especializado',
              style: GoogleFonts.rubik(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _subtittle() {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Text(
              'Enfermeros especializados listos para brindar atención personalizada y de alta calidad. Confíe en nuestra experiencia y dedicación.',
              style: GoogleFonts.rubik(
                color: Color.fromRGBO(103, 114, 148, 100),
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _textSkip() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => cont.gotoLoginPage(),
            child: Text(
              'Omitir',
              style: TextStyle(
                  color: GlobalColors.secondColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
