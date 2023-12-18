import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OnboardingController extends GetxController {
  void gotoLoginPage() {
    Get.toNamed('/login');
  }
}
