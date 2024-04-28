import 'package:app/src/models/user.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  User user = User.fromJson(GetStorage().read('user') ?? {});

  HomeController() {
    print('User: ${user.toJson()}');
  }
}