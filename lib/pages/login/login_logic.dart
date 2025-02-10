import 'package:almaren/pages/frame/frame_page.dart';
import 'package:almaren/utils/keyboard_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginLogic extends GetxController {
  var inputSuccess = false.obs;

  late TextEditingController phoneController;

  bool isCheckPhone = false;

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    phoneController.addListener(() {
      inputSuccess.value = phoneController.text.isNotEmpty;
    });
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
        shared.setString("userId", phone); //9r6qmws2k
        Get.offAll(() => const FramePage());
        //EasyLoading.showSuccess("success.");
        //} else {
        // EasyLoading.showInfo(status.msg);
        //}
      }
      inputSuccess.value = isCheckPhone = false;
    }
  }
}
