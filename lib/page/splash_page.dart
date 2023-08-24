import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_send/global_controller.dart';
import 'package:my_send/page/home_page.dart';
import 'package:my_send/page/login_page.dart';
import 'package:my_send/personDB.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashtime = 2;
  final c = Get.put(GlobalController());

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      await LocalDatabase().readMyData();

      if (MyData.length != 0) {
        Get.offAll(const HomePage(), transition: Transition.circularReveal, duration: const Duration(seconds: 2));
      } else {
        Get.offAll(LoginPage());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(width: 206, height: 178, "asset/logo.jpg"),
      ),
    );
  }
}
