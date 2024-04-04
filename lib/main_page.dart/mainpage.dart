import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:task/presentation/homePage/home_page.dart';
import 'package:task/presentation/loginpage/LoginPage/login_page.dart';

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  bool login = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPageScreen()),
        GetPage(name: '/home', page: () => HomeScreen())
      ],
    );
  }
}
