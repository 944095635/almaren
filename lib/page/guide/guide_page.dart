import 'package:almaren/page/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//引导
class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 484.h,
            child: Image.asset(
              "images/splash/bg.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 24.h, bottom: 34.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Almaren\nMessenger",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  8.verticalSpace,
                  Text(
                    "Powered by Dream.Machine",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(const LoginPage());
                    },
                    child: const Text("Continue with phone"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
