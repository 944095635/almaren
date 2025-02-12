import 'package:almaren/mixin/appbar_mixin.dart';
import 'package:almaren/models/contacts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 联系人逻辑层
class ContactsLogic extends GetxController
    with AppBarMixin, StateMixin, GetSingleTickerProviderStateMixin {
  /// 联系人列表
  List<Contacts> contacts = List.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
    fadeController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(fadeController!);

    _loadData();
  }

  /// 初始化数据
  _loadData() async {
    // 模拟延迟
    await Future.delayed(Durations.medium4);

    // 增加测试数据
    contacts.add(Contacts()
      ..name = "Dream.Machine"
      ..portrait = "images/avatar/1.jpg");
    contacts.add(Contacts()
      ..name = "Fudio X"
      ..portrait = "images/avatar/7.jpg");
    contacts.add(Contacts()
      ..name = "❤️ Ruben Dias ❤️"
      ..portrait = "images/avatar/8.jpg");
    contacts.add(Contacts()
      ..name = "Livia Herwitz"
      ..portrait = "images/avatar/6.jpg");
    contacts.add(Contacts()
      ..name = "Emerson Herwitz"
      ..portrait = "images/avatar/9.jpg");
    contacts.add(Contacts()
      ..name = "Giana Torff"
      ..portrait = "images/avatar/5.jpg");
    contacts.add(Contacts()
      ..name = "Dulce Bator"
      ..portrait = "images/avatar/4.jpg");
    contacts.add(Contacts()
      ..name = "Aspen Last"
      ..portrait = "images/avatar/10.jpg");
    contacts.add(Contacts()
      ..name = "Emerson Herwitz"
      ..portrait = "images/avatar/3.jpg");
    contacts.add(Contacts()
      ..name = "Spoony"
      ..portrait = "images/avatar/2.jpg");

    change(GetStatus.success(contacts));
  }
}
