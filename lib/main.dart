import 'package:almaren/page/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Almaren',
      defaultTransition: Transition.rightToLeft,
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: Colors.white,
        splashFactory: NoSplash.splashFactory,
        appBarTheme: AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        ),
        actionIconTheme: ActionIconThemeData(
          backButtonIconBuilder: (context) => const Icon(CupertinoIcons.back),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        colorScheme: ColorScheme.light(
          primary: Colors.white, //按钮文字颜色 进度条
          surface: Color(0xFF212529), //表面颜色，按钮 等颜色
        ),
        textTheme: TextTheme(
          /// 正文样式
          bodyLarge: TextStyle(fontSize: 20), //  大 - 输入框 (默认字体)
          bodyMedium: TextStyle(fontSize: 16), // 字体 默认

          labelLarge: TextStyle(fontSize: 19), // 按钮 (默认字体)
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Color(0xFF212529),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(
              Size.fromHeight(56),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFF8F9FA),
          hintStyle: TextStyle(color: Color(0xFFADB5BD)),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      builder: FlutterSmartDialog.init(),
      home: const SplashPage(),
    );
  }
}
