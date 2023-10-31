import 'package:city_app/controller/controller.dart';
import 'package:city_app/utils/componnents.dart';
import 'package:city_app/utils/constants.dart';
import 'package:city_app/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<Controller> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/b.png'),
              height: 150,
              width: 150,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Welcome to The City App',
              style: TextStyle(
                  fontSize: 30, color: KmainColor, fontWeight: FontWeight.bold),
            ),
            Text(
              'Discover new places ,get in touch with all updates',
              style: TextStyle(fontSize: 12, color: KmainColor),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                controller.signIn();
                Get.off(() => HomeScreen());
              },
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * .050,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: KmainColor,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Center(child: Text('Discover More')),
                ),
              ),
            )
          ],
        ));
  }
}
