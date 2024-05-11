import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:app/src/models/response_api.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/pages/client/settings/settings_page_controller.dart';
import 'package:app/src/providers/users_providers.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class ProfilePageController extends GetxController {

  var user = User.fromJson(GetStorage().read('user') ?? {}).obs;

  void goToProfileUpdatePage() {
    Get.toNamed('/client/profile/update');
  }

}