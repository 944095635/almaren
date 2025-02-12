import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 滚动动画的App标题
mixin AppBarMixin on GetxController {
  /// 控制Appbar标题透明度的控制器
  AnimationController? fadeController;

  /// 透明度动画参数
  late Animation<double> fadeAnimation;
  
  /// 滚动列表的控制器
  late ScrollController scrollController = ScrollController()
    ..addListener(() {
      if (scrollController.offset >= 50) {
        //titleOpacity.value = 1;
        fadeController?.forward();
      } else {
        if (fadeAnimation.value != 0 && scrollController.offset > 0) {
          var fade = scrollController.offset / 50;
          fadeController?.animateTo(fade);
        } else {
          //titleOpacity.value = 0;
          fadeController?.reverse();
        }
      }
    });

  @override
  void onClose() {
    fadeController?.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
