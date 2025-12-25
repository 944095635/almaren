import 'dart:io';
import 'package:almaren/theme/colors.dart';
import 'package:get/get.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

/// 选择资源的的扩展
class PickAssetsUtils {
  /// 选择资源
  static Future<List<AssetEntity>?> pickAssets({
    int? maxAssets, // 最大选择数量
    required RequestType type, // 选择类型
    SpecialPickerType? specialPickerType, // 特殊选择类型
    AssetSelectPredicate<AssetEntity>? selectPredicate,
  }) async {
    return AssetPicker.pickAssets(
      Get.context!,
      pickerConfig: AssetPickerConfig(
        requestType: type,
        selectPredicate: selectPredicate,
        specialPickerType: specialPickerType,
        themeColor: ThemeColors.themeColor,
        maxAssets: maxAssets ?? defaultMaxAssetsCount,
        // selectPredicate: (context, asset, isSelected) {
        //   return true;
        // },
      ),
    ).onError((error, stackTrace) {
      SmartDialog.showToast("请先开启相册权限");
      return null;
    });
  }

  /// 选择资源(PC客户端)
  static void pickPCAssets() {}

  /// 拍摄资源 - 图片 或 视频
  static Future<AssetEntity?> pickAssetsFromCamera() async {
    return CameraPicker.pickFromCamera(
      Get.context!,
      locale: Get.locale,
      pickerConfig: CameraPickerConfig(
        enableAudio: true,
        enableRecording: true,
        enableScaledPreview: false,
        maximumRecordingDuration: 60.seconds,
        // 分辨率，IOS上面 4K会闪退
        resolutionPreset: Platform.isIOS
            ? ResolutionPreset.veryHigh
            : ResolutionPreset.high,
        preferredFlashMode: FlashMode.auto,
      ),
    ).onError(
      (error, stackTrace) {
        SmartDialog.showToast("请先开启相机权限");
        return null;
      },
    );
  }
}
