import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // posicionar elementos unos encima de otros (layers)
        children: [
          _backgroundCover(),
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
    return Container(
      width: 130,
      height: 130,
      alignment: Alignment.center,
      child: Image.asset("assets/images/delivery_icon.png"),
    );
  }

  Widget _textAppName() {
    return const Text("Delivery App");
  }

  Widget _backgroundCover() {
    return Container(
      width: double.infinity,
      height: 200,
      color: const Color.fromRGBO(237, 76, 46, 1),
    );
  }
}
