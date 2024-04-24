import 'package:get/get.dart';

import 'logic.dart';

class ShopHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShopHomeLogic());
  }
}
