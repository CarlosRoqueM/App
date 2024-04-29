import 'package:app/src/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  User user = User.fromJson(GetStorage().read('user') ?? {});

  HomeController() {
    print('User: ${user.toJson()}');
  }

  void logout() {
    GetStorage().remove('user');
    Get.offAllNamed('/login');
  }
}