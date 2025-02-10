import 'package:almaren/pages/login/login_page.dart';
import 'package:almaren/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled/size_extension.dart';
import 'package:get/get.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                "images/intro_bg.jpg",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 20,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Almaren\nMessenger",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  10.verticalSpace,
                  Text(
                    "Powered by Dream.Machine",
                    style: Theme.of(context).extension<AppTheme>()!.hintMedium,
                  ),
                  20.verticalSpace,
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => const LoginPage());
                    },
                    child: const Text("Continue with phone"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
