import 'package:delivery_app/src/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  User user = User.fromJson(GetStorage().read("user") ?? {});

  HomeController() {
    print('Usuario de sesion ${user.toJson()}');
  }

  void signOut() {
    GetStorage().remove('user');

    Get.offNamedUntil(
        "/", (route) => false); // elimina todo el historial de pantallas
  }
}
