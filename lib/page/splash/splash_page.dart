// ignore_for_file: unused_local_variable

import 'package:almaren/page/frame/frame_page.dart';
import 'package:almaren/page/guide/guide_page.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    initPage(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Almaren",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  void initPage(BuildContext context) async {
    EasyRefresh.defaultHeaderBuilder = () => const ClassicHeader(
          // dragText: '下拉刷新',
          // armedText: '释放开始',
          // readyText: '刷新中...',
          // processingText: '刷新中...',
          // processedText: '成功了',
          // noMoreText: '没有更多',
          // failedText: '失败了',
          // messageText: '最后更新于 %T',
          //safeArea: true,
          position: IndicatorPosition.locator,
        );
    EasyRefresh.defaultFooterBuilder = () => const ClassicFooter(
          // dragText: '上拉加载',
          // armedText: '释放开始',
          // readyText: '加载中...',
          // processingText: '加载中...',
          // processedText: '成功了',
          // noMoreText: '没有更多',
          // failedText: '失败了',
          // messageText: '最后更新于 %T',
          // triggerWhenReach: false,
          // triggerWhenRelease: false,
          //triggerOffset: 0,
          //safeArea: false,
          position: IndicatorPosition.locator,
        );

    // ..indicatorWidget = LoadingAnimationWidget.staggeredDotsWave(
    //   color: Colors.white,
    //   size: 30,
    // );

    EasyLoading.instance
      ..dismissOnTap = true
      ..indicatorType = EasyLoadingIndicatorType.ripple
      ..toastPosition = EasyLoadingToastPosition.bottom;

    await Future.delayed(const Duration(milliseconds: 800));
    // IMService.loginCallback = loginCallback;
    // IMService.logoutCallback = logoutCallback;
    // IMService.initIMClient();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("userId") != null && prefs.getString("token") != null) {
      //开始连接服务
      String userId = prefs.getString("userId")!;
      //userId = "9r6qmws2k";
      String token = prefs.getString("token")!;
      // token =
      //     "dscNfnleFKVdl4iUt6EGcXjiH3yiUScUe5biSfhBGBVlMHsdJwFXgdfVRdsl0gGXCxZpSC27q+ap9eHC2pOHg2zuU9doAZeRtp5njGaxFh25FTYLicRuMqVsuOFOdlP2qBgrjaXv9/QKydJ7KQFYIwIMtSIxRFDcZpuVSVaKEPo=";
      //await Imclient.connect(Config.imHost, userId, token);
      loginCallback();
    } else {
      logoutCallback();
    }
  }

  //登录成功回调
  loginCallback() async {
    Get.off(() => const FramePage());
  }

  //退出账号回调
  logoutCallback() async {
    await precacheImage(const AssetImage("images/splash/bg.jpg"), Get.context!);
    Get.off(() => const GuidePage(), transition: Transition.fadeIn);
  }
}
