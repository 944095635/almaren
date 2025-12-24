import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions {
  /// List 安全内边距(类似SafeArea)
  static EdgeInsets get safePadding {
    final padding = 15.0;
    final bottom = MediaQuery.of(Get.context!).padding.bottom;
    // 如果安全区域小于最低页面边距则使用页面边距.
    return EdgeInsets.only(
      top: padding,
      left: padding,
      right: padding,
      bottom: math.max(bottom, padding),
    );
  }
}
