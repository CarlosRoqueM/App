import 'package:app/src/models/rol.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/pages/client/enfermeros/detail/profileNurse_page.dart';
import 'package:app/src/providers/users_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SearchController extends GetxController {
  
  var user = User.fromJson(GetStorage().read('user') ?? {}).obs;

  SearchController() {
    print('User: ${user.toJson()}');
    getNurse();
  }

  UsersProviders usersProviders = UsersProviders();

  List<Rol> roles = <Rol>[].obs; 

  List<User> nurses = <User>[].obs; 


  void getRoles() async {
    var result = await usersProviders.getAll();

    roles.clear();
    roles.addAll(result);
  }

  void getNurse () async {
    var result = await usersProviders.getAllNurses();
    
    nurses.clear();
    nurses.addAll(result);
  }

  Future<List<User>> getUsers(String idUser) async {
    return await usersProviders.findByRoles(idUser);
  }

  void openBottomShead (BuildContext context, User user) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => ProfileNursePage(user: user,),
    );
  }

  

}