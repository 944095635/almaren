import 'package:almaren/page/chats/chats_page.dart';
import 'package:almaren/page/contacts/contacts_page.dart';
import 'package:almaren/page/frame/frame_controller.dart';
import 'package:almaren/page/setting/setting_page.dart';
import 'package:almaren/styles/colors.dart';
import 'package:almaren/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FramePage extends GetView<FrameController> {
  const FramePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FrameController());
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.selectPageIndex.value,
          children: const [
            ChatsPage(),
            ContactsPage(),
            SettingPage(),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: getFilterWidget(
        hasColor: false,
        child: Obx(
          () => BottomNavigationBar(
            onTap: (index) {
              controller.selectPageIndex.value = index;
            },
            backgroundColor: AlColors.glassColor,
            currentIndex: controller.selectPageIndex.value,
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
      ),
    );
  }
}
