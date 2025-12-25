/// 消息基类
abstract class Message {
  final String name;
  final String avatar;
  final bool self;

  /// 正在发送
  final bool sending = false;

  /// 发送失败
  final bool failed = false;

  /// 是否群聊
  final bool isGroup = false;

  abstract final bool center;
  abstract final bool canClick;
  abstract final MessageKind kind;

  const Message({
    required this.avatar,
    required this.name,
    required this.self,
  });
}

enum MessageKind {
  unkonw,
  text,
  image,
  video,
}

/// 文本消息
class TextMessage extends Message {
  final String text;

  const TextMessage({
    required this.text,
    required super.avatar,
    required super.name,
    required super.self,
  });

  @override
  bool get center => false;

  @override
  bool get canClick => false;

  @override
  MessageKind get kind => MessageKind.text;
}
