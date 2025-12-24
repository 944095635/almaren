import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _init();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void _init() async {
    int platformId;
    if (Platform.isAndroid) {
      platformId = IMPlatform.android;
    } else if (Platform.isIOS) {
      platformId = IMPlatform.ios;
    } else {
      platformId = IMPlatform.web;
    }

    final success = await OpenIM.iMManager.initSDK(
      platformID: 0, // 平台，参照IMPlatform类,
      apiAddr: "http://dmskin.com:10005", // SDK的API接口地址。
      wsAddr: "", // SDK的web socket地址
      dataDir:
          '', // 数据存储路径。如：var apath =(await getApplicationDocumentsDirectory()).path
      //objectStorage: 'cos', // 图片服务器默认'cos'
      logLevel: 6, // 日志等级，默认值6
      listener: OnConnectListener(
        onConnectSuccess: () {
          // 已经成功连接到服务器
        },
        onConnecting: () {
          // 正在连接到服务器，适合在 UI 上展示“正在连接”状态。
        },
        onConnectFailed: (code, errorMsg) {
          // 连接服务器失败，可以提示用户当前网络连接不可用
        },
        onUserTokenExpired: () {
          // 登录票据已经过期，请使用新签发的 UserSig 进行登录。
        },
        onKickedOffline: () {
          // 当前用户被踢下线，此时可以 UI 提示用户“您已经在其他端登录了当前账号，是否重新登录？”
        },
      ),
    );
  }
}
