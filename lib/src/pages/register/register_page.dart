import 'package:delivery_app/src/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _buttonBack(),
          _imageCover(context),
        ],
      )),
    );
  }

  // private methods
  Widget _buttonBack() {
    return SafeArea(
        child: Container(
      child: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    ));
  }

  Widget _imageCover(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 10),
        child: GestureDetector(
          onTap: () => controller.showAlertDialog(context),
          child: GetBuilder<RegisterController>(
              builder: (value) => CircleAvatar(
                    backgroundImage: controller.imageFile != null
                        ? FileImage(controller.imageFile!)
                        : const AssetImage("assets/images/user_register.png")
                            as ImageProvider,
                    radius: 50,
                    backgroundColor: Colors.white,
                  )),
        ),
      ),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.amber,
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.25,
        left: 20,
        right: 20,
      ),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
          ]),
      child: Column(children: [
        _boxFormHeaderText(),
        _boxFormEmailInput(),
        _boxFormNameInput(),
        _boxFormLastNameInput(),
        _boxFormPhoneInput(),
        _boxFormPasswordInput(),
        _boxFormRepeatPasswordInput(),
        _boxFormButtonSubmit(),
      ]),
    );
  }

  Widget _boxFormHeaderText() {
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 10),
        child: const Text("REGISTRO"));
  }

  Widget _boxFormEmailInput() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: "Correo Electronico",
            prefixIcon: Icon(
              Icons.email,
            )),
      ),
    );
  }

  Widget _boxFormNameInput() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller.nameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            hintText: "Nombre",
            prefixIcon: Icon(
              Icons.person,
            )),
      ),
    );
  }

  Widget _boxFormLastNameInput() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller.lastNameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            hintText: "Apellido",
            prefixIcon: Icon(
              Icons.person_outline,
            )),
      ),
    );
  }

  Widget _boxFormPhoneInput() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller.phoneController,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
            hintText: "Telefono",
            prefixIcon: Icon(
              Icons.phone,
            )),
      ),
    );
  }

  Widget _boxFormPasswordInput() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: "Clave",
            prefixIcon: Icon(
              Icons.lock,
            )),
      ),
    );
  }

  Widget _boxFormRepeatPasswordInput() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller.confirmPasswordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: "Confirmar Clave",
            prefixIcon: Icon(
              Icons.lock,
            )),
      ),
    );
  }

  Widget _boxFormButtonSubmit() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ElevatedButton(
        onPressed: () => controller.register(),
        child: const Text(
          "REGISTRARSE",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
