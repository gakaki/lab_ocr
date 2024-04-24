import 'package:get/get.dart';

import 'logic.dart';

class MessageDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageDetailLogic());
  }
}
