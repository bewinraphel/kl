import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:task/getx/Apicontroller/profilecontroller.dart';
import 'package:task/presentation/homePage/widget/profilecard.dart';

class ProfilePageScreen extends StatelessWidget {
  ProfilePageScreen({super.key});
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: GetBuilder<ProfileController>(builder: (controller) {
      return ListView.builder(
          itemCount: controller.dataList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile_image.jpg'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      controller.dataList[index].name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        controller.dataList[index].pantoneValue,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      leading: Icon(Icons.date_range_outlined),
                      title: Text(controller.dataList[index].pantoneValue),
                      onTap: () {
                        // Action on tap, e.g., open email client
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('+1234567890'),
                      onTap: () {
                        // Action on tap, e.g., make a call
                      },
                    ),
                  ],
                ),
              ],
            );
          });
    }));
  }
}
