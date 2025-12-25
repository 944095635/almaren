import 'dart:io';

import 'package:almaren/page/frame/frame_page.dart';
import 'package:almaren/page/intro/intro_page.dart';
import 'package:almaren/utils/platform_utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 启动页
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  void _init() async {
    await requestPhonePermission();
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

  /// 申请手机权限
  static Future requestPhonePermission() async {
    /// 无论任何系统，任何机型都要申请的权限
    final List<Permission> permissionList = List.from([
      // 无论任何系统，任何机型都要申请的权限
      // 相机   📷 权限
      Permission.camera,
      // 麦克风 🎤 权限
      Permission.microphone,
      // 通知   📢 权限
      Permission.notification,
    ], growable: true);

    if (Platform.isAndroid) {
      /// 针对安卓系统
      final AndroidDeviceInfo deviceInfo =
          await PlatformUtils.getAndroidDeviceInfo();
      // debugPrint(
      //   "安卓(deviceInfo.version.sdkInt) ${deviceInfo.version.sdkInt}",
      // );

      if (deviceInfo.version.sdkInt <= 32) {
        /// api 32及以下 申请 storage
        permissionList.add(Permission.storage);
      } else {
        /// api 32以上  申请 photos
        permissionList.add(Permission.photos);
        permissionList.add(Permission.videos);
      }

      /// 悬浮窗权限
      permissionList.add(Permission.systemAlertWindow);
    } else {
      /// 针对非安卓系统
      permissionList.add(Permission.photos);
      permissionList.add(Permission.videos);
    }

    // 申请权限
    Map<Permission, PermissionStatus> statuses = await permissionList.request();
    debugPrint("申请权限的结果:");
    for (var element in statuses.entries) {
      debugPrint("${element.key} : ${element.value}");
    }
  }
}
