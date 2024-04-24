import 'package:get_demo/base/base_common_controller.dart';
import '../../base/base_controller.dart';

class ShopMineLogic extends BaseCommonController {
  @override
  void initData() {
    netState = NetState.dataSussessState;
    update();
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}
