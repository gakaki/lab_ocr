import '../../base/abstract_network.dart';
import '../../base/base_controller.dart';


abstract class BaseCommonController extends BaseController
    with AbstractNetWork {

  @override
  void getnetworkdata(Map<String, dynamic> info) {
    // TODO: implement getnetworkdata
  }

  @override
  Map<String, dynamic> configNetWorkParmas() {
    // TODO: implement configNetWorkParmas
    throw UnimplementedError();
  }
}
