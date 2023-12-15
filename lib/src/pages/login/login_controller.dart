import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void gotoRegisterPage() {
    Get.toNamed('/register');
  }

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email ${email}');
    print('password ${password}');

    if (isValidform(email, password)) {
      Get.snackbar('Formulario Válido', 'Listo para Ingresar');
    }
  }

  bool isValidform(String email, String password) {
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

    return true;
  }
}
