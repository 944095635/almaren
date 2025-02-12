import 'package:almaren/dialogs/dialogs.dart';
import 'package:almaren/mixin/appbar_mixin.dart';
import 'package:almaren/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsLogic extends GetxController
    with AppBarMixin, GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    super.onInit();
    fadeController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(fadeController!);
  }

  /// 注销登录的账号
  void logout() async {
    bool? result = await Dialogs.showAsk(
        "Log Out", "Do you want to log out of the current account?");
    if (result == true) {
      var shared = await SharedPreferences.getInstance();
      shared.clear();

      Get.offAll(() => SplashPage(), transition: Transition.downToUp);
    }
  }
}
