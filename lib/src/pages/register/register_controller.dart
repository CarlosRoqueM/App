import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:app/src/models/response_api.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/providers/users_providers.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class RegisterController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dniController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastname1Controller = TextEditingController();
  TextEditingController lastname2Controller = TextEditingController();
  TextEditingController locationController = TextEditingController();

  UsersProviders usersProviders = UsersProviders();

  ImagePicker picker = ImagePicker();

  File? imageFile;

  void gotoRegisterPage2() {
  String email = emailController.text.trim();
  String password = passwordController.text.trim();
  String confirmPassword = confirmPasswordController.text.trim();

  if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
    Get.snackbar('Formulario Inválido', 'Debes completar todos los campos');
    return;
  }
  if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario Inválido', 'El email es inválido');
      return;
  }
  if(password != confirmPassword){
    Get.snackbar('Formulario Inválido', 'Las contraseñas no coinciden');
    return;
  }
  
  saveFormData(email, password, confirmPassword);
  Get.toNamed('/register2');
}

  void saveFormData(String email, String password, String confirmPassword) {
    this.emailController.text = email;
    this.passwordController.text = password;
    this.confirmPasswordController.text = confirmPassword;
  }

  void saveAdditionalFormData(String dni, String name, String lastname1, String lastname2, String location, String phone) {
    this.dniController.text = dni;
    this.nameController.text = name;
    this.lastname1Controller.text = lastname1;
    this.lastname2Controller.text = lastname2;
    this.locationController.text = location;
    this.phoneController.text = phone;
  }

 void finishRegistration(context) {
  String dni = dniController.text.trim();
  String name = nameController.text.trim();
  String lastname1 = lastname1Controller.text.trim();
  String lastname2 = lastname2Controller.text.trim();
  String location = locationController.text.trim();
  String phone = phoneController.text.trim();

  if (dni.isEmpty || name.isEmpty || lastname1.isEmpty || lastname2.isEmpty || location.isEmpty || phone.isEmpty) {
    Get.snackbar('Formulario Inválido', 'Debes completar todos los campos');
    return;
  }

  if (dni.length != 8) {
      Get.snackbar('Formulario Inválido', 'Tu dni tiene que ser de 8 digitos');
      return;
  }

  if (phone.length != 9) {
      Get.snackbar('Formulario Inválido', 'Tu celular que ser de 9 digitos');
      return;
  }

  if(imageFile == null) {
    Get.snackbar('Formulario Inválido', 'Debes seleccionar una imagen de perfil');
    return;
  }

  saveAdditionalFormData(dni, name, lastname1, lastname2, location, phone);
  register(context);
}
  

  void register(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String dni = dniController.text.trim();
    String name = nameController.text.trim();
    String lastname1 = lastname1Controller.text.trim();
    String lastname2 = lastname2Controller.text.trim();
    String location = locationController.text.trim();
    String phone = phoneController.text.trim();

      ProgressDialog pd = ProgressDialog(context: context);
      pd.show(max: 100, msg: 'Registrando usuario...');

      User user = User(
        email: email,
        password: password,
        dni: dni,
        name: name,
        lastname1: lastname1,
        lastname2: lastname2,
        location: location,
        phone: phone
      );

      Stream stream = await usersProviders.createWithImage(user, imageFile!);
      stream.listen((res){
        pd.close();
        ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));

        if(responseApi.success == true) {
          GetStorage().write('user', responseApi.data);
          goToLoginPage();
        }else{
          Get.snackbar('Registro erroneo', responseApi.message ?? '', backgroundColor: Colors.red, colorText: Colors.white);
        }
      });
  }

  void goToLoginPage() {
    Get.offNamedUntil('/login', (route) => false);
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