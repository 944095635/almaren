class Msg<T> {
  bool byMe = true;
  MsgType type = MsgType.text;
  T? value;
}

enum MsgType { text, image, time }
