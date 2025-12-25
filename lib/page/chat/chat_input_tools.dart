import 'package:almaren/page/chat/chat_input_tools_item.dart';
import 'package:flutter/material.dart';

/// 工具箱
class ChatInputTools extends StatelessWidget {
  const ChatInputTools({
    super.key,
    required this.onTapFile,
    required this.onTapAlbum,
    required this.onTapCamera,
    required this.onTapCollect,
    required this.onTapTransfer,
    required this.onTapRedPacket,
  });

  /// 点击拍摄
  final VoidCallback onTapFile;

  /// 点击相册
  final VoidCallback onTapAlbum;

  /// 点击拍摄
  final VoidCallback onTapCamera;

  /// 点击我的收藏
  final VoidCallback onTapCollect;

  /// 点击发转账
  final VoidCallback onTapTransfer;

  /// 点击发红包
  final VoidCallback onTapRedPacket;

  @override
  Widget build(BuildContext context) {
    final double safeBottom = MediaQuery.of(context).padding.bottom + 10;
    return GridView(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: safeBottom,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
      ),
      children: [
        ChatInputToolsItem(
          name: "Album", //"相册"
          onTap: onTapAlbum,
          icon: "assets/svgs/chat/chatAlbum.webp",
        ),

        ChatInputToolsItem(
          name: "Camera", //"拍摄"
          onTap: onTapCamera,
          icon: "assets/svgs/chat/chatCamera.webp",
        ),

        const ChatInputToolsItem(
          name: "Call", //"音视频通话"
          icon: "assets/svgs/chat/chatCall.webp",
        ),

        ChatInputToolsItem(
          name: "File", //"文件"
          onTap: onTapRedPacket,
          icon: "assets/svgs/chat/chatFile.webp",
        ),

        ChatInputToolsItem(
          name: "Wallet", //"红包"
          onTap: onTapTransfer,
          icon: "assets/svgs/chat/chatHongbao.webp",
        ),

        ChatInputToolsItem(
          name: "Transfer", //"转账"
          onTap: onTapCollect,
          icon: "assets/svgs/chat/chatTransfer.webp",
        ),

        ChatInputToolsItem(
          name: "Collect", //收藏
          onTap: onTapFile,
          icon: "assets/svgs/chat/chatCollect.webp",
        ),
      ],
    );
  }
}
