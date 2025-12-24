import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:almaren/page/login/login_logic.dart';
import 'package:almaren/widgets/sliver_bottom_widget.dart';

class LoginPage extends GetView<LoginLogic> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginLogic());

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(textTheme),
    );
  }

  Widget _buildBody(TextTheme textTheme) {
    return KeyboardDismissOnTap(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Enter your phone number",
                    style: textTheme.bodyLarge,
                  ),
                  TextField(
                    cursorColor: Colors.black,
                    autofocus: true,
                    controller: controller.phoneController,
                    decoration: InputDecoration(hintText: "Phone number"),
                  ),
                ],
              ),
            ),
          ),

          SliverBottomWidget(
            child: Obx(
              () => ElevatedButton(
                onPressed: controller.inputOK.value
                    ? controller.checkPhone
                    : null,
                child: Text("Continue"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
