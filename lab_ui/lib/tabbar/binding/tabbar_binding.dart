import 'package:get/get.dart';
import 'package:get_demo/shop_car/shop_car_list/logic.dart';
import 'package:get_demo/shop_category/shop_category_list/logic.dart';
import 'package:get_demo/shop_home/shop_home/logic.dart';
import 'package:get_demo/shop_message/shop_message_list/logic.dart';
import 'package:get_demo/shop_mine/shop_mine/logic.dart';
import '../../experimental_report/report_list/logic.dart';
import '../../user_login/logic.dart';
import '../controller/tabbar_controller.dart';

class TabbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabbarController>(() => TabbarController());
    Get.lazyPut<ShopHomeLogic>(() => ShopHomeLogic());
    Get.lazyPut<ShopCarListLogic>(() => ShopCarListLogic());

    Get.lazyPut<ShopMessageListLogic>(() => ShopMessageListLogic());
    Get.lazyPut<ShopMineLogic>(() => ShopMineLogic());
    Get.lazyPut<ShopCategoryListLogic>(() => ShopCategoryListLogic());

    Get.lazyPut<UserLoginLogic>(() => UserLoginLogic());
    Get.lazyPut<ReportListLogic>(() => ReportListLogic());
  }
}
