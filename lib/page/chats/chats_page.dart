import 'package:almaren/common/routes.dart';
import 'package:almaren/model/chat.dart';
import 'package:almaren/page/chats/chats_controller.dart';
import 'package:almaren/widget/common_widget.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChatsPage extends GetView<ChatsController> {
  const ChatsPage({super.key});

  // final BottomSheetBehavior? behavior = BottomSheetBehavior.EXPANDED;

  // /// 状态回调
  // void _onBehaviorChanged(BottomSheetBehavior behavior) {
  //   if (this.behavior == behavior) {
  //     return;
  //   }
  //   setState(() {
  //     this.behavior = behavior;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Get.put(ChatsController());
    return Scaffold(
      appBar: getAppBar(
        leading: IconButton(
          onPressed: Routes.showSearchPage,
          icon: SvgPicture.asset("images/home/search.svg"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //Scaffold.of(context).showBottomSheet((context) => null);
              controller.showMenu();
            },
            icon: SvgPicture.asset("images/home/plus.svg"),
          ),
        ],
        title: Obx(
          () => AnimatedOpacity(
            opacity: controller.titleOpacity.value,
            duration: const Duration(milliseconds: 300),
            child: Text(
              "Chats",
              style: Theme.of(context).textTheme.labelLarge!,
            ),
          ),
        ),
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(50),
        //   child: Container(
        //     padding: EdgeInsets.only(left: 24.w),
        //     alignment: Alignment.centerLeft,
        //     child: Text(
        //       "Chats",
        //       style: Theme.of(context)
        //           .textTheme
        //           .labelLarge!
        //           .copyWith(fontSize: 40),
        //     ),
        //   ),
        // ),
      ),
      extendBodyBehindAppBar: true,
      body: EasyRefresh(
        controller: controller.refreshController,
        onRefresh: () async {
          await controller.loadData();
          return IndicatorResult.success;
        },
        child: controller.obx(
          (state) => ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.data.length + 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 1) {
                return Column(
                  children: [
                    getListTitle("Chats"),
                    !controller.online.value
                        ? Text(
                            "offline",
                            style: Theme.of(context).textTheme.displaySmall,
                          )
                        : const SizedBox(),
                  ],
                );
              }
              if (index == 0) {
                return const HeaderLocator();
              }
              Chat chat = controller.data[index - 2];
              return InkWell(
                onTap: () {
                  controller.showChat(chat);
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                  child: Row(
                    children: [
                      chat.portrait != null
                          ? getOnlineBox(
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6.r),
                                child: ImageFiltered(
                                  imageFilter: const ColorFilter.mode(
                                    Colors.grey,
                                    BlendMode.color,
                                  ),
                                  enabled: !chat.online,
                                  child: Image.asset(
                                    chat.portrait!,
                                    fit: BoxFit.cover,
                                    width: 52.w,
                                    height: 50.w,
                                    cacheWidth: 200,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 52.w,
                                        height: 50.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6.r),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                        ),
                                        child: Text(
                                          chat.localPortrait ?? "",
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              color: Colors.white),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              online: chat.online,
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
                                chat.localPortrait ?? "",
                                style: TextStyle(
                                    fontSize: 11.sp, color: Colors.white),
                              ),
                            ),
                      16.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chat.name ?? "",
                              overflow: TextOverflow.ellipsis,
                            ),
                            10.verticalSpace,
                            Text(
                              chat.msg ?? "",
                              maxLines: 1,
                              style:
                                  Theme.of(Get.context!).textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            chat.timestamp ?? "",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          10.verticalSpace,
                          chat.unread != 0
                              ? getCountBox(chat.unread)
                              : const SizedBox()
                        ],
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
