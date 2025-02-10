import 'package:almaren/values/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled/size_extension.dart';
import 'package:get/get.dart';

/// 各类系统提示和弹出层
class Dialogs {
  static Future<bool?> showAsk(String title, String msg) {
    return Get.bottomSheet(
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: Sizes.borderRadiusBig,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  20.verticalSpace,
                  Padding(
                    padding: Sizes.contentHorizontalPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          title,
                          style:
                              Theme.of(Get.context!).textTheme.headlineMedium,
                        ),
                        20.verticalSpace,
                        Text(msg),
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: Sizes.buttonHorizontalPadding,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.backLegacy(result: true);
                      },
                      child: Text("Confirm"),
                    ),
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: Sizes.buttonHorizontalPadding,
                    child: TextButton(
                      onPressed: () {
                        Get.backLegacy(result: false);
                      },
                      child: Text("Cancel"),
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        ),
        shape: CircleBorder());
  }
}
