import 'package:city_app/utils/componnents.dart';
import 'package:city_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Obx(() {
        return Column(
          children: [
            Image(image: AssetImage('assets/images/b.png')),
            Text(
              'Welcome to Te City App',
              style: TextStyle(
                  fontSize: 30, color: KmainColor, fontWeight: FontWeight.bold),
            ),
            Text(
              'Discover new places get in touch with all updates',
              style: TextStyle(fontSize: 12),
            ),
            CustomButton(
              text: 'Discover More',
              onPressed: () {
                controller.signIn();
              },
            )
          ],
        );
      })),
    );
  }
}
