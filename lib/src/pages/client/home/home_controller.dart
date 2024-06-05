import 'dart:async';

import 'package:app/src/models/rol.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/pages/client/booking/client_booking_page.dart';
import 'package:app/src/pages/client/enfermeros/detail/profileNurse_page.dart';
import 'package:app/src/providers/users_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeController extends GetxController {
  var user = User.fromJson(GetStorage().read('user') ?? {}).obs;

  HomeController() {
    print('User: ${user.toJson()}');
    getRoles();
    getNurse();
    getNursesByLastName('');
  }

  void logout() {
    GetStorage().remove('user');
    Get.offAllNamed('/login');
  }

  void goToSearchPage() {
    Get.toNamed('/client/search');
  }

  UsersProviders usersProviders = UsersProviders();

  List<Rol> roles = <Rol>[].obs;

  List<User> nurses = <User>[].obs;

  String lastName = '';
  Timer? searchOnStoppedTyping;

  void getRoles() async {
    var result = await usersProviders.getAll();

    roles.clear();
    roles.addAll(result);
  }

  void getNurse() async {
    List<User> result = await usersProviders.getAllNurses();

    nurses.clear();
    nurses.addAll(result);
  }

  Future<List<User>> getUsers(String idUser) async {
    return await usersProviders.findByRoles(idUser);
  }

  Future<List<User>> getNursesByLastName(String lastName) async {
    List<User> result = await usersProviders.findByLastName(lastName);
    return result;
  }

  void onChangeText(String text) {
    const duration = Duration(milliseconds: 750);
    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping?.cancel();
    }

    searchOnStoppedTyping = Timer(duration, () {
      lastName = text;
      print('TEXTO COMPLERO: ${text}');
    });
  }

  void openBottomShead(BuildContext context, User user) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => ProfileNursePage(
        user: user,
      ),
    );
  }

  void DetailNurse (BuildContext context, User user) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => ClientBookingPage(
        user: user,
      ),
    );
  }
}
