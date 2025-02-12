import 'package:almaren/mixin/appbar_mixin.dart';
import 'package:almaren/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 聊天页面逻辑
class ChatLogic extends GetxController
    with AppBarMixin, GetSingleTickerProviderStateMixin {
  late Chat? chat;

  bool online = false;

  @override
  void onInit() {
    super.onInit();
    fadeController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(fadeController!);

    chat = Get.arguments;
    online = chat!.online;
  }
}
