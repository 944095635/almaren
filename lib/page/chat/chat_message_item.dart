import 'package:almaren/models/message.dart';
import 'package:almaren/page/chat/render/message_image_render.dart';
import 'package:almaren/page/chat/render/message_text_render.dart';
import 'package:almaren/theme/colors.dart';
import 'package:almaren/theme/dimensions.dart';
import 'package:almaren/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';

/// 聊天页面 - 消息子项
class ChatMessageItem extends StatelessWidget {
  const ChatMessageItem({
    super.key,
    required this.index,
    required this.message,
    this.isSelectMode = false,
    required this.onTapMulti,
    required this.onTapContent,
  });

  /// 下标
  final int index;

  /// 被选中
  final bool isSelected = false;

  /// 选择模式
  final bool isSelectMode;

  /// 消息实体
  final Message message;

  /// 多选模式
  final VoidCallback onTapMulti;

  /// 点击内容
  final VoidCallback onTapContent;

  @override
  Widget build(BuildContext context) {
    bool hasDecoration = true;

    /// 消息由我发送
    final bool sendByMe = message.self;

    /// 尺寸约束
    BoxConstraints? constraints;

    Widget content;
    switch (message.kind) {
      case MessageKind.text:
        content = MessageTextRender(message as TextMessage);
        break;
      case MessageKind.image:
        hasDecoration = false;
        content = MessageImageRender(message as ImageMessage);
        constraints = BoxConstraints(maxWidth: 160, maxHeight: 260);
        break;
      // case MsgKind.video:
      //   hasDecoration = false;
      //   content = MessageVideoRender(message as VideoMessageUI);
      //   constraints = BoxConstraints(maxWidth: 200.w, maxHeight: 260.h);
      //   break;
      // case MsgKind.file:
      //   hasDecoration = false;
      //   content = MessageFileRender(
      //     message as FileMessageUI,
      //     sendByMe: sendByMe,
      //   );
      //   break;
      default:
        content = const Text("不支持的消息类型");
    }

    /// 居中显示
    if (message.center) {
      return Center(child: content);
    }

    // 是否可以选择
    final bool canSelect = true;

    // 内边距 + 背景填充
    content = Container(
      padding: hasDecoration ? Dimensions.messageContentPadding : null,
      decoration: hasDecoration
          ? ShapeDecoration(
              color: sendByMe
                  ? const Color(0xFFE2F5FF)
                  : const Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(
                borderRadius: Dimensions.borderRadiusSmall,
              ),
            )
          : null,
      // 约束盒子
      constraints: constraints,
      child: content,
    );

    // decoration: BoxDecoration(
    //   color: Colors.white10,
    //   border: BoxBorder.all(color: Colors.black12),
    // ),

    // 增加长按菜单
    content = _buildLongPressMenu(content);

    // 增加手势捕获
    content = GestureDetector(
      onTap: message.canClick ? onTapContent : null,
      behavior: HitTestBehavior.opaque,
      child: content,
    );

    /// 添加发送状态显示
    if (sendByMe && (message.sending || message.failed)) {
      Widget icon;
      if (message.sending) {
        icon = const CircularProgressIndicator();
      } else {
        icon = const Icon(
          Icons.info,
          size: 16,
          color: ThemeColors.dangerColor,
        );
      }
      content = Row(
        mainAxisSize: MainAxisSize.min,
        spacing: Dimensions.spacing,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: icon,
          ),
          Flexible(child: content),
        ],
      );
    }
    // 是否显示昵称(群聊 和 他人)才会显示昵称
    if (message.isGroup && !sendByMe) {
      content = Column(
        spacing: Dimensions.spacing,
        crossAxisAlignment: sendByMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            message.name,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFA5A5A5),
            ),
          ),
          content,
        ],
      );
    }

    return Row(
      spacing: Dimensions.spacing,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 选择模式
        if (canSelect && isSelectMode) SizedBox(),
        // RadioWidget(
        //   true,
        //   margin: EdgeInsets.only(top: 8.h),
        // ),
        _buildLeftAvatar(!sendByMe),
        Expanded(
          child: Align(
            alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
            child: content,
          ),
        ),
        _buildLeftAvatar(sendByMe),
      ],
    );
  }

  Widget _buildAvatar() {
    // 头像组件
    Widget avatar = ClipRRect(
      borderRadius: Dimensions.borderRadiusSmall,
      child: AvatarWidget(
        avatar: message.avatar,
        size: 45,
      ),
    );
    return avatar;
  }

  /// 左侧头像区域
  Widget _buildLeftAvatar(bool isSend) {
    if (!isSend) {
      return SizedBox(
        width: isSelectMode ? 10 : 40,
      );
    } else {
      return _buildAvatar();
    }
  }

  /// 长按菜单
  Widget _buildLongPressMenu(Widget content) {
    return content;
    // final List<Widget> menus = [
    //   ChatMenuItem(
    //     icon: "assets/images/chat/menu/copy.png",
    //     text: "复制",
    //     onTap: () {
    //       Get.back();
    //       if (message is TextMessageUI) {
    //         TextMessageUI textMessageUI = message as TextMessageUI;
    //         Clipboard.setData(ClipboardData(text: textMessageUI.text));
    //       }
    //     },
    //   ),
    //   const ChatMenuItem(
    //     icon: "assets/images/chat/menu/forward.png",
    //     text: "转发",
    //   ),
    //   ChatMenuItem(
    //     icon: "assets/images/chat/menu/multi.png",
    //     text: "多选",
    //     onTap: () {
    //       Get.back();
    //       onTapMulti.call();
    //     },
    //   ),
    //   const ChatMenuItem(
    //     icon: "assets/images/chat/menu/collect.png",
    //     text: "收藏",
    //   ),
    //   const ChatMenuItem(
    //     icon: "assets/images/chat/menu/reply.png",
    //     text: "回复",
    //   ),
    //   const ChatMenuItem(
    //     icon: "assets/images/chat/menu/delete.png",
    //     text: "删除",
    //   ),
    //   const ChatMenuItem(
    //     icon: "assets/images/chat/menu/revoke.png",
    //     text: "撤回",
    //   ),
    // ];

    // return CustomPopup(
    //   isLongPress: true,
    //   barrierColor: Colors.black38,
    //   arrowColor: const Color(0xFF3F3E3E),
    //   backgroundColor: const Color(0xFF3F3E3E),
    //   contentRadius: Dimensions.borderRadiusValue,
    //   content: ConstrainedBox(
    //     constraints: const BoxConstraints(maxWidth: 220),
    //     child: Wrap(
    //       children: menus,
    //     ),
    //   ),
    //   child: content,
    // );
  }
}
