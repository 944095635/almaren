import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

/// 平台支持
class PlatformUtils {
  /// 设备信息
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  /// 是否PC端
  static bool isDesktop =
      !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);

  /// 是否手机端
  static bool isPhone = Platform.isAndroid || Platform.isIOS;

  /// 获取安卓设备信息
  static Future<AndroidDeviceInfo> getAndroidDeviceInfo() {
    return _deviceInfo.androidInfo;
  }

  /// 获取设备ID
  static Future<String> getDeviceId() async {
    String? deviceId;
    if (kIsWeb) {
      deviceId = "WebId";
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      deviceId = androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor;
      debugPrint("DeviceId ios:$deviceId");
    } else if (Platform.isWindows) {
      WindowsDeviceInfo info = await _deviceInfo.windowsInfo;
      deviceId = info.deviceId;
    } else if (Platform.isMacOS) {
      MacOsDeviceInfo info = await _deviceInfo.macOsInfo;
      deviceId = info.systemGUID;
      debugPrint("DeviceId mac:$deviceId");
    }
    return deviceId ?? "tempId";
  }
}
