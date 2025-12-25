import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// 输入组件按钮
class ChatInputButton extends StatelessWidget {
  const ChatInputButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  /// 图标
  final String icon;

  /// 点击事件
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
      ),
    );
  }
}
