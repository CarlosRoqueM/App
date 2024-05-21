import 'package:app/src/pages/client/address/create/client_address_create_controller.dart';
import 'package:app/src/pages/register/register_controller.dart';
import 'package:app/src/pages/register/register_page2.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientAddressCreatePage extends StatelessWidget {
  ClientAddressCreateController cont = Get.put(ClientAddressCreateController());
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
            child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _bottomBack(),
                    _tittle(),
                    _address(),
                    _neighborhood(),
                    _PointReference(context),

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
              children: [
            IconButton(
                onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios), iconSize: 25,),
            Text(
              'Nueva Dirección',
              style: GoogleFonts.poppins(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
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
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: Icon(
          Icons.location_on,
          color: Colors.red,
          size: 120,
        ),
    );
  }



  Widget _customTextField({required TextEditingController controller, required String labelText, TextInputType keyboardType = TextInputType.text, bool autofocus = true, FocusNode? FocusNode, OnTap? onTap, bool enabled = false}) {
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

  Widget _address(){
    return _customTextField(
      controller: cont.addressController, 
      labelText: 'Dirección',
      keyboardType: TextInputType.streetAddress,);
  }

  Widget _neighborhood(){
    return _customTextField(
      controller: cont.neighborHoodController, 
      labelText: 'Barrio',
      keyboardType: TextInputType.streetAddress,);
  }

  Widget _PointReference(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          onTap: () => cont.openGoogleMaps(context),
          controller: cont.refPointController,
          keyboardType: TextInputType.streetAddress,
          autofocus: false,
          focusNode: AlwaysDisabledFocusNode(),
          cursorColor: GlobalColors.primaryColor,
          decoration: InputDecoration(
            labelText: 'Punto de referencia',
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
                  cont.createAddress();
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
        ),
      );
  });
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}