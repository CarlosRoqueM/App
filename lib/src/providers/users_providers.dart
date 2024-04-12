import 'package:app/src/environments/environment.dart';
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

}