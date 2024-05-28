import 'package:app/src/models/address.dart';
import 'package:app/src/models/profile.dart';
import 'package:app/src/models/rol.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/providers/address_providers.dart';
import 'package:app/src/providers/profile_providers.dart';
import 'package:app/src/providers/users_providers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class ClientProfilesListController extends GetxController {
  
  List<Profile> profiles = [];
  ProfileProviders profileProviders = ProfileProviders();
  User user = User.fromJson(GetStorage().read('user') ?? {});

  var radioValue = 0.obs;

  Future<List<Profile>> getProfiles() async {
    profiles = await profileProviders.findByUser(user.id ?? '');

    Profile p = Profile.fromJson(GetStorage().read('profiles') ?? {});

    int index = profiles.indexWhere((ad) => ad.id == p.id);

    if (index != -1) {
      radioValue.value = index;
    }
    return profiles;
  }

  void handleRadioValueChange(int? value) {
    radioValue.value = value!;
    GetStorage().write('address', profiles[value].toJson());
    update();
  }

  void goToProfilesCreatePage() {
    Get.toNamed('/client/profiles/create');
  }
  

}