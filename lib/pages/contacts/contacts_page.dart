import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:almaren/models/contacts.dart';
import 'package:almaren/pages/contacts/contacts_item.dart';
import 'package:almaren/pages/contacts/contacts_logic.dart';
import 'package:almaren/widgets/appbar.dart';
import 'package:almaren/widgets/body_title.dart';

/// 联系人页面
class ContactsPage extends GetView<ContactsLogic> {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ContactsLogic());
    return Scaffold(
      appBar: blurAppBarFade(
        context: context,
        fadeAnimation: controller.fadeAnimation,
        scrollController: controller.scrollController,
        title: "Contacts",
      ),
      extendBodyBehindAppBar: true,
      body: controller.obx(
        (state) => _buildList(context),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return CustomScrollView(
      controller: controller.scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverSafeArea(
          bottom: false,
          sliver: SliverToBoxAdapter(
            child: BodyTitle("Contacts"),
          ),
        ),
        SliverSafeArea(
          top: false,
          sliver: SliverList.builder(
            itemCount: controller.contacts.length,
            itemBuilder: (context, index) {
              Contacts contacts = controller.contacts[index];
              return ContactsItem(
                contacts: contacts,
                onTap: () {},
              );
            },
          ),
        )
      ],
    );
  }
}
