import 'package:almaren/pages/frame/frame_page.dart';
import 'package:almaren/pages/intro/intro_page.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Center(
        child: Text(
          "Almaren",
          style: TextStyle(
            fontSize: 65,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// 初始化数据
  void initData() async {
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

    // SmartDialog.config
    //   // ..custom = SmartConfigCustom(
    //   //   maskColor: Colors.black.withOpacity(0.35),
    //   //   useAnimation: true,
    //   // )
    //   // ..attach = SmartConfigAttach(
    //   //   animationType: SmartAnimationType.scale,
    //   //   usePenetrate: false,
    //   // )
    //   .loading = SmartConfigLoading(
    //     clickMaskDismiss: false,
    //     leastLoadingTime: const Duration(milliseconds: 0),
    //     maskWidget: Text("data")
    //   );

    await Future.delayed(const Duration(milliseconds: 1500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("userId") != null) {
      loginCallback();
    } else {
      introCallback();
    }
  }

  //登录成功回调
  loginCallback() async {
    Get.off(() => const FramePage());
  }

  //初始化回调
  introCallback() async {
    precacheImage(const AssetImage("images/intro_bg.jpg"), Get.context!);
    Get.off(() => const IntroPage(), transition: Transition.fadeIn);
  }
}
