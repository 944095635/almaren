import 'package:almaren/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingPage1 extends StatefulWidget {
  const SettingPage1({super.key});

  @override
  State<SettingPage1> createState() => _SettingPageState1();
}

class _SettingPageState1 extends State<SettingPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("images/home/logout.svg"),
          ),
          10.horizontalSpace,
        ],
        bottom: getTitle(context, "Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          getItem("Saved media"),
          getItem("Notifications"),
          getItem("Profile"),
          getItem("Privacy and security"),

          // getContactsItem(
          //     "7_bit", "https://th.wallhaven.cc/small/2y/2y3wr9.jpg", 0),
          // getContactsItem(
          //     "✮ꦿ溪水相依", "https://th.wallhaven.cc/small/3l/3lry89.jpg", 0),
          // getContactsItem(
          //     "꧁✾绿豆芽✾ ꧂", "https://th.wallhaven.cc/small/9d/9dree1.jpg", 0),
          // getContactsItem(
          //     "欧米伽的西格玛", "https://th.wallhaven.cc/small/we/wemrd7.jpg", 0),
          // getContactsItem(
          //     "失重外太空", "https://th.wallhaven.cc/small/3l/3l5mz3.jpg", 0),
          // getContactsItem(,
          //     "", 1),
          // getContactsItem(
          //     "属于@我的回忆~", "https://th.wallhaven.cc/small/2y/2y3dkx.jpg", 1),
          // getContactsItem("Li Li",
          //     "https://w.wallhaven.cc/full/9d/wallhaven-9drk58.jpg", 1),
          // getContactsItem(
          //     "", "", 1),
          // getContactsItem(
          //     "苍银战甲", "https://th.wallhaven.cc/small/o5/o5lzx7.jpg", 1),
          // getContactsItem(
          //     "伤心的甜甜.", "https://th.wallhaven.cc/small/we/wem35r.jpg", 1),
          // getContactsItem(
          //     "殇城~喵", "https://th.wallhaven.cc/small/vq/vq5z7l.jpg", 1),
          // getContactsItem("C·Jane·Larkey Chiter",
          //     "https://th.wallhaven.cc/small/5g/5gk9q1.jpg", 1),
        ],
      ),
    );
  }

  Widget getItem(String title) {
    return ListTile(
      onTap: () {},
      title: Text(title),
    );
  }
}
