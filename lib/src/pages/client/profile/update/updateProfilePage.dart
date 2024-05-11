
import 'package:app/src/pages/client/profile/update/updateProfile_Controller.dart';
import 'package:app/src/pages/register/register_controller.dart';
import 'package:app/src/pages/register/splashRegister_page.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class updateProfilePage extends StatelessWidget {
  updateProfilePageController cont = Get.put(updateProfilePageController());
  

  @override
  Widget build(BuildContext context) {
    Size h = MediaQuery.of(context).size;
    //final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return BackgroundTemplate(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true, 
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8),
          height: 90,
          child: Column(
            children: [_nextButton(context)],
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bottomBack(),
                Column(
                  children: [
                    _imageUser(context),
                    _location(),
                    _phone()
                  ],
                )
              ],
            ),
        ),
        ),
    ),
  );
}

//Widgets_privados

  Widget _bottomBack() {
    return SafeArea(
        child: Row(
          children: [
        IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios)),
        Text(
          'Actualiza tu perfil',
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          textAlign: TextAlign.right,
        ),
      ]),
    );
  }

  Widget _imageUser(BuildContext context){
    Size h = MediaQuery.of(context).size;
    return Container(
      
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          cont.showAlertdialog(context);
        },
        child: GetBuilder<updateProfilePageController>(
          builder: (value) => CircleAvatar(
          backgroundImage: 
          cont.imageFile != null ? FileImage(cont.imageFile!) :
          cont.user.image != null ? NetworkImage(cont.user.image!) :
          AssetImage('assets/img/perfil2.png') as ImageProvider,
          radius: h.height * 0.12,
          backgroundColor: GlobalColors.primaryColor,
        ),
        ),
      )
    );
  }

  Widget _customTextField({required TextEditingController controller, required String labelText, TextInputType keyboardType = TextInputType.text}) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          cursorColor: GlobalColors.primaryColor,
          decoration: InputDecoration(
            labelText: labelText,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10),
            labelStyle: const TextStyle(
              color: Color.fromRGBO(2, 81, 89, 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget _customTextField2({required TextEditingController controller, required String labelText, TextInputType keyboardType = TextInputType.text}) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          cursorColor: GlobalColors.primaryColor,
          decoration: InputDecoration(
            labelText: labelText,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10),
            labelStyle: const TextStyle(
              color: Color.fromRGBO(2, 81, 89, 1),
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _phone() {
    return _customTextField2(
      controller: cont.phoneController, 
      labelText: 'Celular',
      keyboardType: TextInputType.number,
      );
  }

  Widget _location() {
    return _customTextField(
      controller: cont.locationController, 
      labelText: 'Ubicación',
      keyboardType: TextInputType.streetAddress,
      );
  }


  Widget _nextButton(BuildContext context) {
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
                  cont.updateInfo(context);
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
                )
              )
          ],
      ));
      });
  }
}

