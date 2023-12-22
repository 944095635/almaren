import 'package:almaren/model/chat.dart';
import 'package:almaren/model/msg.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late ScrollController scrollController;
  late EasyRefreshController refreshController;
  late TextEditingController textController;
  var toolBoxHeight = 0.0.obs;
  var toolBoxOpacity = 0.0.obs;
  var data = RxList<Msg>.empty();

  late Animation<double> animation;
  late AnimationController animationController;

  var isShow = false.obs;

  

  final Chat chat;
  ChatController(this.chat);

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    // CurvedAnimation(
    //       parent: animation, //动画样式
    //       curve: Curves.fastOutSlowIn, //动画曲线
    //     )
//curve: Curves.fastOutSlowIn,
    ///改变起始值
    //animation = Tween(begin: 0.0, end: 200.0).animate(animationController);
    animation = Tween(begin: 0.0, end: 200.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    refreshController = EasyRefreshController();
    scrollController = ScrollController(
        // onAttach: (position) {
        //   scrollController.jumpTo(scrollController.position.maxScrollExtent);
        // },
        );
    textController = TextEditingController();

    Msg msg = Msg()
      ..value = chat.msg
      ..byMe = false;
    data.insert(0, msg);
  }

  send() {
    if (textController.text.isNotEmpty) {
      String textMsg = textController.text;
      textController.clear();

      Msg msg = Msg()..value = textMsg;
      data.insert(0, msg);

      if (index % 7 == 0) {
        data.insert(
          0,
          Msg()
            ..value = DateTime.now()
            ..type = MsgType.time,
        );
      }

      Msg msg1 = Msg()
        ..byMe = false
        ..value = textMsg;
      data.insert(0, msg1);

      index++;
    }
  }

  int index = 0;
  void sendImage(String image, {bool add = true}) {

    animationController.reverse();

    Msg msg = Msg()..type = MsgType.image;
    msg.value = image;
    // switch (index) {
    //   case 0:

    //     break;
    //   case 1:
    //     msg.value = "https://w.wallhaven.cc/full/5g/wallhaven-5g3ye9.jpg";
    //     break;
    //   case 2:
    //     msg.value = "https://w.wallhaven.cc/full/1p/wallhaven-1p2q6g.jpg";
    //     break;
    //   case 3:
    //     msg.value = "https://w.wallhaven.cc/full/x6/wallhaven-x6919l.jpg";
    //     break;
    //   default:
    //     msg.value = "https://w.wallhaven.cc/full/rr/wallhaven-rr6q5q.jpg";
    //     break;
    // }
    data.insert(0, msg);

    if (index % 7 == 0) {
      data.insert(
        0,
        Msg()
          ..value = DateTime.now()
          ..type = MsgType.time,
      );
    }

    //if (add) {
    //  //"https://w.wallhaven.cc/full/gp/wallhaven-gpmy6q.jpg"
    //  Msg msg1 = Msg()..type = MsgType.image;
    //  msg1.byMe = false;
    //  msg1.value = "images/img/2.png";
    //  data.insert(0, msg1);
    //}

    index++;

    toolBoxHeight.value = toolBoxHeight.value == 0 ? 200 : 0;

    toolBoxOpacity.value = toolBoxHeight.value == 0 ? 0 : 1;
  }
}
