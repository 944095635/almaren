import 'package:flutter/material.dart';

class Sizes {
  /// 圆角值
  static const BorderRadius borderRadiusSmall =
      BorderRadius.all(Radius.circular(6));
  static const BorderRadius borderRadius =
      BorderRadius.all(Radius.circular(12));
  /// 圆角值 - 巨大
  static const BorderRadius borderRadiusBig =
      BorderRadius.all(Radius.circular(20));

  /// 页面内容的边距 - 值
  static const double contentPaddingValue = 24.0;
  static const contentPadding =
      EdgeInsets.symmetric(horizontal: 24, vertical: 20);
  static const contentHorizontalPadding = EdgeInsets.symmetric(horizontal: 24);

  /// 页面按钮的边距 - 值
  static const double buttonPaddingValue = 20.0;

  /// 页面按钮的边距 - 四边距
  static const buttonPadding = EdgeInsets.all(20);
  static const buttonHorizontalPadding = EdgeInsets.symmetric(horizontal: 20);
}
