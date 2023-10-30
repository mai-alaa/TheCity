import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [Image(image: AssetImage('assets/images/b.png'))],
      ),
    );
  }
}
