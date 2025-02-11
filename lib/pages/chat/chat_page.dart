import 'package:almaren/pages/chat/chat_logic.dart';
import 'package:almaren/pages/chats/chats_item.dart';
import 'package:almaren/values/colors.dart';
import 'package:almaren/values/sizes.dart';
import 'package:almaren/widgets/appbar.dart';
import 'package:almaren/widgets/avatar_widget.dart';
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
      appBar: blurAppBar(
        appHeight: 70,
        titleSpacing: 0,
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
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ChatsItem(
            chat: controller.chat!,
            onTap: () {},
          );
        },
      ),
    );
  }
}
