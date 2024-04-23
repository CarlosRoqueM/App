import 'package:app/src/providers/users_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController dniController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastname1Controller = TextEditingController();
  TextEditingController lastname2Controller = TextEditingController();
  TextEditingController locationController = TextEditingController();



  void gotoRegisterPage2() {
    Get.toNamed('/register2');
  }

  void register() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String dni = dniController.text.trim();
    String name = nameController.text.trim();
    String lastname1 = lastname1Controller.text.trim();
    String lastname2 = lastname2Controller.text.trim();
    String location = locationController.text.trim();


    UsersProviders usersProviders = UsersProviders();

    print('Email ${email}');
    print('password ${password}');
    print('password ${confirmPassword}');
    print('dni ${dni}');
    print('name ${name}');
    print('lastname1 ${lastname1}');
    print('lastname2 ${lastname2}');
    print('location ${location}');

    if (isValidform(email, password, confirmPassword)) {
      Get.snackbar('Formulario Válido', 'Listo para Ingresar');
    }
  }

  bool isValidform(String email, String password, String confirmPassword) {
    if (email.isEmpty) {
      Get.snackbar('Formulario Inválido', 'Debes de Ingresar el email');
      return false;
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario Inválido', 'El email es inválido');
      return false;
    }
    if (password.isEmpty) {
      Get.snackbar('Formulario Inválido', 'Debes de Ingresar tu contraseña');
      return false;
    }

    if (confirmPassword.isEmpty) {
      Get.snackbar('Formulario Inválido',
          'Debes de Ingresar tu confirmacion de contraseña');
      return false;
    }

    if (password != confirmPassword) {
      Get.snackbar('Formulario Inválido', 'Las contraseñas no son iguales');
      return false;
    }
    return true;
  }
}
