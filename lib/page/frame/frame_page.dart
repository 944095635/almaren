import 'package:almaren/page/chats/chats_logic.dart';
import 'package:almaren/page/chats/chats_page.dart';
import 'package:almaren/page/contacts/contacts_logic.dart';
import 'package:almaren/page/contacts/contacts_page.dart';
import 'package:almaren/page/settings/settings_page.dart';
import 'package:almaren/widgets/blur_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FramePage extends StatefulWidget {
  const FramePage({super.key});

  @override
  State<FramePage> createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    Get.put(ChatsLogic());
    Get.put(ContactsLogic());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: pageIndex,
        children: [
          const ChatsPage(),
          const ContactsPage(),
          const SettingsPage(),
        ],
      ),
      bottomNavigationBar: BlurWidget(
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
              activeIcon: SvgPicture.asset(
                "assets/svgs/frame/frame_chat_active.svg",
              ),
              icon: SvgPicture.asset("assets/svgs/frame/frame_chat.svg"),
              label: "CHAT",
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/svgs/frame/frame_contacts_active.svg",
              ),
              icon: SvgPicture.asset("assets/svgs/frame/frame_contacts.svg"),
              label: "Contacts",
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/svgs/frame/frame_settings_active.svg",
              ),
              icon: SvgPicture.asset("assets/svgs/frame/frame_settings.svg"),
              label: "SETTING",
            ),
          ],
        ),
      ),
    );
  }
}
