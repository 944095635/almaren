import 'package:almaren/page/login/login_controller.dart';
import 'package:almaren/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//登录页面
class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 24.h,
          bottom: 34.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Enter your phone number",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            32.verticalSpace,
            AlTextField(
              hintText: "Phone number",
              keyboardType: TextInputType.phone,
              controller: controller.phoneController,
            ),
            const Spacer(),
            Obx(
              () => ElevatedButton(
                onPressed: controller.inputSuccess.value
                    ? controller.checkPhone
                    : null,
                child: const Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
