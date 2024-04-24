import 'package:get/get.dart';
import 'logic.dart';

class ReportListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportListLogic());
  }
}
