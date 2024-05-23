import 'package:app/src/pages/regisrterNurse/registerNurse_controller.dart';
import 'package:app/src/pages/register/register_controller.dart';
import 'package:app/src/pages/register/register_page2.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterNursePage extends StatelessWidget {

  //Asignar los cambios y roteo de las nuevas paginas para el registro del enfermero

  RegisterNurseController cont = Get.put(RegisterNurseController());
  final ValueNotifier<bool> _termsAccepted = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return BackgroundTemplate(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Container(
            padding: const EdgeInsets.all(8),
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [_nextButton()],
            )),
        body: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bottomBack(),
                _tittle(),
                _subtittle(),
                //_googleButton(),
                _email(),
                _password(),
                _confiPassword(),
                _termsAndConditions()
              ],
            )),
      ),
    );
  }

  //Widgets_privados

  Widget _bottomBack() {
    return SafeArea(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios)),
      ]),
    );
  }

  Widget _termsAndConditions() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: _termsAccepted,
            builder: (context, value, child) {
              return Checkbox(
                value: value,
                onChanged: (bool? newValue) {
                  _termsAccepted.value = newValue ?? false;
                },
              );
            },
          ),
          Expanded(
            child: Text(
              'Acepto las condiciones del servicio y la política de privacidad',
              style: GoogleFonts.poppins(
                color: const Color.fromRGBO(103, 114, 148, 100),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tittle() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Únete a nosotros para empezar ofertar tus servicios de enfermería.',
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _subtittle() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Podrás encontrar pacientes que necesiten de tus servicios de enfermería.',
            style: GoogleFonts.poppins(
              color: const Color.fromRGBO(103, 114, 148, 100),
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _googleButton() {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      //onPrimary: Color.fromRGBO(103, 114, 148, 100),
      backgroundColor: Colors.white,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 125, vertical: 18),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
    return Container(
      margin: const EdgeInsets.only(
          top: 45), // Puedes comentar o eliminar esta línea
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {},
              child: Text(
                'Google',
                style: GoogleFonts.rubik(
                  color: Color.fromRGBO(103, 114, 148, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }

  Widget _customTextField(
      {required TextEditingController controller,
      required String labelText,
      TextInputType keyboardType = TextInputType.text,
      bool obscureText = false}) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          cursorColor: GlobalColors.primaryColor,
          decoration: InputDecoration(
            labelText: labelText,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10),
            labelStyle: const TextStyle(
              color: Color.fromRGBO(2, 81, 89, 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget _email() {
    return _customTextField(
        controller: cont.emailController,
        labelText: 'Email',
        keyboardType: TextInputType.emailAddress,
        obscureText: false);
  }

  Widget _password() {
    return _customTextField(
        controller: cont.passwordController,
        labelText: 'Contraseña',
        keyboardType: TextInputType.visiblePassword,
        obscureText: true);
  }

  Widget _confiPassword() {
    return _customTextField(
        controller: cont.confirmPasswordController,
        labelText: 'Confirmar Contraseña',
        keyboardType: TextInputType.visiblePassword,
        obscureText: true);
  }

  Widget _nextButton() {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      //onPrimary: Color.fromRGBO(103, 114, 148, 100),
      backgroundColor: GlobalColors.primaryColor,
      minimumSize: const Size(88, 36),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  cont.gotoRegisterPage2();
                },
                child: Container(
                  width: constraints.maxWidth * 1,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Siguiente',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        ),
      );
    });
  }
}
