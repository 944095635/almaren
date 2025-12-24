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
    final bottom = MediaQuery.of(context).padding.bottom;
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(
            left: padding,
            right: padding,
            // 如果安全区域小于最低页面边距则使用页面边距.
            bottom: math.max(bottom, 20),
          ),
          child: child,
        ),
      ),
    );
  }
}
