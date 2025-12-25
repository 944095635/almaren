import 'dart:io';

import 'package:almaren/models/message.dart';
import 'package:almaren/theme/dimensions.dart';
import 'package:flutter/material.dart';

/// 图片渲染组件
class MessageImageRender extends StatelessWidget {
  const MessageImageRender(this.message, {super.key});

  /// 缩略图
  final ImageMessage message;

  @override
  Widget build(BuildContext context) {
    // Widget image;
    // image = const AvatrPlaceholder(100);
    // String imageUrl = "assets/images/register/female.png";
    /// 底图
    // return Image.asset(
    //   imageUrl,
    // );

    double dpiScale = MediaQuery.of(context).devicePixelRatio;

    /// 缓存宽度
    int cacheWidth = (200 * dpiScale).toInt();

    Widget image;
    if (message.image.startsWith("assets/")) {
      image = Image.asset(
        message.image,
        cacheWidth: cacheWidth,
        // memCacheWidth: cacheWidth,
        // errorWidget: (context, url, error) {
        //   return const Icon(Icons.error);
        // },
      );
    } else {
      image = Image.file(
        File(message.image),
        cacheWidth: cacheWidth,
        // memCacheWidth: cacheWidth,
        // errorWidget: (context, url, error) {
        //   return const Icon(Icons.error);
        // },
      );
    }

    /// 图片组件
    image = ClipRRect(
      borderRadius: Dimensions.borderRadiusSmall,
      child: Hero(
        tag: message.heroKey,
        child: image,
      ),
    );

    return AspectRatio(
      aspectRatio: message.w / message.h,
      child: image,
    );
  }
}
