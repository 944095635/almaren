import 'package:almaren/page/chat/chat_input_button.dart';
import 'package:almaren/page/chat/chat_input_controller.dart';
import 'package:almaren/page/chat/enum/chat_input_type.dart';
import 'package:almaren/theme/dimensions.dart';
import 'package:chat_bottom_container/panel_container.dart';
import 'package:chat_bottom_container/typedef.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 聊天页面的输入组件
class ChatInput extends StatefulWidget {
  const ChatInput({
    super.key,
    required this.isSelectMode,
    required this.onTapSend,
    required this.onTapAlbum,
    required this.onTapCamera,
    required this.onTapMenuFile,
    required this.onTapMenuCollect,
    required this.onTapMenuTransfer,
    required this.onTapMenuRedPacket,
    required this.chatInputController,
  });

  /// 是否多选模式
  final bool isSelectMode;

  /// 输入控制器
  final ChatInputController chatInputController;

  /// 点击发送
  final Function(String text) onTapSend;

  /// 点击相册
  final VoidCallback onTapAlbum;

  /// 点击拍摄
  final VoidCallback onTapCamera;

  /// 点击发送文件
  final VoidCallback onTapMenuFile;

  /// 点击我的收藏
  final VoidCallback onTapMenuCollect;

  /// 点击转账
  final VoidCallback onTapMenuTransfer;

  /// 点击发红包
  final VoidCallback onTapMenuRedPacket;

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  /// 是否只读
  bool readOnly = false;

  /// 是否能够发送
  final RxBool canSend = RxBool(false);

  /// 当前底部容器类型
  ChatInputType _currentInputType = ChatInputType.none;

  /// 输入框焦点
  final FocusNode _inputFocusNode = FocusNode();

  ///  输入控制器
  final ChatBottomPanelContainerController<ChatInputType> _controller =
      ChatBottomPanelContainerController();

  /// 输入框控制器
  final TextEditingController _textController = TextEditingController();

  /// 键盘高度变化
  ChatKeyboardChangeKeyboardPanelHeight? changeKeyboardPanelHeight;

  @override
  void initState() {
    super.initState();
    _textController.addListener(onTextChanged);
    widget.chatInputController.addListener(hidePanel);
  }

  @override
  void dispose() {
    /// 销毁用到的资源
    canSend.close();
    _inputFocusNode.dispose();
    changeKeyboardPanelHeight = null;
    _textController.removeListener(onTextChanged);
    widget.chatInputController.removeListener(hidePanel);
    super.dispose();
  }

  void onTextChanged() {
    if (_textController.text.isEmpty) {
      canSend.value = false;
    } else {
      canSend.value = true;
    }
  }

  /// 点击发送
  void _onTapSend() {
    String text = _textController.text.trim();
    widget.onTapSend.call(text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    //mediaQuery.padding.bottom + 10.h
    //EdgeInsets padding = MediaQuery.of(context).padding;
    //color: Colors.green,
    // padding: EdgeInsets.only(
    //   //bottom: padding.bottom,
    // ),
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInput(),
            // 底部容器
            ChatBottomPanelContainer<ChatInputType>(
              panelBgColor: Colors.white,
              // 控制器（必传，ChatBottomPanelContainerController）
              // panelBgColor: const Color(0xFFFBFBFB),
              controller: _controller,
              // 输入框焦点对象（必传，FocusNode）
              inputFocusNode: _inputFocusNode,
              // 面板类型切换回调（按需实现，主要用来记录当前的面板类型是什么）
              onPanelTypeChange: onPanelTypeChange,
              changeKeyboardPanelHeight: changeKeyboardPanelHeight,
              otherPanelWidget: (type) {
                if (type == null) return const SizedBox.shrink();
                switch (type) {
                  case ChatInputType.emoji:
                    return _buildEmojiPickerPanel();
                  case ChatInputType.tool:
                    return _buildToolPanel();
                  case ChatInputType.voice:
                    return _buildRecordPanel();
                  default:
                    return const SizedBox.shrink();
                }
              },
              // 自定义容器回调
              // customPanelContainer: (panelType, data) {
              //   if (!mounted) return const SizedBox.shrink();

              //   Widget? container = state.customPanelContainer;
              //   if (container != null) {
              //     // 已创建，刷新自定义容器，可以按需只刷新自定义容器里的子部件
              //     logic.update([
              //       ChatAnimationUpdateType.customPanelContainer,
              //     ]);
              //     return container;
              //   }
              //   // 未创建，则创建
              //   container = const ChatAnimationFadePanelContainer();
              //   // 记录起来
              //   state.customPanelContainer = container;
              //   return container;
              // },
            ),
          ],
        ),

