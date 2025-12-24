import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Body 安全区域 + 页边距
/// 底部会使用安全区域或者页边距[较大的值]
class BodySafeWidget extends StatelessWidget {
  const BodySafeWidget({
    super.key,
    this.top = true,
    required this.child,
  });

  final Widget child;

  /// 是否拥有顶部边距
  final bool top;

  /// 底部按钮
  static BodySafeWidget button(String text, {VoidCallback? onPressed}) {
    return BodySafeWidget(
      top: false,
      child: FilledButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final padding = 30.0;
    final bottom = MediaQuery.of(context).padding.bottom;
    return Padding(
      padding: EdgeInsets.only(
        top: top ? padding : 0,
        left: padding,
        right: padding,
        // 如果安全区域小于最低页面边距则使用页面边距.
        bottom: math.max(bottom, 50),
      ),
      child: child,
    );
  }
}
