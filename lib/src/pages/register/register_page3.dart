import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage3 extends StatelessWidget {
  const RegisterPage3({super.key});

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return BackgroundTemplate(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
          height: 100,
          child: Column(
            children: [_nextButton()],
          )),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 39, 16, 10),
          child: Column(
            children: [
              Column(
                children: [
                  _bottomBack(),
                  _subtittle(),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  //Widgets_privados

  Widget _bottomBack() {
    return SafeArea(
      child: Container(
          child: Row(children: [
        IconButton(
            onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios)),
        Text(
          'Escanee su DNI',
          style: GoogleFonts.rubik(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          textAlign: TextAlign.right,
        ),
      ])),
    );
  }

  Widget _subtittle() {
    return Container(
      margin: const EdgeInsets.all(20), // Puedes comentar o eliminar esta línea
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Por delante',
            style: GoogleFonts.rubik(
              color: GlobalColors.fourthColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _nextButton() {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                Get.to(const ());
              },
              child: Text(
                'Siguiente',
                style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
