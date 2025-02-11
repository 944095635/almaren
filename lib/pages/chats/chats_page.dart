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
      body: controller.obx(
        (state) => EasyRefresh(
          header: ClassicHeader(
            position: IndicatorPosition.locator,
          ),
          onRefresh: () async {
            await controller.onRefresh();
            return IndicatorResult.success;
          },
          child: _buildList(context),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return CustomScrollView(
      controller: controller.scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverSafeArea(
          bottom: false,
          sliver: HeaderLocator.sliver(),
        ),
        SliverToBoxAdapter(
          child: BodyTitle("Chats"),
        ),
        SliverSafeArea(
          top: false,
          sliver: SliverList.builder(
            itemCount: controller.chats.length,
            itemBuilder: (context, index) {
              Chat chat = controller.chats[index];
              return ChatsItem(
                chat: chat,
                onTap: () {
                  controller.showChat(chat);
                },
              );
            },
          ),
        )
      ],
    );
  }
}
