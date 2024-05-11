import 'package:app/src/models/rol.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/providers/users_providers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {

  var user = User.fromJson(GetStorage().read('user') ?? {}).obs;

  HomeController() {
    print('User: ${user.toJson()}');
    getRoles();
    getNurse();
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

}