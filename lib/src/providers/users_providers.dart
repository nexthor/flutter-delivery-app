import 'package:delivery_app/src/environment/environment.dart';
import 'package:delivery_app/src/models/reponse_api.dart';
import 'package:delivery_app/src/models/user.dart';
import 'package:get/get.dart';
import 'dart:async';

class UsersProvider extends GetConnect {
  String url = "${Environment.API_URL}users";

  FutureOr<Response> create(User user) async {
    Response response = await post('$url/create', user.toJson(),
        headers: {'Content-Type': 'application/json'});

    return response;
  }

  FutureOr<ResponseApi> login(String email, String password) async {
    Response response = await post(
        '$url/login', {'email': email, 'password': password},
        headers: {'Content-Type': 'application/json'});

    if (response.body == null) {
      Get.snackbar("Error", "No se pudo ejecutar la peticion");
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }
}
