import 'package:almaren/model/contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//联系人详情页
class ContactsInfoPage extends StatelessWidget {
  const ContactsInfoPage(this.contact, {super.key});
  final Contacts contact;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        children: [
          contact.portrait != null
              ? Container(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200.r),
                    child: Image.asset(
                      contact.portrait!,
                      fit: BoxFit.cover,
                       width: 150.w,
                      height: 150.w,
                     cacheWidth: 450,
                    ),
                  ),
                )
              : Container(
                  width: 52.w,
                  height: 50.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Text(
                    contact.localPortrait ?? "",
                    style: TextStyle(fontSize: 11.sp, color: Colors.white),
                  ),
                ),
          20.verticalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  contact.displayName ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(Get.context!).textTheme.titleLarge,
                ),
                10.verticalSpace,
                Text(
                  contact.name ?? "",
                  style: Theme.of(Get.context!).textTheme.titleMedium,
                ),
                10.verticalSpace,
                Text(
                  contact.extra ?? "",
                  style: Theme.of(Get.context!).textTheme.displayMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
