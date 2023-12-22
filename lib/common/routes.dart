//显示搜索界面
import 'package:almaren/delegate/search_delegate.dart';
import 'package:get/get.dart';

class Routes {
  static void showSearchPage() {
    showAlSearch(context: Get.context!, delegate: SearchBarDelegate());
  }
}
