import 'package:almaren/values/colors.dart';
import 'package:almaren/widgets/blur_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled/size_extension.dart';

//获取半透明的Appbar
PreferredSizeWidget blurAppBar({
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
  PreferredSize? bottom,
  bool centerTitle = true,
}) {
  if (actions != null) {
    actions.add(10.horizontalSpace);
  }
  return PreferredSize(
    preferredSize: Size(0, kToolbarHeight),
    child: BlurWidgetEx(
      backgroundColor: ThemeColors.glassColor,
      child: AppBar(
        title: title,
        titleSpacing: leading != null ? 0 : null,
        centerTitle: centerTitle,
        leading: leading,
        leadingWidth: 80,
        actions: actions,
        bottom: bottom,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
      ),
    ),
  );
}
