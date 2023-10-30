import 'package:city_app/controller/services.dart';
import 'package:city_app/utils/bindings.dart';
import 'package:city_app/utils/themes.dart';
import 'package:city_app/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: MyBindings(),
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeService().theme,
        home: const SplashScreen());
  }
}
