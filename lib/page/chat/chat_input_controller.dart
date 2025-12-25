import 'package:flutter/foundation.dart';

/// 用于传递输入组件事件
class ChatInputController extends ChangeNotifier {
  /// 通知内部刷新
  void notify() {
    notifyListeners();
  }
}
