import 'package:app/src/pages/login/login_page.dart';
import 'package:app/src/pages/profile/profileNurse_page.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundTemplate(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: GlobalColors.primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Bienvenido, Carlos Roque',
                          style: GoogleFonts.rubik(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/img/profile2.jpg'),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, right: 7, left: 7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: Color.fromRGBO(103, 114, 148, 16)),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      hintText: 'Buscar ....',
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
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Row con "Enfermeros Populares" y "Ver más"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Enfermeros Populares',
                  style: GoogleFonts.rubik(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Implementa la lógica para ver más aquí
                  },
                  child: Text(
                    'Ver más',
                    style: GoogleFonts.rubik(
                      color: GlobalColors.primaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Lista de tarjetas horizontales
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // Tarjeta 1
                _buildCard(
                  'Lucas Jazmin',
                  'Santa Anita',
                  'assets/img/enfermera.jpg',
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
                // Agrega más tarjetas según sea necesario
              ],
            ),
          ),
          // Añade el resto de tu contenido aquí
          SizedBox(
            height: 20,
          ),
          // Row con "Enfermeros Populares" y "Ver más"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nuevos enfermeros',
                  style: GoogleFonts.rubik(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Implementa la lógica para ver más aquí
                  },
                  child: Text(
                    'Ver más',
                    style: GoogleFonts.rubik(
                      color: GlobalColors.primaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // Tarjeta "Enfermeros Nuevos"
                _buildSmallCard(
                  'Lucas Jazmin',
                  '50',
                  'assets/img/enfermera.jpg', // Cambié la imagen a la circular
                ),
                _buildSmallCard(
                  'Lucas Jazmin',
                  '50',
                  'assets/img/enfermera.jpg', // Cambié la imagen a la circular
                ),
                _buildSmallCard(
                  'Lucas Jazmin',
                  '50',
                  'assets/img/enfermera.jpg', // Cambié la imagen a la circular
                ),
                _buildSmallCard(
                  'Lucas Jazmin',
                  '50',
                  'assets/img/enfermera.jpg', // Cambié la imagen a la circular
                ),
                // Agrega más tarjetas según sea necesario
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
      String title, String description, String imagePath, double rating) {
    return GestureDetector(
      onTap: () {
        Get.to(ProfileNursePage());
      },
      child: Container(
        margin: EdgeInsets.only(right: 15, left: 15),
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallCard(String title, String price, String imagePath) {
    return Container(
      margin: EdgeInsets.only(right: 15, left: 15),
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(imagePath),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.attach_money,
                      size: 16,
                      color: Colors.green,
                    ),
                    SizedBox(width: 4),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
