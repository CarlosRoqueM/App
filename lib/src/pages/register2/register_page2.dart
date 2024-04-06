import 'package:app/src/pages/register3/register_page3.dart';
import 'package:app/src/pages/splash/splashRegister_page.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage2 extends StatelessWidget {
  const RegisterPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return BackgroundTemplate(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
          height: 95,
          child: Column(
            children: [_nextButton()],
          )),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 39, 16, 10),
          child: Column(
            children: [
              _bottomBack(),
              Row(
                children: [
                  _dni(),
                  SizedBox(
                    width: 0.5,
                  ),
                  _findButton()
                ],
              ),
              Column(
                children: [
                  _nombre(),
                  _apellidoPaterno(),
                  _apellidoMaterno(),
                  _location(),
                  _map(),
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
          'Detalle sus Datos Personales',
          style: GoogleFonts.rubik(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          textAlign: TextAlign.right,
        ),
      ])),
    );
  }

  Widget _dni() {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 7, left: 5),
      width: 200, // Ajusta el ancho del contenedor según sea necesario
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
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            hintText: 'DNI',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(18),
            prefixIcon: Icon(
              Icons.person,
              color: Color.fromRGBO(103, 114, 148, 16),
            ),
            hintStyle: TextStyle(
              height: 1,
              color: Color.fromRGBO(103, 114, 148, 16),
            )),
      ),
    );
  }

  Widget _nombre() {
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
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
            hintText: 'Nombres',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(18),
            prefixIcon: Icon(
              Icons.person,
              color: Color.fromRGBO(103, 114, 148, 16),
            ),
            hintStyle: TextStyle(
              height: 1,
              color: Color.fromRGBO(103, 114, 148, 16),
            )),
      ),
    );
  }

  Widget _apellidoPaterno() {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 7, left: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color.fromRGBO(103, 114, 148, 16)),
      ),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        decoration: const InputDecoration(
            hintText: 'Apellido Paterno',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(18),
            prefixIcon: Icon(
              Icons.person_4,
              color: Color.fromRGBO(103, 114, 148, 16),
            ),
            hintStyle: TextStyle(
              height: 1,
            )),
      ),
    );
  }

  Widget _apellidoMaterno() {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 7, left: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color.fromRGBO(103, 114, 148, 16)),
      ),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        decoration: const InputDecoration(
            hintText: 'Apellido Materno',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(18),
            prefixIcon: Icon(
              Icons.person_2_rounded,
              color: Color.fromRGBO(103, 114, 148, 16),
            ),
            hintStyle: TextStyle(
              height: 1,
            )),
      ),
    );
  }

  Widget _location() {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 7, left: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color.fromRGBO(103, 114, 148, 16)),
      ),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        decoration: const InputDecoration(
            hintText: 'Ubicación',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(18),
            prefixIcon: Icon(
              Icons.location_on,
              color: Color.fromRGBO(103, 114, 148, 16),
            ),
            hintStyle: TextStyle(
              height: 1,
            )),
      ),
    );
  }

  Widget _map() {
    return Container(
      margin: const EdgeInsets.only(),
      child: Image.asset(
        'assets/img/map.png',
        //width: 400,
        //height: 150,
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
      margin: const EdgeInsets.only(top: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                Get.to(const SplashRegisterPage());
              },
              child: Text(
                'Aceptar',
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

  Widget _findButton() {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      //onPrimary: Color.fromRGBO(103, 114, 148, 100),
      primary: GlobalColors.primaryColor,
      minimumSize: Size(88, 36),

      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 7, left: 7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {},
              child: Text(
                'Buscar',
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
