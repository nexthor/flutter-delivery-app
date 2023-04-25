import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void register() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String confirPassword = confirmPasswordController.text;
    String phone = phoneController.text;

    if (isValidForm(name, lastName, email, phone, password, confirPassword)) {
      Get.snackbar(
          'Formulario valido', 'Estas listo para enviar la peticion https');
    }
  }

  bool isValidForm(String name, String lastName, String email, String phone,
      String password, String confirmPassword) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'debes ingresar el email');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'el email no es valido');
      return false;
    }

    if (name.isEmpty) {
      Get.snackbar('Formulario no valido', 'ingresa tu nombre');
      return false;
    }

    if (lastName.isEmpty) {
      Get.snackbar('Formulario no valido', 'ingresa tu apellido');
      return false;
    }

    if (phone.isEmpty) {
      Get.snackbar('Formulario no valido', 'ingresa tu telefono');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'debes ingresar la clave');
      return false;
    }

    if (confirmPassword.isEmpty) {
      Get.snackbar('Formulario no valido', 'por favor confirma la clave');
      return false;
    }

    if (confirmPassword != password) {
      Get.snackbar('Formulario no valido', 'las claves no coinciden');
      return false;
    }

    return true;
  }
}
