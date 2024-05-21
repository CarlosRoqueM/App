import 'package:app/src/models/address.dart';
import 'package:app/src/models/response_api.dart';
import 'package:app/src/models/rol.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/pages/client/address/list/client_address_list_controller.dart';
import 'package:app/src/pages/client/address/map/client_address_map_page.dart';
import 'package:app/src/providers/address_providers.dart';
import 'package:app/src/providers/users_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class ClientAddressCreateController extends GetxController {
  
  TextEditingController addressController = TextEditingController();
  TextEditingController neighborHoodController = TextEditingController();
  TextEditingController refPointController = TextEditingController();

  double latRefPoint = 0;
  double lngRefPoint = 0;
  
  User user = User.fromJson(GetStorage().read('user') ?? {});

  AddressProviders addressProviders = AddressProviders();

  ClientAddressListController clientAddressListController = Get.find();

  void openGoogleMaps(BuildContext context) async {
    Map<String, dynamic> refPoint = await showMaterialModalBottomSheet(context: context, builder: (context) => ClientAddressMapPage(),
    isDismissible: false,
    enableDrag: false );

    print('REF POINT MAP ${refPoint}');
    refPointController.text = refPoint['address'];
    latRefPoint = refPoint['lat'];
    lngRefPoint = refPoint['lng'];
  }

  void createAddress() async {
    String addressName = addressController.text;
    String neighborhood = neighborHoodController.text;
    
    if (isValidform(addressName, neighborhood)) {
      Address address = Address(
        address: addressName,
        neighborhood: neighborhood,
        lat: latRefPoint,
        lng: lngRefPoint,
        idUser: user.id
      );
      ResponseApi responseApi = await addressProviders.create(address);

      if (responseApi.success == true) {
        address.id = responseApi.data;
        GetStorage().write('address', address.toJson());
        clientAddressListController.update();
        Get.back();
      } 
    }

  }

  bool isValidform (String addressName, String neighborhood) {
    if (addressName.isEmpty || neighborhood.isEmpty) {
      Get.snackbar('Error', 'Todos los campos son obligatorios');
      return false;
    }

    if (latRefPoint == 0 || lngRefPoint == 0) {
      Get.snackbar('Error', 'Debe seleccionar un punto de referencia');
      return false;
    }
    return true;
  }
 
}