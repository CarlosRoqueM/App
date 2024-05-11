import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:app/src/models/response_api.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/pages/client/profile/info/profilePage.dart';
import 'package:app/src/pages/client/profile/info/profilePage_Controller.dart';
import 'package:app/src/pages/client/profile/info/profilePage_Controller.dart';
import 'package:app/src/pages/client/settings/settings_page_controller.dart';
import 'package:app/src/providers/users_providers.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class updateProfilePageController extends GetxController {

  User user = User.fromJson(GetStorage().read('user') ?? {});

  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  UsersProviders usersProviders = UsersProviders();

  ImagePicker picker = ImagePicker();

  File? imageFile;

  ProfilePageController profilePageController = Get.find();

  updateProfilePageController() {
    phoneController.text = user.phone ?? '';
    locationController.text = user.location ?? '';
  }

  void updateInfo(BuildContext context) async {

    String location = locationController.text;
    String phone = phoneController.text;

    if(isValidForm(phone, location)){


      ProgressDialog pd = ProgressDialog(context: context);
      pd.show(max: 100, msg: 'Actualizando usuario...');

      User myUser = User(
        id: user.id,
        location: location,
        phone: phone,
        sessionToken: user.sessionToken,
      );

      if(imageFile == null){
        ResponseApi responseApi = await usersProviders.update(myUser);
        print('Response Api Update: ${responseApi.data}');
        Get.snackbar('Proceso terminado', responseApi.message ?? '');
        pd.close();
        if (responseApi.success == true) {
          GetStorage().write('user', responseApi.data); 
          profilePageController.user.value = User.fromJson(responseApi.data);
        }
      }
      else{
        Stream stream = await usersProviders.updateWithImage(myUser, imageFile!);
        stream.listen((res){
          pd.close();
          ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));
          Get.snackbar('Proceso terminado', responseApi.message ?? '');
          print('Response Api Update: ${responseApi.data}');
          if(responseApi.success == true) {
            GetStorage().write('user', responseApi.data); 
            profilePageController.user.value = User.fromJson(responseApi.data);
          }else{
            Get.snackbar('Registro erroneo', responseApi.message ?? '', backgroundColor: Colors.red, colorText: Colors.white);
          }
        });
      }
    }
  }

  bool isValidForm(
    String phone,
    String location,
  ){
    if(phone.isEmpty || location.isEmpty ){
      Get.snackbar('Formulario Inválido', 'Debes completar todos los campos');
      return false;
    }
    return true;
  }


  Future selectImage(ImageSource imageSource) async {
    XFile? image = await picker.pickImage(source: imageSource);

    if (image != null) {
      imageFile = File(image.path);
      update();
    }
  }
  void showAlertdialog(BuildContext context) {

    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: GlobalColors.primaryColor,
      padding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );

    Widget galleryButton = ElevatedButton(
      style: raisedButtonStyle,
      onPressed: () {
        Get.back();
        selectImage(ImageSource.gallery);
      },
      child: Text(
        'Galería',
        style: GoogleFonts.poppins(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.normal
        ),
        textAlign: TextAlign.center,
      ),
    );

    Widget CameraButton = ElevatedButton(
      style: raisedButtonStyle,
      onPressed: () {
        Get.back();
        selectImage(ImageSource.camera);
      },
      child: Text(
        'Cámara',
        style: GoogleFonts.poppins(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.normal
        ),
        textAlign: TextAlign.center,
      ),
    );

    AlertDialog alertDialog = AlertDialog(
      title: Text(
        'Selecciona una opción',
        style: GoogleFonts.poppins(
          color: GlobalColors.primaryColor,
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.center,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          galleryButton,
          CameraButton
        ],
      ),
    );
  
    showDialog(context: context, builder: (BuildContext context) {
      return alertDialog;
    });  
}
}