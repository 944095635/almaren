import 'package:almaren/page/intro/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 启动页
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  void _init() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("userId") != null) {
      //Get.offAll(() => const FramePage());
    } else {
      //precacheImage(const AssetImage("images/intro_bg.jpg"), Get.context!);
      Get.offAll(() => const IntroPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    _init();
    return Scaffold(
      body: Center(
        child: Text(
          "Almaren",
          style: TextStyle(
            fontSize: 65,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
