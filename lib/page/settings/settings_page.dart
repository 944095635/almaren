import 'package:almaren/page/settings/settings_logic.dart';
import 'package:almaren/widgets/blur_widget.dart';
import 'package:almaren/widgets/body_title.dart';
import 'package:almaren/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled/size_extension.dart';
import 'package:get/state_manager.dart';

/// 个人中心页面
class SettingsPage extends GetView<SettingsLogic> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeTransition(
          opacity: controller.fadeAnimation,
          child: Text(
            "Settings",
          ),
        ),
        centerTitle: false,
        flexibleSpace: BlurWidget(
          child: SizedBox.expand(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: controller.obx(
        (state) => _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      controller: controller.scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverSafeArea(
          bottom: false,
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BodyTitle("Settings"),
                10.verticalSpace,
                MenuItem(
                  title: "Saved media",
                  onTap: () {},
                ),
                MenuItem(
                  title: "Notifications",
                  onTap: () {},
                ),
                MenuItem(
                  title: "Privacy and security",
                  onTap: () {},
                ),
                MenuItem(
                  title: "Logout",
                  onTap: controller.logout,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
