import 'dart:async';
import 'package:almaren/mixin/app_title_mixin.dart';
import 'package:almaren/models/chat.dart';
import 'package:get/get.dart';

//正在聊天 - 控制器
class ChatsController extends GetxController with StateMixin, AppTitleMixin {
  /// 会话列表
  List chats = List.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
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
      chat.portrait = "images/avatar/1.jpg";
      chat.unread = 4;
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.online = true;
      chat.name = "Spoony";
      chat.msg = "Hello! How are you?";
      chat.timestamp = "15 min ago";
      chat.portrait = "images/avatar/2.jpg";
      chat.unread = 99;
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Emerson Herwitz";
      chat.msg = "Yep, it’ll be awesome. I prom...";
      chat.timestamp = "Yesterday";
      chat.portrait = "images/avatar/3.jpg";
      chat.unread = 6;
      chat.online = true;
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Dulce Bator";
      chat.msg = "Bye!";
      chat.timestamp = "Feb 22";
      chat.portrait = "images/avatar/4.jpg";
      chat.unread = 20;
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Giana Torff";
      chat.msg = "hot stuff here 🔥ui8.net";
      chat.timestamp = "Feb 16";
      chat.portrait = "images/avatar/5.jpg";
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Livia Herwitz";
      chat.msg = "hot stuff here 🔥ui8.net";
      chat.timestamp = "Feb 9";
      chat.portrait = "images/avatar/6.jpg";
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Audio message";
      chat.msg = "😱😱😱";
      chat.timestamp = "Feb 2";
      chat.online = true;
      chat.portrait = "images/avatar/7.jpg";
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "❤️ Ruben Dias ❤️";
      chat.timestamp = "Jan 27";
      chat.msg = "just a sec";
      chat.portrait = "images/avatar/8.jpg";
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Emerson Herwitz";
      chat.timestamp = "Jan 16";
      chat.online = true;
      chat.msg = "😲😲😲";
      chat.portrait = "images/avatar/9.jpg";
      chats.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Aspen Last";
      chat.timestamp = "Jan 5";
      chat.msg = "look at this photo";
      chat.portrait = "images/avatar/10.jpg";
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

  void showChat(Chat item) {
    //Get.to(() => ChatPage(item));
  }
}
