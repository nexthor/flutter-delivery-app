import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 50,
        child: _textDontHaveAccount(),
      ),
      body: Stack(
        // posicionar elementos unos encima de otros (layers)
        children: [
          _backgroundCover(context),
          Column(
            // posicionar elementos uno debajo del otro
            children: [
              _imageCover(),
              _textAppName(),
            ],
          )
        ],
      ),
    );
  }

  // private methods
  Widget _imageCover() {
    return SafeArea(
      // coloca los elementos justo debajo de la barra de estado de los celulares
      child: Container(
        margin: const EdgeInsets.only(top: 95, bottom: 10),
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
        color: Color.fromRGBO(237, 76, 46, 1),
      ),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      color: const Color.fromRGBO(237, 76, 46, 1),
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
      // ubica elementos uno al lado de otros de manera horizontal
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("¿No tienes cuenta?"),
        SizedBox(width: 5),
        Text(
          "Registrate aqui",
          style: TextStyle(
            color: Color.fromRGBO(237, 76, 46, 1),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
