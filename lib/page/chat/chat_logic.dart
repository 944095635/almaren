import 'dart:async';
import 'package:almaren/models/chat.dart';
import 'package:almaren/models/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 聊天页面
class ChatLogic extends GetxController {
  /// 当前会话
  final Chat chat = Get.arguments;

  /// 消息列表
  final List<Message> messages = List.empty(growable: true);

  /// 滚动条控制器
  final ScrollController scrollController = ScrollController();

  /// 是否拥有滚动条
  bool hasScroll = false;

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  void _initData() {
    messages.add(
      TextMessage(
        avatar: "assets/images/avatar/1.jpg",
        name: "滨崎步",
        self: true,
        text: '你好，非常高兴认识你',
      ),
    );

    messages.add(
      TextMessage(
        avatar: chat.portrait,
        name: "滨崎步",
        self: false,
        text: '你好，我是 滨崎步。',
      ),
    );

    messages.add(
      TextMessage(
        avatar: chat.portrait,
        name: "滨崎步",
        self: false,
        text: '??? 😁 Hello',
      ),
    );
  }

  /// 检查滚动行为
  void checkScrollPhysics({bool force = false}) async {
    // 不能滚动才检查
    if (force || !hasScroll) {
      if (scrollController.hasClients) {
        await Future.delayed(const Duration(milliseconds: 150));
        // 计算内部高度
        //double max = scrollController.position.maxScrollExtent;
        if (scrollController.position.extentInside <
            scrollController.position.extentTotal) {
          if (!hasScroll) {
            hasScroll = true;
            update(); // 刷新UI
            debugPrint("CheckScrollPhysics : 现在可以滚动。");
          }
        } else {
          if (hasScroll) {
            hasScroll = false;
            update(); // 刷新UI
            debugPrint("CheckScrollPhysics : 不允许滚动。");
          }
        }
      }
    }
  }

  FutureOr<dynamic> loadMore() {}

  /// 插入消息并发送，然后刷新UI
  void _insertMessageSend(Message msg) {
    // 发送
    //service.sendMsg(msg);
    // 告知给会话列表
    //service.sendMsgToChats(ChatsEvent(chatsData.targetId, msg));
    // 处理消息
    messages.insert(0, msg);
    update(); // 刷新UI
    checkScrollPhysics();
  }

  void onTapSend(String text) {
    final TextMessage msg = TextMessage(
      text: text,
      avatar: "assets/images/avatar/1.jpg",
      name: "",
      self: true,
    );
    _insertMessageSend(msg);
  }

  void onTapAlbum() {}

  void onTapCamera() {}

  void onTapMenuFile() {}

  void onTapMenuTransfer() {}

  void onTapMenuRedPacket() {}

  void onTapMenuCollect() {}
}
