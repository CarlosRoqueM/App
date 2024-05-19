import 'package:app/src/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  
  var user = User.fromJson(GetStorage().read('user') ?? {}).obs;
  
  

}