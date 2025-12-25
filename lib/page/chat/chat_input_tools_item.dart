import 'package:almaren/theme/dimensions.dart';
import 'package:flutter/material.dart';

class ChatInputToolsItem extends StatelessWidget {
  const ChatInputToolsItem({
    super.key,
    required this.name,
    required this.icon,
    this.onTap,
  });

  final String name;
  final String icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        spacing: Dimensions.spacing,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              color: const Color(0x7FF0F0F0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              icon,
              width: 24,
              height: 24,
            ),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF333333),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
