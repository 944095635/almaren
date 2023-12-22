import 'package:almaren/page/login/login_controller.dart';
import 'package:almaren/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//登录页面 - 验证码
class LoginCodePage extends GetView<LoginController> {
  const LoginCodePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              "Enter code",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            8.verticalSpace,
            Text(
              "We sent it to ${controller.phoneController.text}",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            32.verticalSpace,
            AlTextField(
              hintText: "Code number",
              controller: controller.codeController,
              keyboardType: TextInputType.phone,
            ),
            const Spacer(),
            Obx(
              () => ElevatedButton(
                onPressed:
                    controller.inputSuccess.value ? controller.checkCode : null,
                child: const Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
