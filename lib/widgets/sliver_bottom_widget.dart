import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Sliver 底部组件
class SliverBottomWidget extends StatelessWidget {
  const SliverBottomWidget({
    super.key,
    required this.child,
  });

  /// 底部按钮
  static SliverBottomWidget button(String text, {VoidCallback? onPressed}) {
    return SliverBottomWidget(
      child: FilledButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }

  /// 子元素
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final padding = 30.0;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    // debugPrint("padding:" + MediaQuery.of(context).padding.toString());
    // debugPrint("viewPadding:" + MediaQuery.of(context).viewPadding.toString());
    final double bottom;
    if (bottomPadding <= 10) {
      // 键盘开启状态
      bottom = 15;
    } else if (bottomPadding >= 45) {
      // 导航栏开启状态
      bottom = 60;
    } else {
      // 如果安全区域小于最低页面边距则使用页面边距.
      bottom = math.max(bottomPadding, 40);
    }
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(
            left: padding,
            right: padding,
            bottom: bottom,
          ),
          child: child,
        ),
      ),
    );
  }
}
