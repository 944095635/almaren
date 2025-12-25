import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

/// 预览图片页面
class PreviewImagePage extends StatelessWidget {
  const PreviewImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// Hero 动画 Key
    String heroKey = Get.arguments['hero'];

    /// 图片地址(如果是Key，传入之前就要转换为http地址)
    String url = Get.arguments["source"];

    Widget widget;
    bool isNetwork = url.startsWith("http");
    if (url.isNotEmpty) {
      if (isNetwork) {
        widget = SizedBox();
        // widget = ExtendedImage(
        //   //image: CachedNetworkImageProvider(url),
        //   mode: ExtendedImageMode.gesture,
        // );
      } else {
        // 本地文件
        // File file = File.fromUri(Uri.parse(url));
        // widget = ExtendedImage.file(
        //   file,
        //   mode: ExtendedImageMode.gesture,
        // );

        widget = ExtendedImage.asset(
          url,
          mode: ExtendedImageMode.gesture,
        );
      }
    } else {
      widget = const SizedBox();
    }
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      extendBodyBehindAppBar: true,
      body: SizedBox.expand(
        child: Hero(
          tag: heroKey,
          child: widget,
        ),
      ),
    );
  }

  /// 保存图片
  void onTapSave(bool isNetwork, String url) async {
    if (isNetwork) {
      SmartDialog.showLoading();
      // 尝试从缓存中直接保存到相册
      // File file = await ResourceHelper.getFile(url);
      // Map? result = await SaveImageUtils.saveImageFile(
      //   file,
      //   name: FileUtils.getNameByPath(file.path),
      // );
      SmartDialog.dismiss();
      // if (result != null) {
      //   SmartDialog.showToast("保存成功");
      // } else {
      //   SmartDialog.showNotify(msg: "保存失败", notifyType: NotifyType.failure);
      // }
    }
  }
}
