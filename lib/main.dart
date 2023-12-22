import 'dart:io';
import 'package:almaren/page/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: false,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: 'Almaren',
          theme: ThemeData(
            fontFamily: Platform.isWindows ? "MiSans" : "Poppins",
            scaffoldBackgroundColor: Colors.white,
            splashFactory: NoSplash.splashFactory,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarColor: Colors.transparent,
              ),
              iconTheme: IconThemeData(color: Color(0xFF212529)),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              elevation: 0,
            ),
            bottomAppBarTheme: const BottomAppBarTheme(
              elevation: 0,
              surfaceTintColor: Colors.amber,
              shadowColor: Colors.amber,
            ),
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF212529), //按钮文字颜色 进度条
              background: Colors.white, //背景色 程序背景
              surface: Color(0xFF212529), //表面颜色，按钮 等颜色

              // secondary: Colors.red,
              // onSecondary: Colors.red,
              // primary: Colors.red,
              // onPrimary: Colors.red,
              // surface: Colors.red,
              // onSurface: Colors.red,
              // surfaceTint: Colors.red,
              // inverseSurface: Colors.red,
              // onInverseSurface: Colors.red,
            ),
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            textTheme: TextTheme(
              //默认按钮字体大小

              //默认的标题 样式
              titleLarge: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w300,
              ),
              titleMedium: TextStyle(fontSize: 18.sp),
              titleSmall: TextStyle(fontSize: 16.sp),

              //默认的 提示文本 样式
              displayLarge:
                  TextStyle(fontSize: 20.sp, color: const Color(0xFFADB5BD)),
              displayMedium:
                  TextStyle(fontSize: 16.sp, color: const Color(0xFFADB5BD)),
              displaySmall:
                  TextStyle(fontSize: 14.sp, color: const Color(0xFFADB5BD)),

              //内容文本
              bodyLarge: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xFF212529),
                fontFamily: "",
              ),
              bodyMedium:
                  TextStyle(fontSize: 18.sp, color: const Color(0xFF212529)),
              bodySmall:
                  TextStyle(fontSize: 12.sp, color: const Color(0xFFADB5BD)),

              labelLarge:
                  TextStyle(fontSize: 20.sp, color: const Color(0xFF212529)),

              headlineMedium: const TextStyle(fontSize: 88),
              labelMedium: const TextStyle(fontSize: 88),
              labelSmall: const TextStyle(fontSize: 88),
              headlineSmall: const TextStyle(fontSize: 88),
            ),
            listTileTheme: ListTileThemeData(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 24.w, vertical: 4.h),
              titleTextStyle:
                  TextStyle(fontSize: 18.sp, color: const Color(0xFF212529)),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              // filled: true,
              // fillColor: const Color(0xFFF2F2F2),
              // hintStyle:
              //     TextStyle(color: const Color(0xFFADB5BD), fontSize: 14.sp),
              border: InputBorder.none,
              // contentPadding:
              //     EdgeInsets.symmetric(vertical: 19.h, horizontal: 14.w),
            ),
            textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Color(0xFF212529)),
              ),
            ),
            iconButtonTheme: const IconButtonThemeData(
              style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
                surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size(0, 56.h)),
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r)),
                ),
              ),
            ),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashPage(),
          defaultTransition: Transition.rightToLeft,
          builder: EasyLoading.init(
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            ),
          ),
        );
      },
    );
  }
}
