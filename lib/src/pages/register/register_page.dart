import 'package:app/src/pages/register/register_controller.dart';
import 'package:app/src/pages/register/register_page2.dart';
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
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return BackgroundTemplate(
      child: Scaffold(
        resizeToAvoidBottomInset: false, 
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(8),
            height: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [_nextButton()],
            )),

          body: Container(
            padding: const EdgeInsets.all(8),
            child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _bottomBack(),
                    _tittle(),
                    _subtittle(),
                    //_googleButton(),
                    _email(),
                    _password(),
                    _confiPassword(),
                    _textforPassword(),
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

  Widget _textforPassword() {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Acepto las condiciones del servicio y la política de privacidad',
              style: GoogleFonts.poppins(
                  color: const Color.fromRGBO(103, 114, 148, 100),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
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
              'Únete a nosotros para empezar a buscar enfermeros especializado',
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 25,
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
              'Podrás buscar enfermeros y solicitar sus servicios de enfermería.',
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

  Widget _email() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Container(
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
      ),
    );
  }

  Widget _password() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Container(
        //margin: const EdgeInsets.only(top: 20, right: 7, left: 7),
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
      ),
    );
  }

  Widget _confiPassword() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Container(
        //margin: const EdgeInsets.only(top: 20, right: 7, left: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color.fromRGBO(103, 114, 148, 16)),
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
      ),
    );
  }

  Widget _nextButton() {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      //onPrimary: Color.fromRGBO(103, 114, 148, 100),
      backgroundColor: GlobalColors.primaryColor,
      minimumSize: Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 18),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
    return Container(
      //padding: const EdgeInsets.all(8),
      child: Column(
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