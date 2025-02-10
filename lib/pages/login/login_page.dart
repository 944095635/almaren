import 'package:almaren/pages/login/login_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled/size_extension.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginLogic> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginLogic());
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Enter your phone number",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              30.verticalSpace,
              TextField(
                controller: controller.phoneController,
                decoration: InputDecoration(hintText: "Phone number"),
              ),
              Spacer(),
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
      ),
    );
  }
}
