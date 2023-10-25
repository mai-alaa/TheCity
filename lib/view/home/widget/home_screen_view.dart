import 'package:city_app/controller/controller.dart';
import 'package:city_app/utils/constants.dart';

import 'package:city_app/view/home/widget/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreenView extends GetView<Controller> {
  HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Obx(() => Text(
              controller.titles[controller.currentIndex.value],
              style: TextStyle(color: KmainColor, fontWeight: FontWeight.bold),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: IconButton(
              icon: Icon(
                Icons.settings,
                color: KmainColor,
              ),
              onPressed: () {
                Get.to(() => SettingPage());
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            //selectedItemColor: const Color.fromARGB(255, 5, 112, 126),
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.currentIndex.value = index;
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_city_outlined),
                  label: 'All Places'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites'),
              // BottomNavigationBarItem(
              //   icon: SizedBox.shrink(), // Empty SizedBox for the icon
              //   label: '',
              // ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.place), label: 'All Map'),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
            ]),
      ),
      body: GetX<Controller>(
        builder: (controller) =>
            controller.screens[controller.currentIndex.value],
      ),
    );
  }
}
