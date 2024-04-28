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
          padding: const EdgeInsets.all(8),
          height: 70,
          child: Column(
            children: [_textdontAccount()],
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
                  _loginbutton(),
                  _textforPassword()
                ],
            )
          ),
        ),
      );
  }

  //Widgets_privados

  Widget _bottomBack() {
    return SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          IconButton(
              onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios)),
        ]),
    );
  }

  Widget _textdontAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'No tienes una cuenta?',
          style: GoogleFonts.poppins(
              color: GlobalColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.normal),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => cont.gotoRegisterPage(),
          child: Text(
            'Registrate',
            style: GoogleFonts.poppins(
                color: GlobalColors.secondColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _textforPassword() {
    return Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'Olvidaste tu contraseña?',
              style: GoogleFonts.poppins(
                  color: GlobalColors.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
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
              'Bienvenido',
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
              
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
            'Puedes buscar enfermeros y solicitar sus servicios de enfermería.',
            style: GoogleFonts.poppins(
              color: Color.fromRGBO(103, 114, 148, 100),
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

  Widget _customTextField({required TextEditingController controller, required String labelText, TextInputType keyboardType = TextInputType.text, bool obscureText = false}) {
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
    );
  }

  Widget _password() {
    return _customTextField(
      controller: cont.passwordController,
      labelText: 'Contraseña',
      obscureText: true,
    );
  }


  Widget _loginbutton() {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: GlobalColors.primaryColor,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 145, vertical: 18),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              style: raisedButtonStyle,
              //onPressed: () => cont.login(), (para cuandose obtenga la coneccion )
              onPressed: () => {
                cont.login(),
              },
              child: Text(
                'Ingresar',
                style: GoogleFonts.poppins(
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
