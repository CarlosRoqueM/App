import 'package:app/src/models/rol.dart';
import 'package:app/src/providers/users_providers.dart';
import 'package:get/get.dart';


class NurseMainController extends GetxController {

  var indexTap = 0.obs;

  void changeTab(int index) {
    indexTap.value = index;
  }

  void setIndexToTwo() {
    indexTap.value = 2;
  }

}