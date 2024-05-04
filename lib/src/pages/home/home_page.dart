import 'package:app/src/pages/home/home_controller.dart';
import 'package:app/src/pages/login/login_page.dart';
import 'package:app/src/pages/profile/profileNurse_page.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/src/widgets/BackgroundtemplateOn.dart';
import 'package:app/utils/global_color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomeController cont = Get.put(HomeController());
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundTemplate(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              'Busca enfermeros',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Color.fromRGBO(103, 114, 148, 16),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ]),
                      //De momento este icono esta haciendo como boton de cerrar sesion.
                      GestureDetector(
                        onTap: () {
                          cont.logout();
                        },
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/img/profile2.jpg'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(240, 240, 240, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      autofocus: false,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: 'Tu ubicación ....',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(18),
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: Color.fromRGBO(103, 114, 148, 16),
                        ),
                        hintStyle: TextStyle(
                          height: 1,
                        ),
                      ),
                    ),
                  ),
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
                    'Enfermeros Populares',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Implementa la lógica para ver más aquí
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
            // Lista de tarjetas horizontales
            Container(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tarjeta 1
                    _buildCard(
                      'Lucas Jazmin',
                      'Santa Anita',
                      'assets/img/profile2.jpg',
                      4.5,
                    ),
                    // Tarjeta 2
                    _buildCard(
                      'Lucas Jazmin',
                      'Santa Anita',
                      'assets/img/enfermera.jpg',
                      4.5,
                    ),
                    // Tarjeta 3
                    _buildCard(
                      'Lucas Jazmin',
                      'Santa Anita',
                      'assets/img/enfermera.jpg',
                      4.5,
                    ),
                    _buildCard(
                      'Lucas Jazmin',
                      'Santa Anita',
                      'assets/img/profile.jpeg',
                      4.5,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 12, left: 12),
              child: const Divider(
                //thickness: 10,
                color: Color.fromRGBO(103, 114, 148, 16),
              ),
            ),
            // Row con "Enfermeros Populares" y "Ver más"
            Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nuevos enfermeros',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Implementa la lógica para ver más aquí
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
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tarjeta "Enfermeros Nuevos"
                    _buildSmallCard(
                      'Lucas Jazmin',
                      'Santa Anita',
                      'assets/img/profile2.jpg',
                      4.5,
                    ),
                    _buildSmallCard(
                      'Lucas Jazmin',
                      'Santa Anita',
                      'assets/img/enfermera.jpg',
                      4.5,
                    ),
                    _buildSmallCard(
                      'Lucas Jazmin',
                      'Santa Anita',
                      'assets/img/profile.jpeg',
                      15,
                    ),
                    // Agrega más tarjetas según sea necesario
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      String title, String description, String imagePath, double price) {
    return GestureDetector(
      onTap: () {
        Get.to(ProfileNursePage());
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        width: 200,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        description,
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
                      color: Colors.black,
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
                          price.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: const Color.fromRGBO(
                                252, 252, 252, 1), // Color del texto
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
    );
  }

  Widget _buildSmallCard(
      String title, String description, String imagePath, double rating) {
    return GestureDetector(
      onTap: () {
        Get.to(ProfileNursePage());
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        width: 200,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        description,
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
                      color: Colors.black,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.attach_money_rounded,
                          color: Color.fromRGBO(252, 252, 252, 1),
                          size: 14,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          rating.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: const Color.fromRGBO(
                                252, 252, 252, 1), // Color del texto
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
    );
  }
}
