import 'package:almaren/pages/settings/settings_logic.dart';
import 'package:almaren/widgets/appbar.dart';
import 'package:almaren/widgets/body_title.dart';
import 'package:almaren/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

/// 设置页面
class SettingsPage extends GetView<SettingsLogic> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsLogic());
    return Scaffold(
      appBar: blurAppBar(
        title: Obx(
          () => AnimatedOpacity(
            opacity: controller.titleOpacity.value,
            duration: const Duration(milliseconds: 300),
            child: Text(
              "Settings",
              style: Theme.of(context).textTheme.labelLarge!,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: controller.logout,
            icon: SvgPicture.asset("images/logout.svg"),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        controller: controller.scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BodyTitle(
                    "Settings",
                  ),
                  20.verticalSpace,
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
                ],
              ),
            ),
          ),
          // SliverFillRemaining(
          //   hasScrollBody: false,
          //   child: SafeArea(
          //     top: false,
          //     child: Align(
          //       alignment: Alignment.bottomCenter,
          //       child: Padding(
          //         padding: Sizes.buttonPadding,
          //         child: ElevatedButton(
          //           onPressed: controller.logout,
          //           child: Text("logout"),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
