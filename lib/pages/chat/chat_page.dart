import 'dart:io';
import 'package:almaren/pages/chat/chat_logic.dart';
import 'package:almaren/values/colors.dart';
import 'package:almaren/values/sizes.dart';
import 'package:almaren/widgets/appbar.dart';
import 'package:almaren/widgets/avatar_widget.dart';
import 'package:almaren/widgets/blur_widget.dart';
import 'package:almaren/widgets/online_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

/// 聊天页面
class ChatPage extends GetView<ChatLogic> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatLogic());
    return Scaffold(
      appBar: blurAppBarEx(
        appHeight: 70,
        titleSpacing: 0,
        context: context,
        fadeAnimation: controller.fadeAnimation,
        scrollController: controller.scrollController,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: Sizes.borderRadiusSmall,
              child: OnlineBoxWidget(
                online: controller.online,
                child: AvatarWidget(
                  size: 40,
                  avatar: controller.chat?.portrait,
                ),
              ),
            ),
            16.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.chat?.name ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                2.verticalSpace,
                Text(
                  controller.online ? "Online" : "",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: controller.online
                            ? ThemeColors.greenColor
                            : ThemeColors.greyColor,
                      ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("images/camera.svg"),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: ListView.separated(
        itemCount: 7,
        controller: controller.scrollController,
        itemBuilder: (context, index) {
          if (index <= 6) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ClipRRect(
                borderRadius: Sizes.borderRadius,
                child: Image.asset(
                  "images/img/${index + 1}.jpg",
                  cacheWidth: 800,
                ),
              ),
            );
          }
          return ListTile(
            title: Text(index.toString()),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return 20.verticalSpace;
        },
      ),
      bottomNavigationBar: BlurWidgetEx(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: Platform.isAndroid ? 20 : 0,
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white54,
                hintText: "say something.",
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("images/send.svg"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
