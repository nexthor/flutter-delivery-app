import 'package:delivery_app/src/environment/environment.dart';
import 'package:delivery_app/src/models/user.dart';
import 'package:get/get.dart';

class UsersProvider extends GetConnect {
  String url = "${Environment.API_URL}users";

  Future<Response> create(User user) async {
    Response response = await post('$url/create', user.toJson(),
        headers: {'Content-Type': 'application/json'});

    return response;
  }
}
