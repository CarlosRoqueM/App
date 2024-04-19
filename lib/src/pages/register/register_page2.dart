
import 'package:app/src/pages/splash/splashRegister_page.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage2 extends StatelessWidget {
  const RegisterPage2({super.key});

  @override
  Widget build(BuildContext context) {
    //final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return BackgroundTemplate(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      //resizeToAvoidBottomInset: false, 
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8),
          height: 95,
          child: Column(
            children: [_nextButton()],
          )),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bottomBack(),
              /*Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _dni(),
                 // _findButton()
                ],
              ),*/
              Column(
                children: [
                  _dni(),
                  _nombre(),
                  _apellidoPaterno(),
                  _apellidoMaterno(),
                  _location(),
                ],
              )
            ],
          ),
        ),
    ),
  );
  }

  //Widgets_privados

  Widget _bottomBack() {
    return SafeArea(
        child: Row(
          children: [
        IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios)),
        Text(
          'Detalle sus Datos Personales',
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          textAlign: TextAlign.right,
        ),
      ]),
    );
  }

  Widget _dni() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Container(
        //width: 250, // Ajusta el ancho del contenedor según sea necesario
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color.fromRGBO(103, 114, 148, 16),
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
      ),
    );
  }

  Widget _nombre() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Container(
        
        //margin: const EdgeInsets.only(top: 20, right: 7, left: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color.fromRGBO(103, 114, 148, 16),
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
      ),
    );
  }

  Widget _apellidoPaterno() {
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
      ),
    );
  }

  Widget _apellidoMaterno() {
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
      ),
    );
  }

  Widget _location() {
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
      ),
    );
  }

  Widget _nextButton() {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      //onPrimary: Color.fromRGBO(103, 114, 148, 100),
      backgroundColor: GlobalColors.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 18),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              style: raisedButtonStyle,
              //colocar esto despues de ubicar todo
              //onPressed: () => cont.register(),
              onPressed: () {
                Get.to(const SplashRegisterPage());
              },
              child: Text(
                'Aceptar',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              )
            )
        ],
    );
  }
}

