import 'package:flutter/material.dart';

class Dimensions {
  /// 元素间隔 8
  static double spacing = 8;

  /// 页面内边距 15
  static double pagePadding = 15;

  /// 页面内边距 16 16 16 16
  static EdgeInsets pageAllPadding = EdgeInsets.all(15);

  /// 圆角值
  static const BorderRadius borderRadiusSmall = BorderRadius.all(
    Radius.circular(8),
  );

  /// 消息内容边距 12.h + 15.w
  static EdgeInsets messageContentPadding = EdgeInsets.symmetric(
    vertical: 12,
    horizontal: 15,
  );
}
