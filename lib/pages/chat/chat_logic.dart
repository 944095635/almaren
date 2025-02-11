import 'package:almaren/models/chat.dart';
import 'package:get/get.dart';

/// 聊天页面逻辑
class ChatLogic extends GetxController {
  late Chat? chat;

  bool online = false;

  @override
  void onInit() {
    super.onInit();
    chat = Get.arguments;
    online = chat!.online;
  }
}
