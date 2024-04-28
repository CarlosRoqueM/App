import 'package:app/src/models/user.dart';
import 'package:app/src/providers/users_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

 void finishRegistration() {
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
      return ;
  }

  if (phone.length != 9) {
      Get.snackbar('Formulario Inválido', 'Tu celular que ser de 9 digitos');
      return;
  }


  saveAdditionalFormData(dni, name, lastname1, lastname2, location, phone);
  register();
  Get.toNamed('/splashRegister');
}
  

  void register() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String dni = dniController.text.trim();
    String name = nameController.text.trim();
    String lastname1 = lastname1Controller.text.trim();
    String lastname2 = lastname2Controller.text.trim();
    String location = locationController.text.trim();
    String phone = phoneController.text.trim();

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

      Response response = await usersProviders.create(user);

      print('Response Status Code: ${response.body}');

      Get.snackbar('Formulario Válido', 'Listo para Registrar');
  }
}