import 'package:app/src/models/response_api.dart';
import 'package:app/src/providers/users_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProviders usersProviders = UsersProviders();

  void gotoRegisterPage() {
    Get.toNamed('/register');
  }

  void gotoRegisterPageNurse() {
    Get.toNamed('/registerNurse');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email ${email}');
    print('password ${password}');

    if (isValidform(email, password)) {

      ResponseApi responseApi = await usersProviders.login(email, password);

      print('Response Api: ${responseApi.toJson()}');

      if (responseApi.success == true) {
        GetStorage().write('user', responseApi.data);
        goToHomePage();
      } else {
        Get.snackbar('Error', responseApi.message ?? '');
      }
    }
  }

  void goToHomePage() {
    Get.offNamedUntil('/main', (route) => false);
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
