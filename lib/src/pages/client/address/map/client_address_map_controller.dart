import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;

class ClientAddressMapController extends GetxController {


  CameraPosition initialPosition = CameraPosition(target: LatLng(-12.0511458,-76.9583472), zoom: 12);

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Servicio de ubicación desactivado');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Permiso de ubicación denegado');
      }
    }

    if (permission == LocationPermission.deniedForever) {
        return Future.error('Permiso de ubicación denegado');
    }

    return await Geolocator.getCurrentPosition();
  }

  Position? position;

  LatLng? addressLatLng;

  var addressName = ''.obs;

  Future setLocationDraggableInfo() async {

    double lat = initialPosition.target.latitude;
    double lng = initialPosition.target.longitude;

    List<Placemark> address = await placemarkFromCoordinates(lat, lng);

    if (address.isNotEmpty) {
      String direction = address[0].thoroughfare ?? '';
      String street = address[0].subThoroughfare ?? '';
      String city = address[0].locality ?? '';
      String department = address[0].administrativeArea ?? '';
      String country = address[0].country ?? '';

      addressName.value = '$direction $street, $city, $department';
      addressLatLng = LatLng(lat, lng);
    }

  }

  void checkGPS() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (isLocationServiceEnabled == true) {
      updateLocation();
    }else{
      bool locationGPS = await location.Location().requestService();
      if(locationGPS == true){
        updateLocation();
      }
    }
  }

  void selectRefPoint (BuildContext context) {
    if (addressLatLng != null) {
      Map<String, dynamic> data = {
      'address': addressName.value,
      'lat': addressLatLng!.latitude,
      'lng': addressLatLng!.longitude
    };
    Navigator.pop(context, data);
      
    }
  }

  ClientAddressMapController() {
    checkGPS();
  }

  void updateLocation () async {
    try{
      await _determinePosition();
      position = await Geolocator.getLastKnownPosition();
      animateCameraPosition(position?.latitude ?? -12.0511458, position?.longitude ?? -76.9583472);
    }catch(e){
      print('Error: $e');
    }
  }

  Future animateCameraPosition(double lat, double lng) async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, lng), zoom: 15, bearing:  0)));
  }

  Completer<GoogleMapController> mapController = Completer();

  void onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
  }

  
}