import 'package:almaren/models/contacts.dart';
import 'package:almaren/values/sizes.dart';
import 'package:almaren/widgets/avatar_widget.dart';
import 'package:almaren/widgets/online_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled/size_extension.dart';

/// 联系人列表 - 子项
class ContactsItem extends StatelessWidget {
  const ContactsItem({
    super.key,
    required this.contacts,
    required this.onTap,
  });

  final Contacts contacts;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: Sizes.borderRadiusSmall,
              child: AvatarWidget(avatar: contacts.portrait),
            ),
            16.horizontalSpace,

            /// 昵称 和 消息内容
            Expanded(
              child: Text(
                contacts.name,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
