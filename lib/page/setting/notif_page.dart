import 'package:almaren/page/chats/chats_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/* 设置 - 通知 */
class NotifPage extends GetView<ChatsController> {
  const NotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatsController());
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 26.h, bottom: 24.h, left: 26.w),
            child: Text(
              "Notifications",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 40),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 32.w),
            onTap: () {},
            title: const Text("Show notifications"),
            trailing: CupertinoSwitch(value: true, onChanged: (e) {}),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 32.w),
            onTap: () {},
            title: const Text("Message preview"),
            trailing: CupertinoSwitch(value: false, onChanged: (e) {}),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 32.w),
            onTap: () {},
            title: const Text("Sound"),
            trailing: Text(
              "In the end",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 32.w),
            onTap: () {},
            title: const Text("Exeptions"),
            trailing: Text(
              "15",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 32.w),
            onTap: () {},
            title: const Text("Turn off all notifications"),
          ),
        ],
      ),
    );
  }

  Widget getItem(String title) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 32.w),
      onTap: () {},
      title: Text(title),
    );
  }
}
