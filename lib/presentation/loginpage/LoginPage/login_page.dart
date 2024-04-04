import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/getx/Apicontroller/api_controller.dart';
import 'package:task/presentation/homePage/home_page.dart';

class LoginPageScreen extends StatefulWidget {
  LoginPageScreen({super.key});

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  bool? login;
  loginCheck() async {
    SharedPreferences isLogin = await SharedPreferences.getInstance();
    final token = isLogin.getBool('Token');

    login = token!;
    print(login);
    if (token == true) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    } else {}
  }

  @override
  void initState() {
    super.initState();
    loginCheck();
  }

  final ApiController loginController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: loginController.usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: loginController.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => ElevatedButton(
                  onPressed: loginController.isLoading.value
                      ? null
                      : () => loginController.login(),
                  child: loginController.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text('Login'),
                )),
          ],
        ),
      ),
    );
  }
}
