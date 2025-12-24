import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:almaren/page/frame/frame_page.dart';
import 'package:almaren/utils/keyboard_utils.dart';

class LoginLogic extends GetxController {
  /// 输入是否正确
  final inputOK = false.obs;

  /// 输入手机控制器
  late TextEditingController phoneController = TextEditingController();

  /// 手机检查通过
  bool isCheckPhone = false;

  @override
  void onInit() {
    super.onInit();
    phoneController.addListener(() {
      inputOK.value = phoneController.text.isNotEmpty;
    });
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  //检查手机号码 正确的话 进入 验证页面
  void checkPhone() async {
    KeyboardUtils.hide();
    if (!isCheckPhone) {
      isCheckPhone = true;
      String phone = phoneController.text;
      if (phone.isNotEmpty) {
        SmartDialog.showLoading(msg: "waiting..");
        await Future.delayed(const Duration(seconds: 1));
        //ServiceResult status = await AlService.sendCode(phone);
        SmartDialog.dismiss();
        //if (status.success) {
        var shared = await SharedPreferences.getInstance();
        shared.setString("init", phone); //9r6qmws2k
        Get.offAll(() => const FramePage());
      }
    }
  }
}
