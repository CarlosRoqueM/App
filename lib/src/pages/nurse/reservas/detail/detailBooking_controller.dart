import 'package:app/src/models/rol.dart';
import 'package:app/src/providers/users_providers.dart';
import 'package:get/get.dart';


class DetailBookingController extends GetxController {
  
  void goToAddressListPage() {
    Get.toNamed('/client/address/list');
  }

}