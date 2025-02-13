import 'package:almaren/pages/splash/splash_page.dart';
import 'package:almaren/styles/theme.dart';
import 'package:almaren/values/colors.dart';
import 'package:almaren/values/sizes.dart';
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
        useMaterial3: true,
        fontFamily: "Poppins",
        scaffoldBackgroundColor: Colors.white,
        splashFactory: NoSplash.splashFactory,
        appBarTheme: AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            //底部导航栏
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarContrastEnforced: false, //底部强制反转色
          ),
        ),
        colorScheme: ColorScheme.light(
          primary: Color(0xFF212529), //按钮文字颜色 进度条
          surface: Color(0xFF212529), //表面颜色，按钮 等颜色
        ),
        textTheme: TextTheme(
          /// 最大的显示样式 ，作为屏幕上最大的文本 重要的文字或数字。
          displayLarge: TextStyle(),
          displayMedium: TextStyle(fontSize: 35),
          displaySmall: TextStyle(),

          /// 标题样式 (小于display)
          headlineLarge: TextStyle(fontSize: 30),
          headlineMedium: TextStyle(fontSize: 25),
          headlineSmall: TextStyle(),

          /// 标题样式(小于headline)
          titleLarge: TextStyle(fontSize: 20), // AppBar Title (默认字体)
          titleMedium: TextStyle(),
          titleSmall: TextStyle(),

          /// 正文样式
          bodyLarge: TextStyle(fontSize: 20), //  大 - 输入框 (默认字体)
          bodyMedium: TextStyle(fontSize: 16), // 字体 默认
          bodySmall: TextStyle(), //  小 (部分水印提示信息)
          /// 标签样式 标签样式是较小的实用样式，用于UI区域  例如组件内部的文本 或 内容正文，如标题。
          labelLarge: TextStyle(fontSize: 20), // 按钮 (默认字体)
          labelMedium: TextStyle(),
          labelSmall: TextStyle(),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          elevation: 0,
          color: Colors.transparent,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size.fromHeight(56)),
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size.fromHeight(56)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: ThemeColors.bgColor,
          hintStyle: TextStyle(color: ThemeColors.hintColor),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: Sizes.borderRadius,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: Sizes.borderRadius,
          ),
        ),
        extensions: <ThemeExtension<dynamic>>[
          const AppTheme(hintMedium: TextStyle(color: ThemeColors.hintColor)),
        ],
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: "Poppins",
        scaffoldBackgroundColor: Colors.black,
        splashFactory: NoSplash.splashFactory,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      builder: FlutterSmartDialog.init(),
      home: const SplashPage(),
    );
  }
}
