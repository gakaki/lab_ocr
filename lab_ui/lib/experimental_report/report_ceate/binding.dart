import 'package:get/get.dart';

import 'logic.dart';

class ExperimentReportCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExperimentReportCreateLogic());
  }
}
