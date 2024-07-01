import 'package:app/src/pages/client/address/map/client_address_map_page.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientDetailBookingPage extends StatelessWidget {
  const ClientDetailBookingPage({super.key});

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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/img/EnfermeraTest.png'),
                          radius: 50,
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                              'Camila Rodriguez Ramirez',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Santa Clara',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/img/abuelo.jpeg'),
                          radius: 50,
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                              'Tomas Rodriguez Leon',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '50 años',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _date(),
                        _time(),
                        _hours(),
                        _check(),
                        GestureDetector(
                          onTap: () => {Get.to(ClientAddressMapPage())},
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(240, 240, 240, 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextFormField(
                                obscureText: false,
                                cursorColor: GlobalColors.primaryColor,
                                decoration: InputDecoration(
                                  labelText: 'Direccion',
                                  enabled: false,
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(10),
                                  labelStyle: const TextStyle(
                                    color: Color.fromRGBO(2, 81, 89, 1),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.directions,
                                  ), // Usa el icono aquí
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]),
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
          'Detalle de la reserva',
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          textAlign: TextAlign.right,
        ),
      ]),
    );
  }

  Widget _customTextField2({
    required String labelText,
    bool obscureText = false,
    bool enabled = false,
    IconData? icon, // Agrega este parámetro
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          obscureText: obscureText,
          cursorColor: GlobalColors.primaryColor,
          decoration: InputDecoration(
            labelText: labelText,
            enabled: enabled,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10),
            labelStyle: const TextStyle(
              color: Color.fromRGBO(2, 81, 89, 1),
            ),
            prefixIcon: icon != null ? Icon(icon) : null, // Usa el icono aquí
          ),
        ),
      ),
    );
  }

  Widget _date() {
    return _customTextField2(
      labelText: '2024-06-06',
      icon: Icons.date_range,
    );
  }

  Widget _time() {
    return _customTextField2(
      labelText: '08:00 AM',
      icon: Icons.av_timer_sharp,
    );
  }

  Widget _hours() {
    return _customTextField2(
      labelText: '5 horas',
      icon: Icons.timer,
    );
  }

  Widget _check() {
    return _customTextField2(
      labelText: 'Yape',
      icon: Icons.monetization_on,
    );
  }
}
