import 'package:city_app/controller/controller.dart';
import 'package:city_app/view/home/home_screen.dart';
import 'package:city_app/view/loginScreen/login_screen.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:permission_handler/permission_handler.dart';

class SplashScreenView extends StatefulWidget {
  SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    _initApp();
  }

  void _initApp() async {
    // Request location permission
    final permissionStatus = await Permission.location.request();
    if (permissionStatus.isGranted) {
      // Permission granted, check network connectivity
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        if (Controller().openId == null) {
          Get.off(() => LoginScreen());
        } else {
          Get.off(() => const HomeScreen());
        }
      } else {
        Get.defaultDialog(
          title: 'No Internet Connection',
          middleText: 'Please Check your internet connection',
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          textConfirm: 'Ok',
          onConfirm: () {
            Get.back();
            _initApp();
          },
        );
      }
    } else {
      // Handle the case where the user denies location permission
      Get.defaultDialog(
        title: 'Location Permission Required',
        middleText: 'Please grant location permission to use this app.',
        titleStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        textConfirm: 'Ok',
        onConfirm: () {
          Get.back();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 29, 102),
      body: Center(
        child: Column(
          //   crossAxisAlignment:CrossAxisAlignment.center ,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image(
              image: AssetImage('assets/images/m.png'),
              width: 100,
              height: 100,
            )),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                " The City ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
