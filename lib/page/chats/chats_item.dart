import 'package:almaren/models/chat.dart';
import 'package:almaren/theme/colors.dart';
import 'package:almaren/theme/dimensions.dart';
import 'package:almaren/widgets/avatar_widget.dart';
import 'package:almaren/widgets/count_box_widget.dart';
import 'package:almaren/widgets/online_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_styled/size_extension.dart';

/// 会话列表 - 子项
class ChatsItem extends StatelessWidget {
  const ChatsItem({
    super.key,
    required this.chat,
    required this.onTap,
  });

  final Chat chat;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.4,
        motion: const BehindMotion(), //DrawerMotion
        children: [
          CustomSlidableAction(
            //onPressed: (_) => logic.pinConversation(info),
            onPressed: (_) {},
            backgroundColor: Color.fromARGB(255, 228, 230, 233),
            child: Text("top"),
          ),
          CustomSlidableAction(
            onPressed: (_) {},
            backgroundColor: Color.fromARGB(255, 196, 201, 206),
            child: Text("delete"),
          ),
        ],
      ),

      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: Dimensions.borderRadiusSmall,
                child: OnlineBoxWidget(
                  online: chat.online,
                  child: AvatarWidget(avatar: chat.portrait),
                ),
              ),
              16.horizontalSpace,

              /// 昵称 和 消息内容
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.name,
                    ),
                    2.verticalSpace,
                    Text(
                      chat.msg ?? "",
                      maxLines: 1,
                      style: TextStyle(color: ThemeColors.hintColor),
                    ),
                  ],
                ),
              ),

              /// 时间和未读消息数量
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    chat.timestamp ?? "",
                    style: TextStyle(fontSize: 14),
                  ),
                  2.verticalSpace,
                  // 显示未读消息数量
                  if (chat.unread != 0) ...{
                    CountBoxWidget(
                      count: chat.unread,
                    ),
                  },
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
