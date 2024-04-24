import 'package:get/get.dart';

import 'logic.dart';

class ShopMineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShopMineLogic());
  }
}
