import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark/Config/PagePath.dart';
import 'package:sampark/Config/Theme.dart';
import 'package:sampark/Pages/Profile/ProfilePage.dart';
import 'package:sampark/Pages/SplashPage/SplashPage.dart';
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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sampark',
        theme: lightTheme,
        getPages: pagePath,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        home: const SplashPage());
  }
}
