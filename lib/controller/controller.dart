import 'package:city_app/view/home/widget/bottomNavBar/all_places.dart';
import 'package:city_app/view/home/widget/bottomNavBar/all_places_map.dart';
import 'package:city_app/view/home/widget/bottomNavBar/favourates.dart';
import 'package:city_app/view/home/widget/bottomNavBar/menu.dart';
import 'package:city_app/view/splash_screen/splash_screen.dart';
import 'package:city_app/view/splash_screen/widgets/spalsh_screen_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Controller extends GetxController {
  RxInt currentIndex = 0.obs;
  RxBool status = false.obs;
  Rx<User?> user = Rx<User?>(FirebaseAuth.instance.currentUser);
  final GetStorage box = GetStorage();

  String? get openId => box.read("openId");

  List<Widget> screens = [
    AllPlacesScreen(),
    FavouriteScreen(),
    MapScreen8(),
    MenuScreen(),
  ];
  List<String> titles = ['All Places', 'Favorites', 'Map', 'Menu'];

  Future<void> signIn() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      user.value = userCredential.user;
      String? userId = userCredential.user?.uid;
      if (userId != null) {
        box.write("openId", userId);
      }
    } catch (e) {
      print("Error signing in: $e");
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      user.value = null;
      box.remove("openId"); // Remove OpenID from storage
      Get.offAll(() =>
          SplashScreen()); // Navigate to the SplashScreen or any other screen
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
