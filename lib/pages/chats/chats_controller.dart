import 'dart:async';
import 'package:almaren/models/chat.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//正在聊天 - 控制器
class ChatsController extends GetxController
    with StateMixin, GetSingleTickerProviderStateMixin {
  late EasyRefreshController refreshController;
  late ScrollController scrollController;

  //菜单控制器
  late AnimationController menuController;

  // late StreamSubscription<ConnectionStatusChangedEvent>
  //     _connectionStatusSubscription;
  // late StreamSubscription<ReceiveMessagesEvent> _receiveMessageSubscription;
  // late StreamSubscription<UserSettingUpdatedEvent>
  //     _userSettingUpdatedSubscription;
  // late StreamSubscription<RecallMessageEvent> _recallMessageSubscription;
  // late StreamSubscription<DeleteMessageEvent> _deleteMessageSubscription;
  // late StreamSubscription<ClearConversationUnreadEvent>
  //     _clearConveratonUnreadSubscription;
  // late StreamSubscription<ClearConversationsUnreadEvent>
  //     _clearConveratonsUnreadSubscription;
  // final EventBus _eventBus = Imclient.IMEventBus;

  var data = RxList<Chat>.empty(growable: true);
  var titleOpacity = 0.0.obs;

  var online = true.obs;

  @override
  void onInit() {
    super.onInit();
    refreshController = EasyRefreshController();
    scrollController = ScrollController()
      ..addListener(() {
        //debugPrint(scrollController.offset.toString());
        if (scrollController.offset >= 50) {
          titleOpacity.value = 1;
        } else {
          if (titleOpacity.value != 0) {
            titleOpacity.value = scrollController.offset / 50;
          } else {
            titleOpacity.value = 0;
          }
        }
      });

    menuController = AnimationController(
      vsync: this,
      value: 1.0,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
    );

    //连接成功订阅 - 刷新列表
    // _connectionStatusSubscription =
    //     _eventBus.on<ConnectionStatusChangedEvent>().listen((event) {
    //   if (event.connectionStatus == kConnectionStatusConnected) {
    //     loadData();
    //   }
    // });

    // _receiveMessageSubscription =
    //     _eventBus.on<ReceiveMessagesEvent>().listen((event) {
    //   if (!event.hasMore) {
    //     loadData();
    //   }
    // });
    // _userSettingUpdatedSubscription =
    //     _eventBus.on<UserSettingUpdatedEvent>().listen((event) => loadData());
    // _recallMessageSubscription =
    //     _eventBus.on<RecallMessageEvent>().listen((event) => loadData());
    // _deleteMessageSubscription =
    //     _eventBus.on<DeleteMessageEvent>().listen((event) => loadData());
    // _clearConveratonUnreadSubscription = _eventBus
    //     .on<ClearConversationUnreadEvent>()
    //     .listen((event) => loadData());
    // _clearConveratonsUnreadSubscription = _eventBus
    //     .on<ClearConversationsUnreadEvent>()
    //     .listen((event) => loadData());
    loadData();
  }

  @override
  void onClose() {
    // _connectionStatusSubscription.cancel();
    // _receiveMessageSubscription.cancel();
    // _userSettingUpdatedSubscription.cancel();
    // _recallMessageSubscription.cancel();
    // _deleteMessageSubscription.cancel();
    // _clearConveratonUnreadSubscription.cancel();
    // _clearConveratonsUnreadSubscription.cancel();
    menuController.dispose();
    super.onClose();
  }

  //读取对话列表
  Future loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    // List<ConversationInfo> data = await Imclient.getConversationInfos([
    //   ConversationType.Single,
    //   ConversationType.Group,
    //   ConversationType.Channel
    // ], [
    //   0
    // ]);
    data.clear();
    online.value = true;

    if (true) {
      Chat chat = Chat();
      chat.name = "Dream.Machine";
      chat.online = true;
      chat.msg = "Photo 😻 Love u ❤️";
      chat.timestamp = "2 min ago";
      chat.portrait = "images/avatar/1.jpg";
      chat.unread = 4;
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.online = true;
      chat.name = "Spoony";
      chat.msg = "Hello! How are you?";
      chat.timestamp = "15 min ago";
      chat.portrait = "images/avatar/2.jpg";
      chat.unread = 99;
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Emerson Herwitz";
      chat.msg = "Yep, it’ll be awesome. I prom...";
      chat.timestamp = "Yesterday";
      chat.portrait = "images/avatar/3.jpg";
      chat.unread = 6;
      chat.online = true;
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Dulce Bator";
      chat.msg = "Bye!";
      chat.timestamp = "Feb 22";
      chat.portrait = "images/avatar/4.jpg";
      chat.unread = 20;
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Giana Torff";
      chat.msg = "hot stuff here 🔥ui8.net";
      chat.timestamp = "Feb 16";
      chat.portrait = "images/avatar/5.jpg";
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Livia Herwitz";
      chat.msg = "hot stuff here 🔥ui8.net";
      chat.timestamp = "Feb 9";
      chat.portrait = "images/avatar/6.jpg";
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Audio message";
      chat.msg = "😱😱😱";
      chat.timestamp = "Feb 2";
      chat.online = true;
      chat.portrait = "images/avatar/7.jpg";
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "❤️ Ruben Dias ❤️";
      chat.timestamp = "Jan 27";
      chat.msg = "just a sec";
      chat.portrait = "images/avatar/8.jpg";
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Emerson Herwitz";
      chat.timestamp = "Jan 16";
      chat.online = true;
      chat.msg = "😲😲😲";
      chat.portrait = "images/avatar/9.jpg";
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Aspen Last";
      chat.timestamp = "Jan 5";
      chat.msg = "look at this photo";
      chat.portrait = "images/avatar/10.jpg";
      data.add(chat);
    }

    // int unreadCount = 0; 设置未读数量
    // for (var element in data) {
    //   if (!element.isSilent) {
    //     unreadCount += element.unreadCount.unread;
    //   }
    // }
    //widget.unreadCountCallback(unreadCount);
    //await fillData(data);
    change(GetStatus.success(data));
  }

  // //填充聊天数据
  // Future fillData(List<ConversationInfo> newData) async {
  //   data.clear();
  //   for (ConversationInfo item in newData) {
  //     Chat chat = Chat();
  //     //用户名
  //     //单人聊天
  //     if (item.conversation.conversationType == ConversationType.Single) {
  //       //异步获取信息
  //       var userInfo = await Imclient.getUserInfo(item.conversation.target);
  //       if (userInfo != null) {
  //         Cache.putUserInfo(userInfo);
  //       }
  //       if (userInfo != null &&
  //           userInfo.portrait != null &&
  //           userInfo.portrait!.isNotEmpty) {
  //         chat.portrait = userInfo.portrait!; //头像
  //         chat.name = userInfo.displayName!;
  //       } else {
  //         chat.name = '私聊';
  //       }
  //     } else if (item.conversation.conversationType == ConversationType.Group) {
  //       var groupInfo = await Imclient.getGroupInfo(item.conversation.target);
  //       if (groupInfo != null) {
  //         Cache.putGroupInfo(groupInfo);
  //         if (groupInfo.portrait != null && groupInfo.portrait!.isNotEmpty) {
  //           chat.portrait = groupInfo.portrait!;
  //         }
  //         if (groupInfo.name != null && groupInfo.name!.isNotEmpty) {
  //           chat.name = groupInfo.name!;
  //         }
  //       } else {
  //         chat.name = '群聊';
  //       }
  //       //localPortrait = 'images/group_avatar_default.png';
  //     } else if (item.conversation.conversationType ==
  //         ConversationType.Channel) {
  //       var channelInfo =
  //           await Imclient.getChannelInfo(item.conversation.target);
  //       if (channelInfo != null &&
  //           channelInfo.portrait != null &&
  //           channelInfo.portrait!.isNotEmpty) {
  //         chat.portrait = channelInfo.portrait!;
  //         chat.name = channelInfo.name!;
  //       } else {
  //         chat.name = 'Channel';
  //       }
  //       //localPortrait = 'images/channel_avatar_default.png';
  //       chat.localPortrait = "Channel";
  //     }

  //     //获取摘要
  //     if (item.lastMessage != null) {
  //       String digest =
  //           await item.lastMessage!.content.digest(item.lastMessage!);
  //       Cache.putConversationDigest(item.conversation, digest);
  //       chat.msg = digest;
  //     }
  //     chat.timestamp = item.timestamp;
  //     chat.unread = item.unreadCount.unread;
  //     data.add(chat);
  //   }
  // }

  void showChat(Chat item) {
    //Get.to(() => ChatPage(item));
  }

  void showMenu() {
    showModalBottomSheet(
      context: Get.context!,
      useSafeArea: false,
      barrierColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          height: 300,
          margin: const EdgeInsets.all(10),
          width: double.maxFinite,
          child: Column(
            children: [
              Container(
                width: 40,
                height: 3,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3)),
              ),
              Expanded(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 21 / 9,
                  ),
                  children: [
                    // ElevatedButton(
                    //   onPressed: test1,
                    //   child: Text(
                    //     "收到新消息",
                    //     style: Theme.of(Get.context!).textTheme.bodySmall,
                    //   ),
                    // ),
                    // ElevatedButton(
                    //   onPressed: test2,
                    //   child: Text(
                    //     "删除好友",
                    //     style: Theme.of(Get.context!).textTheme.bodySmall,
                    //   ),
                    // ),
                    // ElevatedButton(
                    //   onPressed: test3,
                    //   child: Text(
                    //     "遮罩层",
                    //     style: Theme.of(Get.context!).textTheme.bodySmall,
                    //   ),
                    // ),
                    // ElevatedButton(
                    //   onPressed: test4,
                    //   child: Text(
                    //     "掉线",
                    //     style: Theme.of(Get.context!).textTheme.bodySmall,
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  }
