import 'package:app/src/models/address.dart';
import 'package:app/src/models/rol.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/providers/address_providers.dart';
import 'package:app/src/providers/users_providers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class ClientAddressListController extends GetxController {
  
  List<Address> address = [];
  AddressProviders addressProviders = AddressProviders();
  User user = User.fromJson(GetStorage().read('user') ?? {});

  var radioValue = 0.obs;

  Future<List<Address>> getAddress() async {
    address = await addressProviders.findByUser(user.id ?? '');

    Address a = Address.fromJson(GetStorage().read('address') ?? {});

    int index = address.indexWhere((ad) => ad.id == a.id);

    if (index != -1) {
      radioValue.value = index;
    }

    return address;
  }

  void handleRadioValueChange(int? value) {
    radioValue.value = value!;
    GetStorage().write('address', address[value].toJson());
    update();
  }

  void goToAddressCreatePage() {
    Get.toNamed('/client/address/create');
  }

  void goToProfilesListPage() {
    Get.toNamed('/client/profiles/list');
  }
  

}