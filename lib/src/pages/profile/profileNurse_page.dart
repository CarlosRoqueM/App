import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileNursePage extends StatelessWidget {
  const ProfileNursePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return BackgroundTemplate(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipPath(
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.7),
                          BlendMode.darken,
                        ),
                        child: Image.asset(
                          'assets/img/enfermera.jpg',
                          height: h / 3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: -35,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/img/enfermera.jpg'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(
                    'Jazmin Lucas Marmol',
                    Icons.verified, // Icono de verificación
                  ),
                  _buildInfoRow2(
                    'Santa Anita, Lima',
                    Icons.location_on_outlined, // Icono de ubicación
                  ),
                  _buildInfoRow2(
                    '+51 986 253 709',
                    Icons.phone, // Icono de teléfono
                    price: '\$30/h', // Precio
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Descripción',
                  style: GoogleFonts.rubik(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Me llamo Jazmín Lucas Mármol y, como enfermera comprometida, mi trayectoria se ha forjado en la dedicación al cuidado de la salud. Con una sólida formación y experiencia en el campo, me enorgullece ofrecer atención de calidad a mis pacientes, brindando un toque de compasión que va más allá de la medicina.',
                  style: GoogleFonts.rubik(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Principales Skills',
                  style: GoogleFonts.rubik(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  '1.   Patient care should be the number one priority.',
                  style: GoogleFonts.rubik(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  '2.   If you run your practiceyou know how frustrating.',
                  style: GoogleFonts.rubik(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  '3.   That’s why some of appointment reminder system.',
                  style: GoogleFonts.rubik(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Localización',
                  style: GoogleFonts.rubik(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // Añadir imagen centrada
              Center(
                child: Image.asset(
                  'assets/img/map.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String text, IconData icon, {String? price}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                icon,
                color: Colors.black, // Color del icono
              ),
            ],
          ),
          if (price != null)
            Row(
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green, // Color del precio
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildInfoRow2(String text, IconData icon, {String? price}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                // Color del icono
              ),
              SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          if (price != null)
            Row(
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green, // Color del precio
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
