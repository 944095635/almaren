import 'package:almaren/page/frame/frame_page.dart';
import 'package:almaren/page/intro/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 启动页
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  void _init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("init") != null) {
      Get.offAll(() => const FramePage(), transition: Transition.fadeIn);
    } else {
      // 超高清图像，图片比较大，预加载
      await precacheImage(
        const AssetImage("assets/images/intro_bg.jpg"),
        Get.context!,
      );
      Get.offAll(() => const IntroPage(), transition: Transition.fadeIn);
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
