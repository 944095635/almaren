import 'package:almaren/model/contacts.dart';
import 'package:almaren/page/contacts/contacts_controller.dart';
import 'package:almaren/styles/colors.dart';
import 'package:almaren/widget/common_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

//联系人
class ContactsPage extends GetView<ContactsController> {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ContactsController());
    return Scaffold(
      appBar: getAppBar(
        leading: IconButton(
          onPressed: controller.showSearchPage,
          icon: SvgPicture.asset("images/home/search.svg"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("images/home/plus.svg"),
          ),
        ],
        title: Obx(
          () => AnimatedOpacity(
            opacity: controller.titleOpacity.value,
            duration: const Duration(milliseconds: 300),
            child: Text(
              "Contacts",
              style: Theme.of(context).textTheme.labelLarge!,
            ),
          ),
        ),
        //bottom: getTitle(context, "Contacts"),
      ),
      extendBodyBehindAppBar: true,
      body: EasyRefresh(
        controller: controller.refreshController,
        onRefresh: () async {
          await controller.loadData();
          return IndicatorResult.success;
        },
        // onLoad: () async {
        //   await controller.loadData();
        //   return IndicatorResult.success;
        // },
        child: controller.obx(
          (state) => ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.data.length + 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 1) {
                return getListTitle("Contacts");
              }
              if (index == 0) {
                return const HeaderLocator();
              }
              Contacts item = controller.data[index - 2];
              return InkWell(
                onTap: () {
                  controller.showContacts(item);
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                  child: Row(
                    children: [
                      getOnlineBox(
                        item.portrait != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(6.r),
                                child: ImageFiltered(
                                  imageFilter: const ColorFilter.mode(
                                    Colors.grey,
                                    BlendMode.color,
                                  ),
                                  enabled: !item.online,
                                  child: Image.asset(
                                    item.portrait!,
                                    fit: BoxFit.cover,
                                    width: 52.w,
                                    height: 50.w,
                                    cacheWidth: 250,
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
                                  item.localPortrait ?? "",
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                        online: item.online,
                      ),
                      16.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.displayName ?? "",
                              overflow: TextOverflow.ellipsis,
                            ),
                            10.verticalSpace,
                            Text(
                              item.online ? "Online" : "",
                              maxLines: 1,
                              style: Theme.of(Get.context!)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: AlColors.greenColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          onLoading: getLoadingView(),
        ),
      ),
    );
  }
}
