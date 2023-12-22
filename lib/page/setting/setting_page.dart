import 'package:almaren/page/chats/chats_controller.dart';
import 'package:almaren/page/setting/notif_page.dart';
import 'package:almaren/page/setting/save_media.dart';
import 'package:almaren/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

/* 设置页面 */
class SettingPage extends GetView<ChatsController> {
  const SettingPage({super.key});

  final String title = "Settings";

  @override
  Widget build(BuildContext context) {
    Get.put(ChatsController());
    return Scaffold(
      appBar: getAppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("images/home/logout.svg"),
          ),
        ],
      ),
      body: ListView(
        children: [
          getListTitle(title),
          20.verticalSpace,
          getItem(
            "Saved media",
            onPressed: () {
              Get.to(() => const SaveMediaPage());
            },
          ),
          getItem(
            "Notifications",
            onPressed: () {
              Get.to(() => const NotifPage());
            },
          ),
          getItem("Profile"),
          getItem("Privacy and security"),
        ],
      ),
    );
  }

  Widget getItem(String title, {Function()? onPressed}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
      onTap: onPressed,
      title: Text(title),
    );
  }
}
