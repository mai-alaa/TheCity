import 'package:city_app/view/home/widget/bottomNavBar/all_places.dart';
import 'package:city_app/view/home/widget/bottomNavBar/all_places_map.dart';
import 'package:city_app/view/home/widget/bottomNavBar/favourates.dart';
import 'package:city_app/view/home/widget/bottomNavBar/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  RxInt currentIndex = 0.obs;
  RxBool status = false.obs;

  List<Widget> screens = [
    AllPlacesScreen(),
    FavouriteScreen(),
    MapScreen8(),
    MenuScreen(),
  ];
  List<String> titles = ['All Places', 'Favorites', 'Map', 'Menu'];
}
