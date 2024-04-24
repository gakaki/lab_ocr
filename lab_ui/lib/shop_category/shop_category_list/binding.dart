import 'package:get/get.dart';

import 'logic.dart';

class ShopCategoryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShopCategoryListLogic());
  }
}
