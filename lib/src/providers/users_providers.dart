import 'dart:io';
import 'dart:convert';
import 'package:app/src/models/rol.dart';
import 'package:path/path.dart';
import 'package:app/src/environments/environment.dart';
import 'package:app/src/models/response_api.dart';
import 'package:app/src/models/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UsersProviders extends GetConnect {

  String url  = '${Environment.API_URL}api/users';

  Future<Response> create(User user) async {

    Response response = await post('$url/create', 
    user.toJson(),
    headers: {

      'Content-Type': 'application/json'
    }
    );

    return response;

  }

  /*--- TRAER A LOS ENFERMEROS---- */
  
  Future<List<Rol>> getAll() async {
    Response response = await get('$url/roles',
    headers: {
      'Content-Type': 'application/json'
    }
    );

    if(response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la petición');
      return [];
    }

    List<Rol> roles = Rol.fromJsonList(response.body);

    return roles;
  }

  Future<List<User>> findByRoles(String idUser) async {
    Response response = await get('$url/findByRoles/$idUser',
    headers: {
      'Content-Type': 'application/json'
    }
    );

    if(response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la petición');
      return [];
    }

    List<User> users = User.fromJsonList(response.body);

    return users;
  }

  /*-----Traer a todos los enfermeros  ----- */

  Future<List<User>> getAllNurses() async {
    Response response = await get('$url/nurses',
    headers: {
      'Content-Type': 'application/json'
    }
    );

    if(response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la petición');
      return [];
    }

    List<User> users = User.fromJsonList(response.body);

    return users;
  }

  /* ------ Sin imagen ----------*/
  Future<ResponseApi> update(User user) async {
    Response response = await put('$url/updateWithOutImage', 
      user.toJson(),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo actualizar la infrmación del usuario');
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;

  }

  Future<Stream> createWithImage(User user, File image) async {

    Uri uri = Uri.http(Environment.API_URL_OLD, '/api/users/createWithImage');

    final request = http.MultipartRequest('POST', uri);
    request.files.add(http.MultipartFile(
      'image',
      http.ByteStream(image.openRead().cast()),
      await image.length(),
      filename: basename(image.path)
    ));
    request.fields['user'] = json.encode(user);
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }

  Future<Stream> updateWithImage(User user, File image) async {

    Uri uri = Uri.http(Environment.API_URL_OLD, '/api/users/update');

    final request = http.MultipartRequest('PUT', uri);
    request.files.add(http.MultipartFile(
      'image',
      http.ByteStream(image.openRead().cast()),
      await image.length(),
      filename: basename(image.path)
    ));
    request.fields['user'] = json.encode(user);
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }

  Future<ResponseApi> login(String email, String password) async {

    Response response = await post('$url/login', 
    {
      'email': email,
      'password': password
    },
    headers: {
      'Content-Type': 'application/json'
    }
    );

    if(response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la petición');
      return ResponseApi();
    } 

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;

  }

}