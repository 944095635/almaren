import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 滚动动画的App标题
mixin AppTitleMixin on GetxController {
  var titleOpacity = 0.0.obs;

  late ScrollController scrollController = ScrollController()
    ..addListener(() {
      //debugPrint(scrollController.offset.toString());
      if (scrollController.offset >= 50) {
        titleOpacity.value = 1;
      } else {
        if (titleOpacity.value != 0 && scrollController.offset > 0) {
          titleOpacity.value = scrollController.offset / 50;
        } else {
          titleOpacity.value = 0;
        }
      }
    });

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
