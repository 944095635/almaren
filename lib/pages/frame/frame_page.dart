import 'package:almaren/pages/chats/chats_page.dart';
import 'package:almaren/pages/contacts/contacts_page.dart';
import 'package:almaren/pages/settings/settings_page.dart';
import 'package:almaren/values/colors.dart';
import 'package:almaren/widgets/blur_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FramePage extends StatefulWidget {
  const FramePage({super.key});

  @override
  State<FramePage> createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {
  int pageIndex = 0;

  final List pages = [
    const ChatsPage(),
    const ContactsPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[pageIndex],
      bottomNavigationBar: BlurWidgetEx(
        backgroundColor: ThemeColors.glassColor,
        child: BottomNavigationBar(
          onTap: (index) {
            pageIndex = index;
            setState(() {});
          },
          currentIndex: pageIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              activeIcon:
                  SvgPicture.asset("images/frame/frame_chat_active.svg"),
              icon: SvgPicture.asset("images/frame/frame_chat.svg"),
              label: "CHAT",
            ),
            BottomNavigationBarItem(
              activeIcon:
                  SvgPicture.asset("images/frame/frame_contacts_active.svg"),
              icon: SvgPicture.asset("images/frame/frame_contacts.svg"),
              label: "Contacts",
            ),
            BottomNavigationBarItem(
              activeIcon:
                  SvgPicture.asset("images/frame/frame_settings_active.svg"),
              icon: SvgPicture.asset("images/frame/frame_settings.svg"),
              label: "SETTING",
            )
          ],
        ),
      ),
    );
  }
}
