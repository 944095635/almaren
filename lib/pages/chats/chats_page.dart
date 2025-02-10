import 'package:almaren/models/chat.dart';
import 'package:almaren/pages/chats/chats_controller.dart';
import 'package:almaren/pages/chats/chats_item.dart';
import 'package:almaren/widgets/appbar.dart';
import 'package:almaren/widgets/body_title.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

/// 会话页面
class ChatsPage extends GetView<ChatsController> {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatsController());
    return Scaffold(
      appBar: blurAppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("images/search.svg"),
        ),
        title: Obx(
          () => AnimatedOpacity(
            opacity: controller.titleOpacity.value,
            duration: const Duration(milliseconds: 300),
            child: Text(
              "Chats",
              style: Theme.of(context).textTheme.labelLarge!,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("images/plus.svg"),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: EasyRefresh(
        controller: controller.refreshController,
        onRefresh: () async {
          await controller.loadData();
          return IndicatorResult.success;
        },
        child: controller.obx(
          (state) => ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.data.length + 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 1) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BodyTitle("Chats"),
                    !controller.online.value
                        ? Text(
                            "offline",
                            style: Theme.of(context).textTheme.displaySmall,
                          )
                        : const SizedBox(),
                  ],
                );
              }
              if (index == 0) {
                return const HeaderLocator();
              }
              Chat chat = controller.data[index - 2];
              return ChatsItem(
                chat: chat,
                onTap: () {
                  controller.showChat(chat);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
