import 'package:app/src/pages/client/profile/info/profilePage_Controller.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class profilePage extends StatelessWidget {

  ProfilePageController cont = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {

    Size h = MediaQuery.of(context).size;

    return BackgroundTemplate(
          child: SafeArea(
            child: Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: Container(
              padding: const EdgeInsets.all(8),
              height: 90,
              child: Column(
                children: [_updatedButton(context)],
              )),
            body: Obx(() => SingleChildScrollView(
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.44,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(1, 52, 64, 1),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )),
                    child: Column(
                      children: [
                        _bottomBack(),
                        _imageUser(context),
                        _fullname(),
                        _dni(),
                      ],
                    ),
                  ),
                  SizedBox(height: h.height * 0.04),
                  
                      _email(),  
                      _location(),
                      _phone(),
                    ],
                  ),
                ),
              )
              )
            )
          );
}

  Widget _bottomBack() {
    return SafeArea(
        child: Row(
          children: [
        IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios), color: Colors.white,),
        Text(
          'Perfil',
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          textAlign: TextAlign.right,
        ),
      ]),
    );
  }

  Widget _imageUser(BuildContext context){
    Size h = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 4),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              // Acción al tocar la imagen
            },
            child: CircleAvatar(
              backgroundImage: 
              cont.user.value.image != null ? NetworkImage(cont.user.value.image!) :
              AssetImage('assets/img/perfil2.png') as ImageProvider,
              radius: h.height * 0.12,
              backgroundColor: GlobalColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _fullname(){
    return Container(
      padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
      
      child: Text(
            '${cont.user.value.name ?? ''} ${cont.user.value.lastname1 ?? ''}',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )
        );
  }
  Widget _dni(){
    return Container(
      padding: const EdgeInsets.only(top: 2, right: 8, left: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Icon(
            Icons.pause_presentation_rounded, 
            color: Colors.grey,
          ),
          SizedBox(width: 4), 
          Text(
            '${cont.user.value.dni ?? ''}', 
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16, 
            ),
          ),
        ],
      ),
    );
  }

  Widget _customTextField({
    required TextEditingController controller,
    required String labelText,
    bool obscureText = false, 
    IconData? icon, // Agrega este parámetro
    keyboardType = TextInputType.text,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          cursorColor: GlobalColors.primaryColor,
          decoration: InputDecoration(
            labelText: labelText,
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

  Widget _customTextField2({
    required String labelText,
    bool obscureText = false, bool enabled = false,
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

  Widget _email() {
    return _customTextField2(
      labelText: '${cont.user.value.email ?? ''}',
      icon: Icons.email, 
    );
  }

  Widget _location() {
    return _customTextField2(
      labelText: '${cont.user.value.location ?? ''}',     
      icon: Icons.location_on, 
    );
  }

  Widget _phone() {
    return _customTextField2(
      labelText: '${cont.user.value.phone ?? ''}',
      icon: Icons.phone_iphone_rounded, 
    );
  }

  

  Widget _updatedButton(BuildContext context) {
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
                  cont.goToProfileUpdatePage();
                },
                child: Container(
                  width: constraints.maxWidth * 1,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Actualizar perfil',
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
