import 'package:almaren/widgets/blur_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled/size_extension.dart';

//获取半透明的Appbar
PreferredSizeWidget blurAppBarEx({
  Widget? title,
  Widget? leading,
  double? appHeight,
  List<Widget>? actions,
  double? titleSpacing,
  bool centerTitle = false,
  required BuildContext context,
  required Animation<double> fadeAnimation,
  required ScrollController scrollController,
}) {
  if (actions != null) {
    actions.add(10.horizontalSpace);
  }
  return PreferredSize(
    preferredSize: Size.fromHeight(appHeight ?? kToolbarHeight),
    child: AnimatedBuilder(
      animation: scrollController,
      child: AppBar(
        leading: leading,
        title: title,
        actions: actions,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: titleSpacing ?? (leading != null ? 0 : null),
        centerTitle: centerTitle,
      ),
      builder: (context, child) {
        return BlurWidgetEx(
          enabled: scrollController.hasClients && scrollController.offset > 0,
          child: child,
        );
      },
    ),
  );
}

PreferredSizeWidget blurAppBarFade({
  String? title,
  Widget? leading,
  double? appHeight,
  List<Widget>? actions,
  double? titleSpacing,
  bool centerTitle = false,
  required BuildContext context,
  required Animation<double> fadeAnimation,
  required ScrollController scrollController,
}) {
  if (actions != null) {
    actions.add(10.horizontalSpace);
  }
  return PreferredSize(
    preferredSize: Size.fromHeight(appHeight ?? kToolbarHeight),
    child: AnimatedBuilder(
      animation: scrollController,
      child: AppBar(
        leading: leading,
        title: FadeTransition(
          opacity: fadeAnimation,
          child: Text(
            title ?? "",
            style: Theme.of(context).textTheme.labelLarge!,
          ),
        ),
        actions: actions,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: titleSpacing ?? (leading != null ? 0 : null),
        centerTitle: centerTitle,
      ),
      builder: (context, child) {
        return BlurWidgetEx(
          enabled: scrollController.hasClients && scrollController.offset > 0,
          child: child,
        );
      },
    ),
  );
}
