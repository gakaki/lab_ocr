import 'package:get/get.dart';
import 'package:get_demo/base/base_controller.dart';

class SplashPageLogic extends BaseController {
  RxDouble opacityLevel = 0.0.obs;
  @override
  void initData() {
    Future.delayed(const Duration(milliseconds: 200), () {
      opacityLevel.value = 1.0;
    });
  }

  @override
  void onHidden() {
  }
}
