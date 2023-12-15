import 'package:app/src/pages/register/register_controller.dart';
import 'package:app/src/pages/register2/register_page2.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  RegisterController cont = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return BackgroundTemplate(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Column(
                children: [
                  _bottomBack(),
                  _tittle(),
                  _subtittle(),
                  _googleButton(),
                  _email(),
                  _password(),
                  _confiPassword(),
                  _textforPassword(),
                  _nextButton(),
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
      ])),
    );
  }

  Widget _textforPassword() {
    return Container(
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'Acepto las condiciones del servicio y la política de privacidad',
              style: GoogleFonts.rubik(
                  color: Color.fromRGBO(103, 114, 148, 100),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _tittle() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'Únete a nosotros para empezar a buscar enfermeros especializado',
              style: GoogleFonts.rubik(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
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
            'Podrás buscar enfermeros y solicitar sus servicios de enfermería.',
            style: GoogleFonts.rubik(
              color: Color.fromRGBO(103, 114, 148, 100),
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _googleButton() {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      //onPrimary: Color.fromRGBO(103, 114, 148, 100),
      primary: Colors.white,
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

  Widget _email() {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 7, left: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color.fromRGBO(103, 114, 148, 16),
        ),
        /*boxShadow: [
           / BoxShadow(
                color: Color.fromRGBO(103, 114, 148, 16),
                blurRadius: 1,
                offset: Offset(0, 2))
          ]*/
      ),
      child: TextFormField(
        controller: cont.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: 'Ingresar Email',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(18),
            prefixIcon: Icon(
              Icons.email,
              color: Color.fromRGBO(103, 114, 148, 16),
            ),
            hintStyle: TextStyle(
              height: 1,
              color: Color.fromRGBO(103, 114, 148, 16),
            )),
      ),
    );
  }

  Widget _password() {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 7, left: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color.fromRGBO(103, 114, 148, 16)),
      ),
      child: TextFormField(
        controller: cont.passwordController,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        decoration: const InputDecoration(
            hintText: 'Ingresar Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(18),
            prefixIcon: Icon(
              Icons.lock_outline,
              color: Color.fromRGBO(103, 114, 148, 16),
            ),
            hintStyle: TextStyle(
              height: 1,
            )),
      ),
    );
  }

  Widget _confiPassword() {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 7, left: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color.fromRGBO(103, 114, 148, 16)),
      ),
      child: TextFormField(
        controller: cont.confirmPasswordController,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        decoration: const InputDecoration(
            hintText: 'Confirmar Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(18),
            prefixIcon: Icon(
              Icons.lock,
              color: Color.fromRGBO(103, 114, 148, 16),
            ),
            hintStyle: TextStyle(
              height: 1,
            )),
      ),
    );
  }

  Widget _nextButton() {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      //onPrimary: Color.fromRGBO(103, 114, 148, 100),
      primary: GlobalColors.primaryColor,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 120, vertical: 18),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              style: raisedButtonStyle,
              //colocar esto despues de ubicar todo
              //onPressed: () => cont.register(),
              onPressed: () {
                Get.to(const RegisterPage2());
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
