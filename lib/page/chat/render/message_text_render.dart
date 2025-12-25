import 'package:almaren/models/message.dart';
import 'package:flutter/material.dart';

/// 文本渲染组件
class MessageTextRender extends StatelessWidget {
  const MessageTextRender(this.message, {super.key});

  /// 消息实体
  final TextMessage message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message.text,
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF3C3C3C),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
