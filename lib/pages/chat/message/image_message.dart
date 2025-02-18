import 'package:almaren/models/message.dart';
import 'package:almaren/values/sizes.dart';
import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ImageMessage extends StatelessWidget {
  const ImageMessage({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    AssetEntity asset = message.content;
    return ClipRRect(
      borderRadius: Sizes.borderRadiusSmall,
      child: Image(image: AssetEntityImageProvider(asset, isOriginal: true)),
    );
  }
}
