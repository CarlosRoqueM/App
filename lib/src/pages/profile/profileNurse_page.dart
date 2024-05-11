import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileNursePage extends StatelessWidget {
  const ProfileNursePage({Key? key});

  @override
  Widget build(BuildContext context) {
    Size h = MediaQuery.of(context).size;
    return BackgroundTemplate(
        child: SafeArea(
          child: Scaffold(
            body: Stack(
                children: [
                  Image.asset(
                  'assets/img/enfermera.jpg',
                  height: h.height * 0.44,
                  fit: BoxFit.cover,
                  ),
                  Container(
                    child: Column(
                      children: [
                        _buildInfoRow('Lucas Jazmin'),
                        _buildInfoRow2( '12', Icons.star, price: 'S/. 50.00'),
                        Container(
                        padding: const EdgeInsets.only(right: 12, left: 12),
                        child: const Divider(
                          color: Color.fromRGBO(103, 114, 148, 16),
                        ),
                      ),
                        
                ]),
                    
                    height: MediaQuery.of(context).size.height * 0.6,
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),      
                  ),
                  
                ),
                 Container(
                  padding: const EdgeInsets.all(20),
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
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Verificado', 
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),),
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

  Widget _CardDetail(BuildContext context){
    return Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                ),

      );
  }

  Widget _buildInfoRow(String text) {
  return SafeArea(
    child: Container(
      padding: const EdgeInsets.all(12),
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Alinea el texto al centro
            ),
        ],
      ),
    ),
  );
}

Widget _buildInfoRow2(String text, IconData icon, {String? price}) {
  return Container(
    padding: const EdgeInsets.all(12),
    child: Container(
      height: 50,  // Agrega esto
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text('Precio'),
                Text(price ?? 'N/A'),
              ],
            ),
          ),
          VerticalDivider(color: Colors.grey),
          Expanded(
            child: Column(
              children: [
                Text('Ranking'),
                Icon(icon),
              ],
            ),
          ),
          VerticalDivider(color: Colors.grey),
          Expanded(
            child: Column(
              children: [
                Text('Reservas'),
                Text(text),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}
