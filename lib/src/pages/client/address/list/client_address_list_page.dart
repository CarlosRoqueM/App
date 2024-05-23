import 'dart:ffi';

import 'package:app/src/models/address.dart';
import 'package:app/src/pages/client/address/create/client_address_create_page.dart';
import 'package:app/src/pages/client/address/list/client_address_list_controller.dart';
import 'package:app/src/pages/register/register_controller.dart';
import 'package:app/src/pages/register/register_page2.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientAddressListPage extends StatelessWidget {
  ClientAddressListController cont = Get.put(ClientAddressListController());
  final ValueNotifier<bool> _termsAccepted = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientAddressListController> ( builder: (value) => BackgroundTemplate(
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

          body:  Container(
            padding: const EdgeInsets.all(8),
            child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _bottomBack(),
                    _tittle(),
                    _subtittle(),
                    _listAddress(context),
                  ],
                )
            ),
          ),
      ),
    );
  }

  //Widgets_privados

  Widget _listAddress(BuildContext context) {
    return FutureBuilder(
      future: cont.getAddress(),
      builder: (context, AsyncSnapshot<List<Address>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return Expanded( 
              child: ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                padding: EdgeInsets.all(8),
                itemBuilder: (_, index) {
                  return _radioSelectorAddress(snapshot.data![index], index);
                },
              ),
            );
          } else {
            return Center(
              child: Text(
                'No hay direcciones registradas 2',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }
        } else {
          return Center(
            child: Text(
              'No hay direcciones registradas',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }
      },
    );
  }

  Widget _radioSelectorAddress(Address address, int index) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Radio(
                value: index,
                groupValue: cont.radioValue.value,
                onChanged: cont.handleRadioValueChange,
              ),
              Column(
                children: [
                  Text(
                    address.address ?? '',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    address.neighborhood ?? '',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  Widget _bottomBack() {
    return SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
            IconButton(
                onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios), iconSize: 25,),
            Text(
              'Direcciones',
              style: GoogleFonts.poppins(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
                  ]),
            IconButton(
                onPressed: () => cont.goToAddressCreatePage(), icon: const Icon(Icons.add), iconSize: 30,),
          ],
        ),
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
              'Elige tu dirección donde recibirás el servicio de enfermería',
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
              'Recuerda que puedes agregar más direcciones en tu perfil',
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

  

  Widget _nextButton() {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      //onPrimary: Color.fromRGBO(103, 114, 148, 100),
      backgroundColor: GlobalColors.primaryColor,
      //minimumSize: const Size(88, 36),
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
                  //cont.gotoRegisterPage2();
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