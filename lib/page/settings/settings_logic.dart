import 'package:almaren/mixin/appbar_mixin.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsLogic extends GetxController
    with AppBarMixin, StateMixin, GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    super.onInit();
    onInitAnimation(this);
    change(GetStatus.success(null));
  }

  /// 注销登录的账号
  void logout() async {
    var shared = await SharedPreferences.getInstance();
    shared.clear(); //9r6qmws2k
    // bool? result = await Dialogs.showAsk(
    //     "Log Out", "Do you want to log out of the current account?");
    // if (result == true) {
    //   var shared = await SharedPreferences.getInstance();
    //   shared.clear();

    //   Get.offAll(() => SplashPage(), transition: Transition.downToUp);
    // }
  }
}
