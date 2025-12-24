import 'dart:ui';
import 'package:almaren/theme/colors.dart';
import 'package:flutter/material.dart';

/// 模糊组件
class BlurWidget extends StatelessWidget {
  const BlurWidget({
    super.key,
    this.child,
    this.sigmaX = 12,
    this.sigmaY = 12,
    this.radius = BorderRadius.zero,
  });

  final double sigmaX;

  final double sigmaY;

  final Widget? child;

  final BorderRadius radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: ThemeColors.glassColor,
          ),
          child: child,
        ),
      ),
    );
  }
}
