import 'package:almaren/models/chat.dart';
import 'package:almaren/page/chats/chats_item.dart';
import 'package:almaren/page/chats/chats_logic.dart';
import 'package:almaren/page/search/search_page.dart';
import 'package:almaren/widgets/blur_widget.dart';
import 'package:almaren/widgets/body_title.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_styled/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

/// 聊天页面
class ChatsPage extends GetView<ChatsLogic> {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeTransition(
          opacity: controller.fadeAnimation,
          child: Text(
            "Chats",
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => SearchPage());
            },
            icon: SvgPicture.asset("assets/svgs/search.svg"),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => SearchPage());
            },
            icon: SvgPicture.asset("assets/svgs/plus.svg"),
          ),
          5.horizontalSpace,
        ],
        flexibleSpace: BlurWidget(
          child: SizedBox.expand(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: controller.obx(
        (state) => _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SlidableAutoCloseBehavior(
      child: EasyRefresh(
        header: ClassicHeader(
          position: IndicatorPosition.locator,
        ),
        onRefresh: () {
          return IndicatorResult.success;
        },
        child: CustomScrollView(
          controller: controller.scrollController,
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
                      controller.onTapChat(chat);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
