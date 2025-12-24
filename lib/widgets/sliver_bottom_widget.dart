import 'package:almaren/theme/dimensions.dart';
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
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }

  /// 子元素
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: Dimensions.safePadding,
          child: child,
        ),
      ),
    );
  }
}
