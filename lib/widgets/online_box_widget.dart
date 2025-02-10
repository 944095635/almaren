import 'package:almaren/values/colors.dart';
import 'package:flutter/material.dart';

class OnlineBoxWidget extends StatelessWidget {
  const OnlineBoxWidget({
    super.key,
    required this.online,
    required this.child,
  });

  final bool online;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: ImageFiltered(
        imageFilter: const ColorFilter.mode(
          Colors.grey,
          BlendMode.color,
        ),
        enabled: !online,
        child: Stack(
          children: [
            child,
            Positioned(
              right: 2,
              bottom: 2,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeColors.greenColor,
                  // color: online ? ThemeColors.greenColor : ThemeColors.greyColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
