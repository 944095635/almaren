import 'package:almaren/models/message_type.dart';

class Message {
  /// 消息类型
  late MessageType type;

  /// 消息内容体
  late dynamic content;

  /// 是否发出消息
  late bool send;

  Message(this.type, {this.content, required this.send});
}
