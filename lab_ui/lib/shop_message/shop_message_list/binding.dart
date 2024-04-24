import 'package:get/get.dart';

import 'logic.dart';

class ShopMessageListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShopMessageListLogic());
  }
}
