import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_send/page/login_page.dart';
import 'package:my_send/page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
