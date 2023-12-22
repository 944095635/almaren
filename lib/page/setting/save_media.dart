import 'package:almaren/page/chats/chats_controller.dart';
import 'package:almaren/page/wallpaper_page.dart';
import 'package:almaren/widget/common_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/* 设置 - 通知 */
class SaveMediaPage extends GetView<ChatsController> {
  const SaveMediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatsController());
    return Scaffold(
      appBar: getAppBar(),
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 26.h, bottom: 24.h, left: 26.w),
            child: Text(
              "Saved media",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 40),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(5),
            itemCount: 55,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                      useSafeArea: false,
                      context: context,
                      barrierColor:Colors.black,
                      builder: (context) {
                        return const WallPaperPage("images/img/2.png");
                      });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.r),
                  child: Image.asset(
                    "images/img/2.png",
                    fit: BoxFit.cover,
                    cacheWidth: 1200,
                  ),
                ),
              );
            },
          )
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
