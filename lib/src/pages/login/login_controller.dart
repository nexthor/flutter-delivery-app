import 'package:delivery_app/src/models/reponse_api.dart';
import 'package:delivery_app/src/providers/users_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UsersProvider usersProvider = UsersProvider();

  void goToRegisterPage() {
    Get.toNamed("/register");
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (isValidForm(email, password)) {
      ResponseApi responseApi = await usersProvider.login(email, password);

      print("Response Api ${responseApi.toJson()}");

      if (responseApi.success == true) {
        GetStorage().write("user", responseApi.data);
        goToHomePage();
      } else {
        Get.snackbar('Error', responseApi.message ?? '');
      }
    }
  }

  void goToHomePage() {
    Get.toNamed("/home");
  }

  bool isValidForm(String email, String password) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'debes ingresar el email');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'el email no es valido');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'debes ingresar la clave');

      return false;
    }

    return true;
  }
}
