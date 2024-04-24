import 'package:get/get.dart';

import '../experimental_report/report_list/logic.dart';
import 'logic.dart';

class UserLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserLoginLogic>(() => UserLoginLogic());
    Get.lazyPut<ReportListLogic>(() => ReportListLogic());
  }
}
