import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app/src/pages/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 50,
        child: _textDontHaveAccount(),
      ),
      body: SingleChildScrollView(
        child: Stack(
          // posicionar elementos unos encima de otros (layers)
          children: [
            _backgroundCover(context),
            Column(
              // posicionar elementos uno debajo del otro
              children: [
                _imageCover(),
                _textAppName(),
              ],
            ),
            _boxForm(context),
          ],
        ),
      ),
    );
  }

  // private methods
  Widget _imageCover() {
    return SafeArea(
      // coloca los elementos justo debajo de la barra de estado de los celulares
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/delivery_icon.png",
          width: 130,
          height: 130,
        ),
      ),
    );
  }

  Widget _textAppName() {
    return const Text(
      "Delivery App",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(0, 0, 0, 1),
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

  Widget _textDontHaveAccount() {
    return Row(
      // ubica elementos uno al lado de otros de manera horizontal
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("¿No tienes cuenta?"),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () => controller.goToRegisterPage(),
          child: const Text(
            "Registrate aqui",
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.35,
        left: 50,
        right: 50,
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
        _boxFormPasswordInput(),
        _boxFormButtonSubmit(),
      ]),
    );
  }

  Widget _boxFormHeaderText() {
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 30),
        child: const Text("INGRESAR"));
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

  Widget _boxFormButtonSubmit() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ElevatedButton(
        onPressed: () => controller.login(),
        child: const Text(
          "ENTRAR",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
