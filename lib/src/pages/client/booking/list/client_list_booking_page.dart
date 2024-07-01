import 'package:app/src/pages/client/booking/detail/client_detail_booking_page.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientListBookingPage extends StatelessWidget {
  const ClientListBookingPage({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    Size h = MediaQuery.of(context).size;

    return BackgroundTemplate(
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
                child: ListView(children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: SingleChildScrollView(
                            scrollDirection: Axis
                                .vertical, // Set scroll direction to horizontal
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Tarjetas "Enfermeros Populares"
                                  GestureDetector(
                                    onTap: () =>
                                        {Get.to(ClientDetailBookingPage())},
                                    child: Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      width: h.width *
                                          1, // Set width to full screen width
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.transparent,
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      //'${cont.nurses[index].name} ${cont.nurses[index].lastname1}',
                                                      'Camila Rodriguez Ramirez',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      //cont.nurses[index].location ?? '',
                                                      'Santa Anita',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(6),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5), // Ajusta el valor según lo redondeado que desees
                                                    color: Color.fromRGBO(
                                                        43, 43, 43, 1),
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Icon(
                                                        Icons.stop_rounded,
                                                        color:
                                                            Colors.greenAccent,
                                                        size: 14,
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
                                  ),
                                ]))),
                  ]),
            ])),
          ],
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
          'Lista de reservas',
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          textAlign: TextAlign.right,
        ),
      ]),
    );
  }

  Widget _customTextField(
      { //required TextEditingController controller,
      required String hintText,
      TextInputType keyboardType = TextInputType.text,
      bool obscureText = false,
      bool enabled = true}) {
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
          //onChanged: cont.onChangeText,
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
      hintText: 'Detalle el apellido',
      keyboardType: TextInputType.emailAddress,
    );
  }
}
