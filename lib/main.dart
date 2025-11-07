import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controllers/theme_controllers.dart';
import 'utils/app_themes.dart';
import 'view/splash_screen.dart';

void main() async {
  await GetStorage.init();
  Get.put(ThemeControllers());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeControllers>();
    return GetMaterialApp(
      title: 'Fashion Store',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: themeController.theme,
      defaultTransition: Transition.fade,
      home: const SplashScreen(),
    );
  }
}