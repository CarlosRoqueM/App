import 'package:app/src/models/rol.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/pages/client/Search/searchPage.dart';
import 'package:app/src/pages/client/booking/detail/client_detail_booking_page.dart';
import 'package:app/src/pages/client/enfermeros/clientMain_controller.dart';
import 'package:app/src/pages/client/home/home_controller.dart';
import 'package:app/src/pages/client/enfermeros/detail/profileNurse_page.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeNursePage extends StatelessWidget {
  ClientMainController contMain = Get.put(ClientMainController());
  HomeController cont = Get.put(HomeController());
  //HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size h = MediaQuery.of(context).size;
    return Obx(() => DefaultTabController(
        length: cont.nurses.length,
        child: BackgroundTemplate(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: ListView(children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Home',
                                      style: GoogleFonts.poppins(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Bienvenido de nuevo',
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color:
                                            Color.fromRGBO(103, 114, 148, 16),
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Text(
                                      '${cont.user.value.name} ${cont.user.value.lastname1}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: GlobalColors.primaryColor,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ]),
                              //De momento este icono esta haciendo como boton de cerrar sesion.
                              GestureDetector(
                                child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        cont.user.value.image ?? '')),
                              ),
                            ]),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nuevas reservas',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Implementa la lógica para ver más aquí
                            contMain.setIndexToTwo();
                          },
                          child: Text(
                            'Ver más',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: GestureDetector(
                      onTap: () => {Get.to(ClientDetailBookingPage())},
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 15),
                        width: h.width * 1, // Set width to full screen width
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        //'${cont.nurses[index].name} ${cont.nurses[index].lastname1}',
                                        'Carlos Roque Mallhua',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        //cont.nurses[index].location ?? '',
                                        'Santa Anita',
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
                                      borderRadius: BorderRadius.circular(
                                          5), // Ajusta el valor según lo redondeado que desees
                                      color: Color.fromRGBO(43, 43, 43, 1),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.stop_rounded,
                                          color: Colors.greenAccent,
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
                  )
                ])))));
  }
}
