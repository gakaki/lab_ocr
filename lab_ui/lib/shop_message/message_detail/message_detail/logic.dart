import 'package:get/get.dart';
import 'package:get_demo/base/base_common_controller.dart';
import 'package:get_demo/shop_message/message_detail/message_detail/message_detail_state.dart';

import '../../../base/base_controller.dart';
import '../../../config/stringConfig.dart';
import '../../../net/http.dart';
import '../../../net/result.dart';
import '../../../widget/loading_widget.dart';
import '../../model/info_work_model.dart';

class MessageDetailLogic extends BaseCommonController {
  MessageDetailState messageDetailState = MessageDetailState();

  @override
  void initData() {
    getnetworkdata(configNetWorkParmas());
  }

  @override
  void getnetworkdata(Map<String, dynamic> info) {
    super.getnetworkdata(info);

    /// 展示loading
    Loading.show();

    Http().client.getInfoDetailData(info['entityId']).then((value) {
      Loading.dissmiss();
      netState = NetState.dataSussessState;
      messageDetailState.infoWorkModel = value.data!;

      update();
    }).catchError((onError) {
      /// 结束loading
      Loading.dissmiss();
      print(onError);
      netState = NetState.errorshowRelesh;
      update();
    });
  }

  @override
  Map<String, dynamic> configNetWorkParmas() {
    return {"entityId": Get.arguments['entityId']};
  }

  /// 喜欢事件
  void likeMethond(InfoWorkModel model) {
    Http().client.likeThumbsUpOrDown({
      'contentId': model.entityId,
      'contentType': '5',
      'token': StringConfig.token
    }).then((value) {
      Result model = value;
    }).catchError((onError) {});
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}
