import 'package:app/src/pages/regisrterNurse/registerNurse_controller.dart';
import 'package:app/src/pages/register/splashRegister_page.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterNursePage2 extends StatelessWidget {
  RegisterNurseController cont = Get.put(RegisterNurseController());

  @override
  Widget build(BuildContext context) {
    Size h = MediaQuery.of(context).size;
    //final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return BackgroundTemplate(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: Container(
            padding: const EdgeInsets.all(8),
            height: 90,
            child: Column(
              children: [_nextButton(context)],
            )),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bottomBack(),
                Column(
                  children: [
                    _imageUser(context),
                    _dni(),
                    _nombre(),
                    _apellidoPaterno(),
                    _apellidoMaterno(),
                    _location(),
                    _phone(),
                    // Nuevos campos
                    _price(),
                    _experience(),
                    _description(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//Widgets_privados

  Widget _bottomBack() {
    return SafeArea(
      child: Row(children: [
        IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios)),
        Text(
          'Datos del Enfermero',
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          textAlign: TextAlign.right,
        ),
      ]),
    );
  }

  Widget _imageUser(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () {
            cont.showAlertdialog(context);
          },
          child: GetBuilder<RegisterNurseController>(
            builder: (value) => CircleAvatar(
              backgroundImage: cont.imageFile != null
                  ? FileImage(cont.imageFile!)
                  : AssetImage('assets/img/perfil2.png') as ImageProvider,
              radius: 70,
              backgroundColor: GlobalColors.primaryColor,
            ),
          ),
        ));
  }

  Widget _customTextField(
      {required TextEditingController controller,
      required String labelText,
      TextInputType keyboardType = TextInputType.text}) {
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

  Widget _customTextField2(
      {required TextEditingController controller,
      required String labelText,
      TextInputType keyboardType = TextInputType.text}) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
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

  Widget _dni() {
    return _customTextField(
      controller: cont.dniController,
      labelText: 'DN',
      keyboardType: TextInputType.number,
    );
  }

  Widget _nombre() {
    return _customTextField(
      controller: cont.nameController,
      labelText: 'Nombres',
      keyboardType: TextInputType.name,
    );
  }

  Widget _phone() {
    return _customTextField(
      controller: cont.phoneController,
      labelText: 'Celular',
      keyboardType: TextInputType.number,
    );
  }

  Widget _apellidoPaterno() {
    return _customTextField(
      controller: cont.lastname1Controller,
      labelText: 'Apellido Paterno',
      keyboardType: TextInputType.name,
    );
  }

  Widget _apellidoMaterno() {
    return _customTextField(
      controller: cont.lastname2Controller,
      labelText: 'Apellido Materno',
      keyboardType: TextInputType.name,
    );
  }

  Widget _location() {
    return _customTextField(
      controller: cont.locationController,
      labelText: 'Ubicación',
      keyboardType: TextInputType.streetAddress,
    );
  }

  Widget _description() {
    return Container(
      height: 150, // Ajusta esto a la altura que prefieras
      child: _customTextField(
        controller: cont.descriptionController,
        labelText: 'Descripción',
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget _price() {
    return _customTextField(
      controller: cont.priceController,
      labelText: 'Precio por hora',
      keyboardType: TextInputType.number,
    );
  }

  Widget _experience() {
    return _customTextField(
      controller: cont.experienceController,
      labelText: 'Experiencia (años)',
      keyboardType: TextInputType.number,
    );
  }

  Widget _nextButton(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: GlobalColors.primaryColor,
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
                    cont.finishRegistration2(context);
                  },
                  child: Container(
                    width: constraints.maxWidth * 1,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Aceptar',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ))
            ],
          ));
    });
  }
}
