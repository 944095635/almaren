/// 文字处理组件
class TextUtils {
  /// 处理中文换行问题
  static String formatOverflow(String text) {
    StringBuffer sb = StringBuffer();
    for (var e in text.runes) {
      sb.write(String.fromCharCode(e));
      sb.write("\u200B");
    }
    return sb.toString();
  }
}
