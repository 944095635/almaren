import 'package:almaren/models/message.dart';
import 'package:almaren/values/sizes.dart';
import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xFFE9ECEF),
        borderRadius: Sizes.borderRadiusSmall,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(message.content),
      ),
    );
  }
}
