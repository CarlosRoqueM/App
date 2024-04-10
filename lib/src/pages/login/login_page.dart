import 'package:app/src/Screen/main_screen.dart';
import 'package:app/src/pages/home/home_page.dart';
import 'package:app/src/pages/login/login_controller.dart';
import 'package:app/src/pages/splash/splash_page.dart';
import 'package:app/src/widgets/text_form_global.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatelessWidget {
  LoginController cont = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return BackgroundTemplate(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
          height: 70,
          child: Column(
            children: [_textdontAccount()],
          )),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Column(
                children: [
                  _tittle(),
                  _subtittle(),
                  _googleButton(),
                  _email(),
                  _password(),
                  _loginbutton(),
                  _textforPassword()
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  //Widgets_privados

  Widget _textdontAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'No tienes una cuenta?',
          style: TextStyle(
              color: GlobalColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.normal),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () => cont.gotoRegisterPage(),
          child: Text(
            'Registrate',
            style: TextStyle(
                color: GlobalColors.secondColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _textforPassword() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 5),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'Olvidaste tu contraseña',
              style: GoogleFonts.rubik(
                  color: GlobalColors.primaryColor,
                  fontSize: 15,
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
              'Bienvenido',
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
    return Container(
      margin: const EdgeInsets.all(20), // Puedes comentar o eliminar esta línea
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Puedes buscar enfermeros y solicitar sus servicios de enfermería.',
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
      padding: EdgeInsets.symmetric(horizontal: 120, vertical: 18),
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
              Icons.lock,
              color: Color.fromRGBO(103, 114, 148, 16),
            ),
            hintStyle: TextStyle(
              height: 1,
            )),
      ),
    );
  }

  Widget _loginbutton() {
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
                Get.to(MainScreen());
              },
              child: Text(
                'Ingresar',
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
}
