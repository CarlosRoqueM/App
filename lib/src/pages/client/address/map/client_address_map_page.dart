import 'package:app/src/pages/client/address/map/client_address_map_controller.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClientAddressMapPage extends StatelessWidget {
  ClientAddressMapController cont = Get.put(ClientAddressMapController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ubica tu dirreción en el mapa',
          style: GoogleFonts.poppins(
                      color: GlobalColors.primaryColor,
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,),
        
      ),
          body: Stack(
            children: [
              _googleMaps(),
              _iconMyLocation(),
              _cardAddress(),
              _buttonAccept(context),
            
            ],
          ),
    ),
    ));
  }

  

  Widget _cardAddress () {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Card(
        color: Colors.grey[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            cont.addressName.value,
            style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _iconMyLocation (){
    return Container(
      alignment: Alignment.center,
      child: Icon(
        Icons.location_on_rounded,
        color: Colors.red, 
        size: 45,
        ),
    );
  }


  Widget _googleMaps() {
    return GoogleMap(
        initialCameraPosition: cont.initialPosition,
        mapType: MapType.hybrid,
        onMapCreated: cont.onMapCreated,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
        onCameraMove: (position) => {
          cont.initialPosition = position
        },
        onCameraIdle: () async {
          await cont.setLocationDraggableInfo();
        },
      );
  }

  Widget _buttonAccept(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: GlobalColors.primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(10),
      child: ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  cont.selectRefPoint(context);
                },
                child: Container(
                  //width: constraints.maxWidth * 1,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Seleccionar este punto',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              )
      );
      });
  }
}