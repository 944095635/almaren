import 'dart:ffi';

import 'package:almaren/model/chat.dart';
import 'package:almaren/model/msg.dart';
import 'package:almaren/page/chat/chat_controller.dart';
import 'package:almaren/page/wallpaper_page.dart';
import 'package:almaren/styles/colors.dart';
import 'package:almaren/widget/common_widget.dart';
import 'package:almaren/widget/text_field.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage(this.chat, {super.key});

  final Chat chat;

  @override
  String? get tag => chat.name;

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController(chat), tag: chat.name);
    return Scaffold(
      appBar: getAppBar(
        title: Row(
          children: [
            getOnlineBox(
              chat.portrait != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(6.r),
                      child: Image.asset(
                        chat.portrait!,
                        width: 40.w,
                        height: 40.w,
                        cacheWidth: 300,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      width: 40.w,
                      height: 40.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      child: Text(
                        chat.localPortrait ?? "D",
                        style: TextStyle(fontSize: 11.sp, color: Colors.white),
                      ),
                    ),
              online: chat.online,
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(Get.context!).textTheme.bodyMedium,
                  ),
                  4.verticalSpace,
                  Text(
                    chat.online ? "Online" : "",
                    style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(
                          color: chat.online
                              ? AlColors.greenColor
                              : AlColors.greyColor,
                        ),
                  ),
                ],
              ),
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
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: EasyRefresh(
        controller: controller.refreshController,
        // onRefresh: () async {
        //   //await controller.loadData();
        //   await Future.delayed(const Duration(seconds: 2));
        //   return IndicatorResult.success;
        // },
        // onLoad: () async {
        //   //await controller.loadData();
        //   await Future.delayed(const Duration(seconds: 2));
        //   return IndicatorResult.success;
        // },
        //const HeaderLocator(),
        child: Padding(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
            top: 24.w,
            //bottom: 88.h,
          ),
          child: Obx(
            () => ListView.separated(
              reverse: true,
              shrinkWrap: true,
              itemCount: controller.data.length,
              itemBuilder: buildItem,
              separatorBuilder: (BuildContext context, int index) {
                return 20.verticalSpace;
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: getFilterWidget(
          padding: EdgeInsets.only(
            right: 24.w,
            top: 10.h,
            bottom: 10.h,
            left: 10.w,
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    10.horizontalSpace,
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        controller.isShow.value = !controller.isShow.value;

                        if (!controller.isShow.value) {
                          controller.animationController.reverse();
                        } else {
                          controller.animationController.forward();
                        }
                      },
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        size: 28,
                        progress: controller.animationController,
                      ),
                    ),
                    10.horizontalSpace,
                    //IconButton(
                    //  onPressed: () {
                    //    controller.animationController.forward();
                    //    controller.isShow.value = !controller.isShow.value;
                    //    // .toolBoxHeight.value =
                    //    //     controller.toolBoxHeight.value == 0 ? 200 : 0;

                    //    // controller.toolBoxOpacity.value =
                    //    //     controller.toolBoxHeight.value == 0 ? 0 : 1;
                    //    //controller.sendImage();
                    //  },
                    //  icon: SvgPicture.asset("images/home/plus.svg"),
                    //),
                    Expanded(
                      child: SizedBox(
                        height: 50.h,
                        child: AlTextField(
                          canSend: true,
                          canClean: false,
                          controller: controller.textController,
                          send: controller.send,
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(
                  () => AnimatedCrossFade(
                    firstChild: SizedBox(
                      height: 128.h,
                      child: GridView(
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                        ),
                        children: buildItems(),
                      ),
                    ),
                    secondChild: const SizedBox(),
                    crossFadeState: controller.isShow.value
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 350),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* 绘制单个元素 */
  Widget? buildItem(BuildContext context, int index) {
    Msg msg = controller.data[index];
    Widget msgContent;
    if (msg.type == MsgType.text) {
      msgContent = Text(
        msg.value,
        style: const TextStyle(fontFamily: ""),
      );
    } else if (msg.type == MsgType.image) {
      msgContent = GestureDetector(
        onTap: () {
          showDialog(
            useSafeArea: false,
            context: context,
            builder: (context) {
              return WallPaperPage(msg.value);
            },
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.r),
          child: Image.asset(
            msg.value,
            fit: BoxFit.cover,
            width: 0.6.sw,
            cacheWidth: 360,
          ),
        ),
      );
    } else if (msg.type == MsgType.time) {
      DateTime time = msg.value;
      msgContent = Text(
        "${time.hour}:${time.minute}",
        style: Theme.of(context).textTheme.displaySmall,
      );
    } else {
      msgContent = const Text("不支持的格式");
    }
    return Align(
      alignment: msg.byMe ? Alignment.centerRight : Alignment.centerLeft,
      child: getMsgBox(
        msgContent,
        hasBorder: msg.type == MsgType.text,
        color: msg.byMe ? AlColors.msgByMe : AlColors.msgByOther,
      ),
    );
  }

  Widget getMsgBox(Widget child, {bool hasBorder = true, Color? color}) {
    return hasBorder
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: child,
          )
        : child;
  }

  buildItems() {
    return [
      buildItem1("images/img/1.png"),
      buildItem1("images/img/2.png"),
      buildItem1("images/img/4.jpg"),
      buildItem1("images/img/5.jpg"),
      buildItem1("images/img/6.jpg"),
      buildItem1("images/img/8.png"),
      buildItem1("images/img/9.jpg"),
      buildItem1("images/img/13.jpg"),
      buildItem1("images/img/14.jpg"),
      buildItem1("images/img/15.jpg"),
      buildItem1("images/img/16.jpg"),
      buildItem1("images/img/17.jpg"),
    ];
  }

  Widget buildItem1(String image) {
    return GestureDetector(
      onTap: () {
        controller.sendImage(image);
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              cacheWidth: 180,
            ),
          ),
        ),
      ),
    );
  }
}
