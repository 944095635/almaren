import 'package:flutter/material.dart';

class KeyboardUtils {
  static void hide() => FocusManager.instance.primaryFocus?.unfocus();
}