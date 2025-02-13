import 'dart:ui';
import 'package:almaren/values/colors.dart';
import 'package:flutter/material.dart';

/// 模糊组件
class BlurWidget extends StatelessWidget {
  const BlurWidget({
    super.key,
    this.child,
    this.sigmaX = 15,
    this.sigmaY = 15,
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
      child: BackdropFilter.grouped(
        filter: ImageFilter.blur(
          sigmaX: sigmaX,
          sigmaY: sigmaY,
        ),
        child: child,
      ),
    );
  }
}

/// 模糊组件
class BlurWidgetEx extends StatelessWidget {
  const BlurWidgetEx({
    super.key,
    this.child,
    this.sigmaX = 12,
    this.sigmaY = 12,
    this.blurRadius = 0,
    this.hasTopBorder = false,
    this.hasBottomBorder = false,
    this.radius = BorderRadius.zero,
    this.enabled = true,
  });

  final double sigmaX;

  final double sigmaY;

  final Widget? child;

  final double blurRadius;

  final BorderRadius radius;

  final bool hasTopBorder;

  final bool hasBottomBorder;

  /// 是否启用背景模糊
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: blurRadius != 0
            ? [
                BoxShadow(
                  color: const Color.fromRGBO(60, 60, 60, 0.15),
                  blurRadius: blurRadius,
                  blurStyle: BlurStyle.outer,
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter.grouped(
          enabled: enabled,
          filter: ImageFilter.blur(
            sigmaX: sigmaX,
            sigmaY: sigmaY,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: radius,
              border: Border(
                top: hasTopBorder
                    ? const BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                      )
                    : BorderSide.none,
                bottom: hasBottomBorder
                    ? const BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                      )
                    : BorderSide.none,
              ),
              color: ThemeColors.glassColor,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
