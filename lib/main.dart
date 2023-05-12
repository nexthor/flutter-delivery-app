import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/pages/home/home_page.dart';
import 'package:delivery_app/src/pages/login/login_page.dart';
import 'package:delivery_app/src/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

User loggedUser = User.fromJson(GetStorage().read("user") ?? {});
void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Delivery Udemy",
      initialRoute: loggedUser.id != null ? "/home" : "/",
      getPages: [
        GetPage(name: "/", page: () => LoginPage()),
        GetPage(name: "/register", page: () => RegisterPage()),
        GetPage(name: "/home", page: () => HomePage())
      ],
      navigatorKey: Get.key,
      theme: ThemeData(
          primaryColor: Colors.amber,
          colorScheme: const ColorScheme(
            primary: Colors.amber,
            secondary: Colors.amberAccent,
            brightness: Brightness.light,
            onBackground: Colors.grey,
            onPrimary: Colors.grey,
            surface: Colors.grey,
            error: Colors.grey,
            onError: Colors.grey,
            onSecondary: Colors.grey,
            background: Colors.grey,
            onSurface: Colors.grey,
          )),
    );
  }
}
