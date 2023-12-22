import 'dart:ui';

import 'package:almaren/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

//获取半透明的Appbar
PreferredSizeWidget getAppBar({
  double appHeight = 80,
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
  PreferredSize? bottom,
}) {
  if (actions != null) {
    actions.add(8.horizontalSpace);
  }
  return PreferredSize(
    preferredSize: Size(0, appHeight),
    child: getFilterWidget(
      child: AppBar(
        title: title,
        titleSpacing: 0,
        toolbarHeight: appHeight,
        leading: leading,
        leadingWidth: 80,
        actions: actions,
        bottom: bottom,
        //bottom: getTitle(context, "Chats"),
      ),
    ),
  );
}

PreferredSizeWidget getTitle(BuildContext context, String title) {
  return PreferredSize(
    preferredSize: const Size(0, 50),
    child: Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 40),
      ),
    ),
  );
}

//获取数字盒子
Widget getCountBox(int count) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(3.r),
      color: Theme.of(Get.context!).colorScheme.surface,
    ),
    child: Text(
      count.toString(),
      style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(
            fontSize: 12.sp,
            fontFamily: "",
            color: Colors.white,
          ),
    ),
  );
}

/* 预览展位图 */
Widget getLoadingView() {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (content, index) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Shimmer.fromColors(
          baseColor: const Color(0xFFF2F2F2),
          highlightColor: const Color(0xFFFFFFFF),
          period: const Duration(seconds: 2),
          child: Row(
            children: [
              Container(
                width: 52.w,
                height: 50.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF3F3F3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: Container(
                  width: 52.w,
                  height: 50.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF3F3F3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

//在线标记盒子
Widget getOnlineBox(
  Widget child, {
  bool online = false,
}) {
  return Stack(
    children: [
      child,
      Positioned(
        right: 2,
        bottom: 2,
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: online ? AlColors.greenColor : AlColors.greyColor,
          ),
        ),
      )
    ],
  );
}

/*玻璃容器*/
Widget getFilterWidget({
  Widget? child,
  double sigmaX = 12,
  double sigmaY = 12,
  bool hasColor = true, //是否具备颜色
  EdgeInsets? padding,
}) {
  return ClipRect(
    //背景模糊化
    child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigmaX,
          sigmaY: sigmaY,
        ),
        child: Container(
          color: hasColor ? AlColors.glassColor : null,
          padding: padding,
          child: child,
        )),
  );
}

Widget getListTitle(String title) {
  return Container(
    padding: EdgeInsets.only(left: 24.w),
    alignment: Alignment.centerLeft,
    child: Text(
      title,
      style:
          Theme.of(Get.context!).textTheme.labelLarge!.copyWith(fontSize: 40),
    ),
  );
}
