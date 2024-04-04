import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/presentation/homePage/dat_list_page.dart';
import 'package:task/presentation/homePage/profile_page.dart';
import 'package:task/presentation/loginpage/LoginPage/login_page.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _pages = [DataListPageScreen(), ProfilePageScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () async {
                  SharedPreferences login =
                      await SharedPreferences.getInstance();
                  login.setBool('Token', false).then((value) =>
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPageScreen();
                      })));
                },
                icon: Icon(
                  Icons.power_settings_new,
                  size: 30,
                )),
          )
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newindex, _) {
          return BottomNavigationBar(
              currentIndex: newindex,
              onTap: (index) {
                indexChangeNotifier.value = index;
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedIconTheme: const IconThemeData(color: Colors.white),
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "profile"),
              ]);
        },
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
    );
  }
}
