import 'package:almaren/models/contacts.dart';
import 'package:almaren/page/contacts/contacts_item.dart';
import 'package:almaren/page/contacts/contacts_logic.dart';
import 'package:almaren/widgets/body_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactsPage extends GetView<ContactsLogic> {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
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
            child: BodyTitle("Contacts"),
          ),
        ),
        SliverSafeArea(
          top: false,
          sliver: SliverList.builder(
            itemCount: controller.contacts.length,
            itemBuilder: (context, index) {
              final Contacts contacts = controller.contacts[index];
              return ContactsItem(
                contacts: contacts,
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
