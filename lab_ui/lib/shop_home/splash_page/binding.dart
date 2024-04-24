import 'package:get/get.dart';

import 'logic.dart';

class SplashPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashPageLogic());
  }
}
