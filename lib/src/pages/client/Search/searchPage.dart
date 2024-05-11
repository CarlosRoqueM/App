import 'dart:math';

import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  SearchController controller = Get.put(SearchController());
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundTemplate(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  _bottomBack(),
                  Column(
                    children: [
                      _search(),
                    ],
                  ),
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
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios)),
        Text(
          'Busca enfermeros',
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          textAlign: TextAlign.right,
        ),
      ]),
    );
  }


  Widget _customTextField({//required TextEditingController controller, 
  required String hintText, TextInputType keyboardType = TextInputType.text, bool obscureText = false, bool enabled = true}) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: GestureDetector(
          onTap: () => {

          },
          child: TextFormField(
            autofocus: false,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                hintText: hintText,
                enabled: enabled,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(18),
                prefixIcon: Icon(
                Icons.search,
                color: Color.fromRGBO(103, 114, 148, 16),
                ),
                hintStyle: TextStyle(                    
                  height: 1,
              ),
            ),
          ),
        ),
      )
    );
  }

  Widget _search() {
    return _customTextField(
      //controller: cont.emailController,
      hintText: 'Detalle el apellido del enfermero',
      keyboardType: TextInputType.emailAddress,
    );
  }
}