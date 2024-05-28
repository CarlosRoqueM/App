import 'dart:io';
import 'dart:convert';
import 'package:app/src/models/profile.dart';
import 'package:app/src/models/rol.dart';
import 'package:path/path.dart';
import 'package:app/src/environments/environment.dart';
import 'package:app/src/models/response_api.dart';
import 'package:app/src/models/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileProviders extends GetConnect {

  String url  = '${Environment.API_URL}api/profile';

  Future<Response> create(Profile profile) async {

    Response response = await post('$url/create', 
    profile.toJson(),
    headers: {

      'Content-Type': 'application/json'
    }
    );

    return response;

  }

  Future<Stream> createWithImage(Profile profile, File image) async {

    Uri uri = Uri.http(Environment.API_URL_OLD,'/api/profile/createWithImage');

    final request = http.MultipartRequest('POST', uri);
    request.files.add(http.MultipartFile(
      'image',
      http.ByteStream(image.openRead().cast()),
      await image.length(),
      filename: basename(image.path)
    ));
    request.fields['profile'] = json.encode(profile);
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }

  Future<List<Profile>> findByUser(String idUser) async {
    Response response = await get('$url/findByUser/$idUser',
    headers: {
      'Content-Type': 'application/json'
    }
    );

    if(response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la petición');
      return [];
    }

    List<Profile> profile = Profile.fromJsonList(response.body);

    return profile;
  }

}