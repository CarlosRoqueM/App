import 'package:app/src/models/user.dart';
import 'package:app/src/pages/client/booking/client_splash_bookig_page.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ClientBookingPage extends StatelessWidget {
  User? user;
  ClientBookingPage({this.user});

  @override
  Widget build(BuildContext context) {
    return BackgroundTemplate(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Container(
            padding: const EdgeInsets.all(8),
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [_nextButton()],
            )),
        body: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bottomBack(),
                _tittle(),
                _subtittle(),
                _customCurrentDate(context),
                _customCurrentTime(context),
                _customHoursField(context),     
                _paymentMethodDropdown(),           

              ],
            )),
      ),
    );
  }

  //Widgets_privados

  Widget _bottomBack() {
    return SafeArea(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios)),
      ]),
    );
  }



  Widget _tittle() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Coloca los datos para tu reserva',
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _subtittle() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Recuerda reservar con anticipación. Y no el mismo día de la cita',
            style: GoogleFonts.poppins(
              color: const Color.fromRGBO(103, 114, 148, 100),
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  


  Widget _customCurrentTime(BuildContext context) {
    TextEditingController timePicker = TextEditingController();
    

    return Container(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          controller: timePicker,
          cursorColor: GlobalColors.primaryColor,
          decoration: InputDecoration(
            labelText: 'Hora de la cita',
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10),
            labelStyle: const TextStyle(
              color: Color.fromRGBO(2, 81, 89, 1),
            ),
          ),
          onTap: () async {
              var time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (time != null) {
                timePicker.text = time.format(context);
              }
          }
        ),
      ),
    );
  }

  Widget _customCurrentDate(BuildContext context) {
    TextEditingController datePicker = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          controller: datePicker, // Add controller to access the selected date
          cursorColor: GlobalColors.primaryColor,
          decoration: InputDecoration(
            labelText: 'Día de la cita',
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10),
            labelStyle: const TextStyle(
              color: Color.fromRGBO(2, 81, 89, 1),
            ),
          ),
          onTap: () async {
            DateTime? dateTime = await showDatePicker(
              context: context, 
              initialDate: DateTime.now(),
              firstDate: DateTime(2000), 
              lastDate: DateTime(2025),
            );
            if (dateTime != null) {
              String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
              datePicker.text = formattedDate;
            }
          },
        ),
      ),
    );
  }

  Widget _customHoursField(BuildContext context) {
    TextEditingController hoursController = TextEditingController();
    return GestureDetector(
      onTap: () async {
        Duration? duration = await showDurationPicker(
          context: context,
          initialTime: Duration(hours: 1),
        );
        // Remove the condition check for duration being not null
          if (duration != null) {
            hoursController.text = duration.inHours.toString();
          }
        },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(240, 240, 240, 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            controller: hoursController,
            cursorColor: GlobalColors.primaryColor,
            enabled: false, // Disable text input
            decoration: InputDecoration(
              labelText: 'Número de horas',
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(10),
              labelStyle: const TextStyle(
                color: Color.fromRGBO(2, 81, 89, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _paymentMethodDropdown() {
    List<String> paymentMethods = ['Yape', 'Plin', 'Pago Efectivo', 'Tarjeta'];
    String? selectedMethod;
  
    return Container(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(10), // Add padding to the inner container
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<String>(
              hint: Text('Selecciona un método de pago'),
              value: selectedMethod,
              items: paymentMethods.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                
                  selectedMethod = newValue;
                
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _nextButton() {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      //onPrimary: Color.fromRGBO(103, 114, 148, 100),
      backgroundColor: GlobalColors.primaryColor,
      minimumSize: const Size(88, 36),
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
                  Get.to(() => ClientSplashBookingPage());
                },
                child: Container(
                  width: constraints.maxWidth * 1,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Aceptar',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        ),
      );
    });
  }
}

