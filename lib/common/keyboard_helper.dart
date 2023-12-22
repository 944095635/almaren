import 'package:flutter/material.dart';

class KeyboardHelper {
  static void hide() => FocusManager.instance.primaryFocus?.unfocus();
}
