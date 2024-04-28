import 'package:app/src/environments/environment.dart';
import 'package:app/src/models/response_api.dart';
import 'package:app/src/models/user.dart';
import 'package:get/get.dart';

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