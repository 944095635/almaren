import 'package:almaren/mixin/appbar_mixin.dart';
import 'package:almaren/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsLogic extends GetxController
    with AppBarMixin, StateMixin, GetSingleTickerProviderStateMixin {
  /// 会话列表
  final List chats = List.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
    fadeController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(fadeController!);
    _loadData();
  }

  //读取对话列表
  Future _loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    chats.clear();
    if (true) {
      Chat chat = Chat();
      chat.name = "Dream.Machine";
      chat.online = true;
      chat.msg = "Photo 😻 Love u ❤️";
      chat.timestamp = "2 min ago";
      chat.portrait = "assets/images/avatar/1.jpg";
      chat.unread = 4;
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.online = true;
      chat.name = "Spoony";
      chat.msg = "Hello! How are you?";
      chat.timestamp = "15 min ago";
      chat.portrait = "assets/images/avatar/2.jpg";
      chat.unread = 99;
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Emerson Herwitz";
      chat.msg = "Yep, it’ll be awesome. I prom...";
      chat.timestamp = "Yesterday";
      chat.portrait = "assets/images/avatar/3.jpg";
      chat.unread = 6;
      chat.online = true;
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Dulce Bator";
      chat.msg = "Bye!";
      chat.timestamp = "Feb 22";
      chat.portrait = "assets/images/avatar/4.jpg";
      chat.unread = 20;
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Giana Torff";
      chat.msg = "hot stuff here 🔥ui8.net";
      chat.timestamp = "Feb 16";
      chat.portrait = "assets/images/avatar/5.jpg";
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Livia Herwitz";
      chat.msg = "hot stuff here 🔥ui8.net";
      chat.timestamp = "Feb 9";
      chat.portrait = "assets/images/avatar/6.jpg";
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Audio message";
      chat.msg = "😱😱😱";
      chat.timestamp = "Feb 2";
      chat.online = true;
      chat.portrait = "assets/images/avatar/7.jpg";
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "❤️ Ruben Dias ❤️";
      chat.timestamp = "Jan 27";
      chat.msg = "just a sec";
      chat.portrait = "assets/images/avatar/8.jpg";
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Emerson Herwitz";
      chat.timestamp = "Jan 16";
      chat.online = true;
      chat.msg = "😲😲😲";
      chat.portrait = "assets/images/avatar/9.jpg";
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Aspen Last";
      chat.timestamp = "Jan 5";
      chat.msg = "look at this photo";
      chat.portrait = "assets/images/avatar/10.jpg";
      chats.add(chat);
    }

    // int unreadCount = 0; 设置未读数量
    // for (var element in data) {
    //   if (!element.isSilent) {
    //     unreadCount += element.unreadCount.unread;
    //   }
    // }
    //widget.unreadCountCallback(unreadCount);
    //await fillData(data);
    change(GetStatus.success(chats));
  }

  /// 下拉刷新
  Future onRefresh() {
    return _loadData();
  }

  void onTapChat(Chat chat) {
    //Get.to(() => ChatPage(), arguments: chat);
  }
}
