import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/* 密码输入框 */
class AlTextField extends StatefulWidget {
  const AlTextField({
    super.key,
    this.hintText,
    this.controller,
    this.canClean = true,
    this.canSend = false,
    this.isPassword = false,
    this.keyboardType,
    this.send,
  });

  //发送
  final Function()? send;

  //输入类型
  final TextInputType? keyboardType;

  /* 水印文字 */
  final String? hintText;

  /* 编辑器 */
  final TextEditingController? controller;

  /* 是否密码输入框 */
  final bool isPassword;

  //支持一键清空
  final bool canClean;

  //支持发送
  final bool canSend;

  @override
  State<AlTextField> createState() => _ElfTextFieldState();
}

class _ElfTextFieldState extends State<AlTextField> {
  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  /* 是否显示密码字符 */
  late bool obscureText;

  /* 显示清除按钮 */
  bool displayClean = false;

  /* 显示密码按钮 */
  bool displayPwdBtn = false;

  /* 清除输入 */
  void clearInput() {
    widget.controller?.clear();
    displayPwdBtn = displayClean = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget>? buttons = [];
    if (widget.canClean && displayClean) {
      buttons.add(IconButton(
        onPressed: clearInput,
        icon: SvgPicture.asset("images/widget/input_clear.svg"),
      ));
    }

    if (widget.canSend) {
      buttons.add(IconButton(
        onPressed: widget.send,
        icon: SvgPicture.asset("images/widget/input_send.svg"),
      ));
    }

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.all(
          Radius.circular(12.r),
        ),
        border: Border.all(
          color: const Color(0x44EEEEEE),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Color(0x22AAAAAA),
        //     blurRadius: 1,
        //   ),
        // ],
      ),
      child: TextField(
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        textInputAction: TextInputAction.done,
        obscureText: obscureText,
        onChanged: (text) {
          //输入的字符不为空
          if (text.isNotEmpty) {
            displayPwdBtn = true;
            if (!displayClean) {
              displayClean = true;
            }
          } else {
            displayPwdBtn = false;
            if (displayClean) {
              displayClean = false; //文字是空的
            }
          }
          setState(() {});
        },
        decoration: InputDecoration(
          // border: OutlineInputBorder(
          //   borderSide: BorderSide.none,
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(12.r),
          //   ),
          // ),
          prefixIconConstraints: const BoxConstraints(minWidth: 0),
          //suffixIconConstraints: const BoxConstraints(minWidth: 0),
          // suffix: IconButton(
          //   onPressed: () {},
          //   icon: SvgPicture.asset("images/send.svg"),
          // ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: buttons,
          ),
          prefixIcon: widget.isPassword && displayPwdBtn
              ? GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 0, right: 0),
                    // child: obscureText
                    //     ? SvgPicture.asset(
                    //         "assets/svg/password_hide.svg",
                    //       )
                    //     : SvgPicture.asset(
                    //         "assets/svg/password_show.svg",
                    //       ),
                  ),
                )
              : SizedBox(width: 18.w),
          // suffixIcon: displayClean
          //     ? GestureDetector(
          //         behavior: HitTestBehavior.opaque,
          //         onTap: clearPassword,
          //         child: Padding(
          //           padding: const EdgeInsets.only(right: 20, left: 10),
          //           child: SvgPicture.asset("images/widget/input_clear.svg"),
          //         ),
          //       )
          //     : SizedBox(width: 24.w),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}

// //密码输入框
//              ThemeWidget.getTextField(
//                 "請輸入密碼",
//                 onPressedHidePassword: controller.changePasswordState,
//                 onChanged: (text) {
//                   if (text.isNotEmpty) {
//                     controller.showPasswordButton = true;
//                     if (!controller.showClearPasswrod) {
//                       controller.showClearPasswrod = true;
//                     }
//                   } else {
//                     controller.showPasswordButton = false;
//                     if (controller.showClearPasswrod) {
//                       controller.showClearPasswrod = false; //文字是空的
//                     }
//                   }
//                 },
//                 onPressedClear: controller.clearPassword,
//                 showClear: controller.showClearPasswrod,
//                 showPassword: controller.isPassword,
//                 showPasswordButton: controller.showPasswordButton,
//                 isPassword: true,
//                 controller: controller.userPwdController,
//                 textInputAction: TextInputAction.go,
//               )

// /* 获取输入框 */
//   static Widget getTextField(String hint,
//       {TextInputType? keyboardType,
//       bool showPasswordButton = true,
//       Function()? onPressedClear,
//       Function()? onPressedHidePassword,
//       Function(String)? onChanged,
//       bool showClear = false,
//       bool isPassword = false,
//       bool showPassword = false,
//       TextInputAction? textInputAction,
//       TextEditingController? controller}) {
//     return TextField(
//       keyboardType: keyboardType,
//       onChanged: onChanged,
//       style: TextStyle(
//         fontSize: 16.sp,
//         color: ThemeColors.textContextColor,
//       ),
//       textAlign: TextAlign.center,
//       controller: controller,
//       obscureText: showPassword,
//       textInputAction: textInputAction,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: BorderRadius.all(
//             Radius.circular(30.r),
//           ),
//         ),
//         contentPadding: EdgeInsets.symmetric(vertical: 19.h),
//         prefixIconConstraints: const BoxConstraints(minWidth: 0),
//         suffixIconConstraints: const BoxConstraints(minWidth: 0),
//         prefixIcon: isPassword && showPasswordButton
//             ? GestureDetector(
//                 behavior: HitTestBehavior.opaque,
//                 onTap: onPressedHidePassword,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 20, right: 10),
//                   child: showPassword
//                       ? SvgPicture.asset(
//                           "assets/svg/password_hide.svg",
//                         )
//                       : SvgPicture.asset(
//                           "assets/svg/password_show.svg",
//                         ),
//                 ))
//             : const SizedBox(width: 20),
//         suffixIcon: showClear
//             ? GestureDetector(
//                 behavior: HitTestBehavior.opaque,
//                 onTap: onPressedClear,
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 20, left: 10),
//                   child: SvgPicture.asset("assets/svg/delete.svg"),
//                 ),
//               )
//             : const SizedBox(width: 20),
//         hintText: hint,
//         hintStyle: TextStyle(color: ThemeColors.textFormColor, fontSize: 16),
//         filled: true,
//         fillColor: ThemeColors.backgroundSecondaryColor,
//       ),
//     );
//   }
