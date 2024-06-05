import 'dart:ffi';

import 'package:app/src/models/address.dart';
import 'package:app/src/models/profile.dart';
import 'package:app/src/pages/client/address/create/client_address_create_page.dart';
import 'package:app/src/pages/client/address/list/client_address_list_controller.dart';
import 'package:app/src/pages/client/profiles/create/client_profiles_create_controller.dart';
import 'package:app/src/pages/client/profiles/list/client_profiles_list_controller.dart';
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

class ClientProfilesListPage extends StatelessWidget {
  ClientProfilesListController cont = Get.put(ClientProfilesListController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientProfilesListController> ( builder: (value) => BackgroundTemplate(
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
      future: cont.getProfiles(),
      builder: (context, AsyncSnapshot<List<Profile>> snapshot) {
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

  Widget _radioSelectorAddress(Profile profile, int index) {
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
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(profile.image ?? ''),
                      radius: 40,
                      ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (profile.name ?? '') + (' ') + (profile.lastname1 ?? '') + (' ') + (profile.lastname2 ?? ''),
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        (profile.age ?? '') + ' años',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
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
              'Perfiles de pacientes',
              style: GoogleFonts.poppins(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
                  ]),
            IconButton(
                onPressed: () => cont.goToProfilesCreatePage(), icon: const Icon(Icons.add), iconSize: 30,),
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
              'Elige un perfil de paciente que deseas que sea atendido por el enfermero',
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
              'Recuerda que puedes agregar más perfiles de pacientes en tu perfil',
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
                  cont.goToBookingpage();
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