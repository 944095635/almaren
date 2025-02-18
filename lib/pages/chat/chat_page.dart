import 'package:almaren/models/message.dart';
import 'package:almaren/models/message_type.dart';
import 'package:almaren/pages/chat/chat_logic.dart';
import 'package:almaren/pages/chat/message/image_message.dart';
import 'package:almaren/pages/chat/message/text_message.dart';
import 'package:almaren/utils/keyboard_utils.dart';
import 'package:almaren/values/colors.dart';
import 'package:almaren/values/sizes.dart';
import 'package:almaren/widgets/appbar.dart';
import 'package:almaren/widgets/avatar_widget.dart';
import 'package:almaren/widgets/blur_widget.dart';
import 'package:almaren/widgets/online_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch_panel/flutter_switch_panel.dart';
import 'package:get/get.dart';

/// 聊天页面
class ChatPage extends GetView<ChatLogic> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatLogic());

    final keyBoardHeight = MediaQuery.of(context).viewInsets.bottom;
    controller.switchPanelController.setKeyBoardHeight(keyBoardHeight);
    //debugPrint("键盘高度:$keyBoardHeight");

    return Scaffold(
      appBar: blurAppBarEx(
        appHeight: 60,
        titleSpacing: 0,
        context: context,
        fadeAnimation: controller.fadeAnimation,
        scrollController: controller.scrollController,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: Sizes.borderRadiusSmall,
              child: OnlineBoxWidget(
                online: controller.online,
                child: AvatarWidget(
                  size: 40,
                  avatar: controller.chat?.portrait,
                ),
              ),
            ),
            16.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.chat?.name ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                2.verticalSpace,
                Text(
                  controller.online ? "Online" : "",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color:
                        controller.online
                            ? ThemeColors.greenColor
                            : ThemeColors.greyColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("images/camera.svg"),
          ),
        ],
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: _buildView(),
      bottomNavigationBar: _buildInputView(context),
    );
  }

  // 主视图
  Widget _buildView() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        KeyboardUtils.hide();
        controller.switchPanelController.hide();
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            cacheExtent: 2000,
            controller: controller.scrollController,
            slivers: [
              SliverSafeArea(
                sliver: SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  sliver: _buildList(constraints),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildList(BoxConstraints constraints) {
    /// 计算图片的缓存宽度 1.5倍超采样
    //int cacheWidth = (MediaQuery.sizeOf(context).width * 1.5).toInt();
    return Obx(
      () => SliverList.separated(
        itemCount: controller.message.length,
        itemBuilder: (context, index) {
          Message message = controller.message[index];
          return _buildItem(message, constraints);
        },
        separatorBuilder: (BuildContext context, int index) {
          return 20.verticalSpace;
        },
      ),
    );
  }

  Widget _buildItem(Message message, BoxConstraints constraints) {
    List<Widget> children = List.empty(growable: true);
    // 内容组件
    Widget content;
    // 根绝类型渲染对应组件
    switch (message.type) {
      case MessageType.text:
        content = TextMessage(message: message);
        break;
      case MessageType.image:
        content = ImageMessage(message: message);
        break;
      default:
        content = SizedBox();
        break;
    }

    ConstrainedBox render = ConstrainedBox(
      constraints: BoxConstraints(maxWidth: constraints.maxWidth / 2),
      child: content,
    );

    /// 头像组件
    Widget avatar = ClipRRect(
      borderRadius: Sizes.borderRadiusSmall,
      child: AvatarWidget(size: 40, avatar: controller.chat?.portrait),
    );
    if (message.send) {
      //发出消息
      children.add(
        Expanded(child: Align(alignment: Alignment.centerRight, child: render)),
      );
      children.add(
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: avatar,
        ),
      );
    } else {
      //收到消息
      children.add(
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: avatar,
        ),
      );
      children.add(
        Expanded(child: Align(alignment: Alignment.centerLeft, child: render)),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  //       bottomNavigationBar: BlurWidgetEx(
  //         child: SafeArea(
  //           child: Padding(
  //             child: TextField(
  //               decoration: InputDecoration(

  //               ),
  //             ),
  //           ),
  //         ),
  //       ),

  // 输入框
  Widget _buildInputView(BuildContext context) {
    return BlurWidgetEx(
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
                bottom: 10,
              ),

              child: DefaultTextHeightBehavior(
                textHeightBehavior: TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                  //applyHeightToLastDescent: false,
                  //leadingDistribution: TextLeadingDistribution.proportional,
                ),
                child: TextField(
                  controller: controller.inputController,
                  onChanged: (value) {
                    controller.showSend.value = value.isNotEmpty;
                  },
                  onTap: () async {
                    controller.switchPanelController.show();
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0x40FEFEFE),
                    hintText: "say something.",
                    prefixIcon: IconButton(
                      onPressed: () async {
                        KeyboardUtils.hide();
                        controller.switchPanelController.show(index: 0);
                      },
                      icon: SvgPicture.asset("images/emoji.svg"),
                    ),
                    suffixIcon: Obx(
                      () =>
                          controller.showSend.value
                              ? IconButton(
                                onPressed: controller.sendText,
                                icon: SvgPicture.asset(
                                  "images/send.svg",
                                  width: 20,
                                  height: 20,
                                ),
                              )
                              : IconButton(
                                onPressed: () async {
                                  KeyboardUtils.hide();
                                  controller.switchPanelController.show(
                                    index: 1,
                                  );
                                },
                                icon: SvgPicture.asset("images/plus.svg"),
                              ),
                    ),
                  ),
                ),
              ),
            ),
            _buildBottom(),
          ],
        ),
      ),
    );
  }

  // 底部区域
  Widget _buildBottom() {
    return FlutterSwitchPanel(
      panelHeight: 160,
      controller: controller.switchPanelController,
      children: [_buildEmojiPickerPanel(), _buildToolPanel()],
    );
  }

  // 底部表情选择容器
  Widget _buildEmojiPickerPanel() {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      itemCount: 100,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 32,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (BuildContext context, int index) {
        //'assets/emoji/emoji-1.svg'
        int id = index + 1;
        return SvgPicture.asset('images/emoji/emoji-$id.svg');
      },
    );
  }

  // 工具箱容器
  Widget _buildToolPanel() {
    return GridView(
      padding: const EdgeInsets.only(top: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 20,
        mainAxisExtent: 60,
      ),
      children: [
        _buildToolItem(
          name: "Album", //"相册"
          icon: "images/tools/chatAlbum.webp",
          onTap: controller.ontapAlbum,
        ),
        _buildToolItem(
          name: "Photo", //"拍摄"
          icon: "images/tools/chatCamera.webp",
          onTap: controller.ontapPhoto,
        ),
        _buildToolItem(
          name: "Call", //"音视频通话"
          icon: "images/tools/chatCall.webp",
        ),
        _buildToolItem(
          name: "File", //"文件"
          icon: "images/tools/chatFile.webp",
        ),
        _buildToolItem(
          name: "Wallet", //"红包"
          icon: "images/tools/chatHongbao.webp",
        ),
        _buildToolItem(
          name: "Transfer", //"转账"
          icon: "images/tools/chatTransfer.webp",
        ),
        _buildToolItem(
          name: "Collect", //收藏
          icon: "images/tools/chatCollect.webp",
        ),
      ],
    );
  }

  // 工具箱单项
  Widget _buildToolItem({
    required String name,
    required String icon,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, width: 24, height: 24),
          6.verticalSpace,
          Text(
            name,
            style: const TextStyle(fontSize: 15, color: Color(0xFF333333)),
          ),
        ],
      ),
    );
  }
}
