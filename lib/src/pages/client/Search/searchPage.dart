import 'dart:math';

import 'package:app/src/pages/client/home/home_controller.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  SearchController conta = Get.put(SearchController());
  HomeController cont = Get.put(HomeController());
  SearchPage({super.key});

  @override
  Widget build(BuildContext context,) {
    Size h = MediaQuery.of(context).size;
    return Obx(() =>  DefaultTabController(
      length: cont.nurses.length,
      child: BackgroundTemplate(
        
        child: Scaffold(
        resizeToAvoidBottomInset: false, 
        backgroundColor: Colors.transparent,

        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bottomBack(),
              _search(),
              Expanded(
                child: ListView( 
                  children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() => Container(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical, // Set scroll direction to horizontal
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List<Widget>.generate(cont.nurses.length,  (index) {
                                  // Tarjetas "Enfermeros Populares"
                                  return Obx(() =>  GestureDetector(
                                    onTap: () {
                                      cont.openBottomShead(context, cont.nurses[index]);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(bottom: 15),
                                      width: h.width * 1, // Set width to full screen width
                                      decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: Image.network(
                                              cont.nurses[index].image ?? '',
                                              height: 180,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children:[ 
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${cont.nurses[index].name} ${cont.nurses[index].lastname1}',
                                                      style: GoogleFonts.poppins(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      cont.nurses[index].location ?? '',
                                                      style: GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.all(6),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5), // Ajusta el valor según lo redondeado que desees
                                                    color: Color.fromRGBO(43, 43, 43, 1),
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      const Icon(
                                                        Icons.star,
                                                        color: Color.fromRGBO(252, 252, 252, 1),
                                                        size: 14,
                                                      ),
                                                      const SizedBox(
                                                        width: 3,
                                                      ),
                                                      Text(
                                                        '4.5',
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.normal,
                                                          color: Color.fromRGBO(252, 252, 252, 1), // Color del texto
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                );
                                }).toList(),
                              ),
                            ),
                          )),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        )
        ),
      ),
    );
  } 

  //Widgets_privados

  Widget _bottomBack() {
    return SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            'Busca enfermeros',
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
          ),
        )
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
          child: TextFormField(
            controller: TextEditingController(),
            autofocus: false,
            keyboardType: TextInputType.name,
            onChanged: cont.onChangeText,
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