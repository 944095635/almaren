import 'dart:async';
import 'package:almaren/delegate/search_delegate.dart';
import 'package:almaren/model/contacts.dart';
import 'package:almaren/page/contacts/contacts_info_page.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//联系人 - 控制器
class ContactsController extends GetxController with StateMixin {
  late EasyRefreshController refreshController;
  late ScrollController scrollController;

  var data = RxList<Contacts>.empty();
  var titleOpacity = 0.0.obs;

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
          titleOpacity.value = 0;
        }
      });
    loadData();
  }

  //读取对话列表
  Future loadData() async {
    data.clear();
    await Future.delayed(const Duration(seconds: 1));

    data.clear();
    if (true) {
      Contacts chat = Contacts();
      chat.displayName = "Dream.Machine";
      chat.name = "Alex M.O.R.P.H.";
      chat.online = true;
      chat.portrait = "images/img/11.jpg";
      data.add(chat);
    }

    if (true) {
      Contacts chat = Contacts();
      chat.displayName = "Spoony";
      chat.online = true;
      chat.portrait = "images/img/12.jpg";
      data.add(chat);
    }

    if (true) {
      Contacts chat = Contacts();
      chat.displayName = "Emerson Herwitz";
      chat.portrait = "images/img/13.jpg";
      data.add(chat);
    }

    if (true) {
      Contacts chat = Contacts();
      chat.displayName = "Dulce Bator";
      chat.portrait = "images/img/14.jpg";
      data.add(chat);
    }

    if (true) {
      Contacts chat = Contacts();
      chat.displayName = "Giana Torff";
      chat.online = true;
      chat.portrait = "images/img/15.jpg";
      data.add(chat);
    }

    if (true) {
      Contacts chat = Contacts();
      chat.displayName = "Livia Herwitz";
      chat.online = true;
      chat.portrait = "images/img/16.jpg";
      data.add(chat);
    }

    if (true) {
      Contacts chat = Contacts();
      chat.displayName = "Audio message";
      chat.portrait = "images/img/17.jpg";
      data.add(chat);
    }

    if (true) {
      Contacts chat = Contacts();
      chat.displayName = "Ruben Dias";
      chat.portrait = "images/img/5.jpg";
      data.add(chat);
    }

    if (true) {
      Contacts chat = Contacts();
      chat.displayName = "Emerson Herwitz";
      chat.online = true;
      chat.portrait = "images/img/6.jpg";
      data.add(chat);
    }

    if (true) {
      Contacts chat = Contacts();
      chat.displayName = "Aspen Mango";
      chat.portrait = "images/img/3.jpg";
      data.add(chat);
    }

    //
    // var newData = await Imclient.getMyFriendList(refresh: true);
    // for (var item in newData) {
    //   var userInfo = await Imclient.getUserInfo(item);
    //   Contacts contacts = Contacts();
    //   if (userInfo != null) {
    //     if (userInfo.portrait != null && userInfo.portrait!.isNotEmpty) {
    //       contacts.portrait = userInfo.portrait!;
    //     }
    //     contacts.displayName = userInfo.displayName!;
    //     contacts.extra = userInfo.extra;
    //     contacts.id = userInfo.userId;
    //     contacts.name = userInfo.name;
    //   } else {
    //     contacts.name = '用户';
    //   }
    //   data.add(contacts);
    // }
    change(null, status: RxStatus.success());
  }

  void showContacts(Contacts item) {
    Get.to(() => ContactsInfoPage(item));
  }

  //显示搜索界面
  void showSearchPage() {
    showAlSearch(context: Get.context!, delegate: SearchBarDelegate());
  }
}
