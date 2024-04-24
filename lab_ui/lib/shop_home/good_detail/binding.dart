import 'package:get/get.dart';

import 'logic.dart';

class GoodDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoodDetailLogic());
  }
}
