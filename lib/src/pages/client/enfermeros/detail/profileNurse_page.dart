import 'package:app/src/models/user.dart';
import 'package:app/src/pages/client/address/list/client_address_list_page.dart';
import 'package:app/src/pages/client/enfermeros/clientMain_controller.dart';
import 'package:app/src/pages/client/enfermeros/detail/profileNurse_controller.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileNursePage extends StatelessWidget {
  User? user;

  ProfileNurseController controller = Get.put(ProfileNurseController());

  ProfileNursePage({@required this.user});

  @override
  Widget build(BuildContext context) {
    Size h = MediaQuery.of(context).size;
    return BackgroundTemplate(
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              user!.image != null
                  ? Image.network(
                      user!.image!,
                      height: h.height * 0.36,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/img/enfermera.jpg',
                      height: h.height * 0.44,
                      fit: BoxFit.cover,
                    ),
              Container(
                child: Column(children: [
                  _buildInfoRow(),
                  _buildInfoRow2('12', Icons.star, price: 'S/. 50.00'),
                  Container(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child: const Divider(
                      color: Color.fromRGBO(103, 114, 148, 16),
                    ),
                  ),
                  _buildInfoRow3('5 años', year: '25'),
                  _buildInfoRow4(),
                  // _nextButton(), // Mover el botón fuera del Column
                ]),
                height: MediaQuery.of(context).size.height * 0.6,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.32),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
              Positioned(
                // Nuevo Positioned widget para el botón
                bottom: 0,
                left: 0,
                right: 0,
                child: _nextButton(),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        color: Colors.white,
                        iconSize: 30,
                        icon: Icon(Icons.close_rounded),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Verificado',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              color: Colors.white,
                              iconSize: 22,
                              icon: Icon(Icons.verified),
                              onPressed: () {
                                // Acción al presionar el botón de retroceso
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _CardDetail(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );
  }

  Widget _buildInfoRow() {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${user?.name} ${user?.lastname1}',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Alinea el texto al centro
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ), // Espacio entre el nombre y la localización
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on,
                  color: Colors.grey), // Icono de localización
              SizedBox(width: 5), // Espacio entre el icono y el texto
              Text(
                '${user?.location}', // Reemplaza esto con la localización real
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow2(String text, IconData icon, {String? price}) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 45, // Agrega esto
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Precio por hora',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text('${user?.price ?? 'N/A'}'),
                ],
              ),
            ),
            VerticalDivider(color: Colors.grey),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Ranking',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(icon),
                ],
              ),
            ),
            VerticalDivider(color: Colors.grey),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Reservas',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(text),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow3(String text, {String? year}) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
          top: 6,
          right: 12,
          left: 12,
          bottom: 6), // Change alignment to top left
      child: Container(
        height: 50,
        child: Row(
          children: [
            Container(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  Text(
                    'Edad',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '${user?.age ?? 'N/A años'}',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20), // Add space between the two containers
            Container(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  Text(
                    'Experiencia',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '${user?.experience ?? 'N/A'} años',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow4() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
          top: 6,
          right: 12,
          left: 12,
          bottom: 6), // Change alignment to top left
      child: Text(
        '${user?.description ?? 'N/A'}',
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _nextButton() {
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
                    //cont.finishRegistration(context);
                    controller.goToAddressListPage();
                  },
                  child: Container(
                    height: 60,
                    width: constraints.maxWidth * 1,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Reservar cita',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  ))
            ],
          ));
    });
  }
}
