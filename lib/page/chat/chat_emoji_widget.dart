import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xml/xml.dart';

/// 表情包组件
class ChatEmojiWidget extends StatelessWidget {
  const ChatEmojiWidget({super.key, this.onTap});

  /// 点击表情包的回调事件
  final Function(String emoji)? onTap;

  /// 表情包列表
  static final emojiList = List<String>.empty(growable: true);

  /// 是否正在获取数据
  static bool isFetching = false;

  /// 初始化UI部分
  static Future<List<String>> initEmoji() async {
    if (isFetching) {
      debugPrint('initEmoji: 表情包正在加载,请稍后再试');
      return emojiList;
    }
    if (emojiList.isNotEmpty) {
      debugPrint("initEmoji: 表情包从缓存中读取");
      return emojiList;
    }
    isFetching = true;
    debugPrint('initEmoji: 表情包从 assets 里加载表情包');
    final emojiString = await rootBundle.loadString('assets/emoji.plist');
    final document = XmlDocument.parse(emojiString);
    emojiList.clear();
    for (var node in document.findAllElements('string')) {
      final value = node.innerText;
      emojiList.add(value);
    }
    isFetching = false;
    return emojiList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initEmoji(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CustomScrollView(
            slivers: [
              SliverSafeArea(
                sliver: SliverPadding(
                  padding: EdgeInsets.all(15),
                  sliver: SliverGrid.builder(
                    itemCount: emojiList.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 48,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                    itemBuilder: (BuildContext context, int index) {
                      return _buildEmojiItem(
                        emojiList[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildEmojiItem(String emoji) {
    return GestureDetector(
      onTap: () {
        onTap?.call(emoji);
      },
      child: Text(
        emoji,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}
