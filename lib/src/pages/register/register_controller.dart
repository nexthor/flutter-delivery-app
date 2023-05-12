import 'dart:io';
import 'dart:async';
import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/providers/users_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  UsersProvider usersProvider = UsersProvider();
  ImagePicker picker = ImagePicker();
  File? imageFile;

  void register() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String confirPassword = confirmPasswordController.text;
    String phone = phoneController.text;

    if (isValidForm(name, lastName, email, phone, password, confirPassword)) {
      User user = User(
          email: email,
          name: name,
          lastName: lastName,
          phone: phone,
          password: password);
      Response response = await usersProvider.create(user);

      print('RESPONSE: ${response.body}');

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

  FutureOr selectImage(ImageSource imageSource) async {
    XFile? image = await picker.pickImage(source: imageSource);

    if (image != null) {
      imageFile = File(image.path);
      update();
    }
  }

  void showAlertDialog(BuildContext context) {
    Widget galleryButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.gallery);
        },
        child: const Text(
          'GALERIA',
          style: TextStyle(color: Colors.black),
        ));
    Widget cameraButon = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.camera);
        },
        child: const Text(
          'CAMARA',
          style: TextStyle(color: Colors.black),
        ));

    AlertDialog alertDialog = AlertDialog(
      title: const Text('Selecciona una opción:'),
      actions: [galleryButton, cameraButon],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
