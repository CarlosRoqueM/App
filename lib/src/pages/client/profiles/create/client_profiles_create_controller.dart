import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:app/src/models/profile.dart';
import 'package:app/src/models/response_api.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/pages/client/profiles/list/client_profiles_list_controller.dart';
import 'package:app/src/providers/profile_providers.dart';
import 'package:app/src/providers/users_providers.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';


class ClientProfilesCreateController extends GetxController {
  
  TextEditingController nameController = TextEditingController();
  TextEditingController lastname1Controller = TextEditingController();
  TextEditingController lastname2Controller = TextEditingController();
  TextEditingController ageController = TextEditingController();

  
  User user = User.fromJson(GetStorage().read('user') ?? {});

  ProfileProviders profileProviders = ProfileProviders();

  ClientProfilesListController clientProfilesListController = Get.find();

  ImagePicker picker = ImagePicker();

  File? imageFile;

  void createProfile(BuildContext context) async {
    String name = nameController.text;
    String lastname1 = lastname1Controller.text;
    String lastname2 = lastname2Controller.text;
    String age = ageController.text;
    
    if (isValidform(name, lastname1, lastname2, age)) {
      Profile profile = Profile(
        name: name,
        lastname1: lastname1,
        lastname2: lastname2,
        age: age,
        idUser: user.id
      );

      ProgressDialog pd = ProgressDialog(context: context);
      pd.show(max: 100, msg: 'Registrando perfil...');

      Stream stream = await profileProviders.createWithImage(profile, imageFile!);
      stream.listen((res) { 
        pd.close();

        ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));

        if (responseApi.success == true) {
          GetStorage().write('profile', responseApi.data);
          clientProfilesListController.update();
          Get.back();
        } else {
          Get.snackbar('Error', responseApi.message!);
        }

      });
    }
  }

  bool isValidform(String name, String lastname1, String lastname2, String age) {
    if (name.isEmpty || lastname1.isEmpty || lastname2.isEmpty || age.isEmpty) {
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

    Widget CameraButton = 
    
    ElevatedButton(
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
        //crossAxisAlignment: CrossAxisAlignment.center,
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