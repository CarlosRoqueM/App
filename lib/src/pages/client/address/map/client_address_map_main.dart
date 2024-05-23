import 'package:app/src/pages/client/address/map/client_address_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClientAddressMapPageMain extends StatelessWidget {
  ClientAddressMapController cont = Get.put(ClientAddressMapController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          body: Stack(
            children: [
              _googleMaps(),
            
            ],
          ),
      ),
    );
  }


  Widget _googleMaps() {
    return GoogleMap(
        initialCameraPosition: cont.initialPosition,
        mapType: MapType.normal,
        onMapCreated: cont.onMapCreated,
        //myLocationButtonEnabled: false,
        //myLocationEnabled: false,
        onCameraMove: (position) => {
          cont.initialPosition = position
        },
      );
  }
}