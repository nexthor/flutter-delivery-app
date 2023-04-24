import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // no olvidar hacer el wrap de cada pantalla, para evitar el error del overflow
      body: SingleChildScrollView(
        child: Stack(
          // posicionar elementos unos encima de otros (layers)
          children: [
            _backgroundCover(context),
            Column(
              // posicionar elementos uno debajo del otro
              children: [
                _imageCover(),
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
          "assets/images/user_register.png",
          width: 130,
          height: 130,
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
      child: const TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
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
      child: const TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
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
      child: const TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
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
      child: const TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
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
      child: const TextField(
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
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
      child: const TextField(
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
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
        onPressed: () {},
        child: const Text(
          "REGISTRARSE",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
