class Chat {
  // 用户Id
  late String id;
  //显示名
  late String name;
  //显示标题
  late String title;
  //显示内容缩略
  String? msg;
  //未读数量
  int unread = 0;
  //显示头像
  late String portrait;
  //显示头像 - 本地
  String? localPortrait;
  //时间戳
  String? timestamp = "";
  //是否在线
  bool online = false;
}
