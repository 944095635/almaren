import 'package:flutter/material.dart';

/// 头像组件
class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.avatar,
  });

  final String avatar;

  @override
  Widget build(BuildContext context) {
    Widget image;
    if (avatar.startsWith("http")) {
      //网络图片
    }
    image = Image.asset(
      avatar,
      fit: BoxFit.cover,
      width: 52,
      height: 50,
      cacheWidth: 200,
    );

    return image;

    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(6),
    //   child: image,
    // );
  }
}