        if (widget.isSelectMode)
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildMultipleTools(),
          ),
      ],
    );
  }

  Widget _buildInput() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Color(0xFFF5F5F5),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      child: Row(
        spacing: 12,
        children: [
          ChatInputButton(
            onTap: () {
              onTapChatInput(ChatInputType.emoji);
            },
            icon: "assets/svgs/chat/emoji.svg",
          ),
          Expanded(
            child: Listener(
              onPointerUp: (event) {
                // Currently it may be emojiPanel.
                if (readOnly) {
                  updatePanelType(ChatInputType.keyboard);
                }
              },
              child: TextField(
                minLines: 1,
                maxLines: 5,
                showCursor: true,
                cursorHeight: 14,
                cursorColor: Colors.black,
                readOnly: readOnly,
                controller: _textController,
                focusNode: _inputFocusNode,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 8,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: Dimensions.borderRadiusSmall,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: Dimensions.borderRadiusSmall,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: Dimensions.borderRadiusSmall,
                  ),
                ),
              ),
            ),
          ),

          // ChatInputButton(
          //   onTap: () {
          //     // onTapChatInput(ChatInputType.voice);
          //     // hidePanel();
          //     onTapChatInput(ChatInputType.voice);
          //   },
          //   icon: "assets/images/chat/voice.png",
          // ),
          Obx(
            () => canSend.value
                ? ChatInputButton(
                    onTap: _onTapSend,
                    icon: "assets/svgs/chat/send.svg",
                  )
                : ChatInputButton(
                    onTap: () {
                      onTapChatInput(ChatInputType.tool);
                    },
                    icon: "assets/svgs/plus.svg",
                  ),
          ),
        ],
      ),
    );
  }

  /// 多选菜单
  Widget _buildMultipleTools() {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("转发"),
              Text("删除"),
              Text("收藏"),
            ],
          ),
        ),
      ),
    );
  }

  /// 录音组件
  Widget _buildRecordPanel() {
    return const SizedBox(
      height: 240,
    );
  }

  /// 工具箱
  Widget _buildToolPanel() {
    return SizedBox(
      height: 240,
      // color: Colors.white,
      // color: const Color(0xFFFBFBFB),
      // child: ChatInputTools(
      //   onTapFile: widget.onTapMenuFile,
      //   onTapAlbum: widget.onTapAlbum,
      //   onTapCamera: widget.onTapCamera,
      //   onTapCollect: widget.onTapMenuCollect,
      //   onTapTransfer: widget.onTapMenuTransfer,
      //   onTapRedPacket: widget.onTapMenuRedPacket,
      // ),
    );
  }

  /// 表情包
  Widget _buildEmojiPickerPanel() {
    // If the keyboard height has been recorded, priority is given to setting
    // the height to the keyboard height.
    double height = 300;
    final keyboardHeight = _controller.keyboardHeight;
    if (keyboardHeight != 0) {
      if (changeKeyboardPanelHeight != null) {
        height = changeKeyboardPanelHeight!.call(keyboardHeight);
      } else {
        height = keyboardHeight;
      }
    }
    return SizedBox(
      height: height,
      // child: ChatEmojiWidget(
      //   onTap: (emoji) {
      //     final text = _textController.text;
      //     final selection = _textController.selection;
      //     final int start = selection.isValid ? selection.start : text.length;
      //     final int end = selection.isValid ? selection.end : text.length;
      //     final newText = text.replaceRange(start, end, emoji);
      //     final int newOffset = start + emoji.length;
      //     _textController.value = TextEditingValue(
      //       text: newText,
      //       selection: TextSelection.collapsed(offset: newOffset),
      //       composing: TextRange.empty,
      //     );
      //     _inputFocusNode.requestFocus();
      //   },
      // ),
    );
  }

  /// 点击输入组件
  void onTapChatInput(ChatInputType type) {
    updatePanelType(
      type == _currentInputType ? ChatInputType.keyboard : type,
    );
  }

  /// 隐藏底部组件
  void hidePanel() {
    if (_inputFocusNode.hasFocus) {
      _inputFocusNode.unfocus();
    }
    updateInputView(isReadOnly: false);
    if (ChatBottomPanelType.none == _controller.currentPanelType) return;
    _controller.updatePanelType(ChatBottomPanelType.none);
  }

  /// 更新输入视图
  bool updateInputView({
    required bool isReadOnly,
  }) {
    if (readOnly != isReadOnly) {
      readOnly = isReadOnly;
      setState(() {});
      return true;
    }
    return false;
  }

  /// 更新底部视图类型
  Future<void> updatePanelType(ChatInputType type) async {
    final isSwitchToKeyboard = ChatInputType.keyboard == type;
    final isSwitchToEmojiPanel = ChatInputType.emoji == type;
    bool isUpdated = false;
    switch (type) {
      case ChatInputType.keyboard:
        updateInputView(isReadOnly: false);
        break;
      case ChatInputType.emoji:
        isUpdated = updateInputView(isReadOnly: true);
        break;
      default:
        break;
    }

    updatePanelTypeFunc() {
      _controller.updatePanelType(
        isSwitchToKeyboard
            ? ChatBottomPanelType.keyboard
            : ChatBottomPanelType.other,
        data: type,
        forceHandleFocus: isSwitchToEmojiPanel
            ? ChatBottomHandleFocus.requestFocus
            : ChatBottomHandleFocus.none,
      );
    }

    if (isUpdated) {
      // Waiting for the input view to update.
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        updatePanelTypeFunc();
      });
    } else {
      updatePanelTypeFunc();
    }
  }

  /// 底部容器切换事件
  void onPanelTypeChange(
    ChatBottomPanelType panelType,
    ChatInputType? data,
  ) {
    debugPrint('panelType: $panelType');
    switch (panelType) {
      case ChatBottomPanelType.none:
        _currentInputType = ChatInputType.none;
        break;
      case ChatBottomPanelType.keyboard:
        _currentInputType = ChatInputType.keyboard;
        break;
      case ChatBottomPanelType.other:
        if (data == null) return;
        switch (data) {
          case ChatInputType.emoji:
            _currentInputType = ChatInputType.emoji;
            break;
          case ChatInputType.tool:
            _currentInputType = ChatInputType.tool;
            break;
          default:
            _currentInputType = ChatInputType.none;
            break;
        }
        break;
    }
  }
}
