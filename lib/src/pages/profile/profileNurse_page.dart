import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileNursePage extends StatelessWidget {
  const ProfileNursePage({Key? key});

  @override
  Widget build(BuildContext context) {
    Size h = MediaQuery.of(context).size;
    return BackgroundTemplate(
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
                      _buildInfoRow2('40', '4', Icons.monetization_on),
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
               Column(
                 children: [
                   //Aqui estaria el icono de retroceso y el icono de verificacion
                 ],
               )                
             ],
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

  Widget _buildInfoRow2(String text, String text2, IconData icon, {String? price}) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                // Color del icono
              ),
              Text(
                text +'/hr',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                
              ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8), // Añade un pequeño espacio horizontal
                height: 20,
                //padding: const EdgeInsets.only(top: 2, bottom: 2),
                child: const VerticalDivider(
                  thickness: 2,
                  color: Colors.black,
                ),
              ),
              Text(
                text2 +'/hr',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                
              ),),
            ],
          ),
        ]),
    );
  }
}
