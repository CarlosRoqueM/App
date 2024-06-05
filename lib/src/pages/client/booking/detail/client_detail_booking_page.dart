import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientDetailBookingPage extends StatelessWidget {
  const ClientDetailBookingPage({super.key});

  @override
  Widget build(BuildContext context,) {
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
                          
                        ],
        ),
        ]),
    ),
  );                                  

  } 

  //Widgets_privados

  Widget _bottomBack() {
    return SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            'Detalle de la reserva',
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
          ),
        )
      );
  }
}