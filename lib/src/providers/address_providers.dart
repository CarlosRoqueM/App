import 'dart:io';
import 'dart:convert';
import 'package:app/src/models/address.dart';
import 'package:app/src/models/rol.dart';
import 'package:path/path.dart';
import 'package:app/src/environments/environment.dart';
import 'package:app/src/models/response_api.dart';
import 'package:app/src/models/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddressProviders extends GetConnect {

  String url  = '${Environment.API_URL}api/address';

  Future<ResponseApi> create(Address address) async {

    Response response = await post('$url/create', 
    address.toJson(),
    headers: {

      'Content-Type': 'application/json'
    }
    );

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;

  }

  Future<List<Address>> findByUser(String idUser) async {
    Response response = await get('$url/findByUser/$idUser',
    headers: {
      'Content-Type': 'application/json'
    }
    );

    if(response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la petición');
      return [];
    }

    List<Address> addresss = Address.fromJsonList(response.body);

    return addresss;
  }


}