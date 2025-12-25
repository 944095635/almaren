import 'dart:math';

/// 消息基类
abstract class Message {
  final String name;
  final String avatar;
  final bool self;

  final String id = Random().nextInt(100000000).toString();

  /// 正在发送
  final bool sending = false;

  /// 发送失败
  final bool failed = false;

  /// 是否群聊
  final bool isGroup = false;

  abstract final bool center;
  abstract final bool canClick;
  abstract final MessageKind kind;

  Message({
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

  TextMessage({
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

/// 图片消息
class ImageMessage extends Message {
  final String image;
  final double w;
  final double h;

  ImageMessage({
    required this.image,
    required super.avatar,
    required super.name,
    required super.self,
    required this.w,
    required this.h,
  });

  /// 跳转的页动画Key
  String get heroKey => "PreviewImage-$id";

  @override
  bool get center => false;

  @override
  bool get canClick => true;

  @override
  MessageKind get kind => MessageKind.image;
}
