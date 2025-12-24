import 'package:almaren/page/chats/chats_page.dart';
import 'package:flutter/material.dart';

class FramePage extends StatefulWidget {
  const FramePage({super.key});

  @override
  State<FramePage> createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {
  int pageIndex = 0;

  final List<Widget> pages = [ChatsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
    );
  }
}
