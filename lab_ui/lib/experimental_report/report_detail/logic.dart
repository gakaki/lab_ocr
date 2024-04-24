import 'package:get/get.dart';
import 'package:get_demo/base/base_common_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../base/base_controller.dart';
import '../../../widget/loading_widget.dart';
import '../../net/http_mork.dart';
import '../model/experimental_report_detail_model.dart';
import 'experiment_report_detail_state.dart';

class ExperimentReportDetailLogic extends BaseCommonController {
  ExperimentReportDetailState experimentReportDetailState =
      ExperimentReportDetailState();

  /// 刷新控制器
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initData() {
    getnetworkdata(configNetWorkParmas());
  }

  @override
  configNetWorkParmas() {
    return {"item": Get.arguments['item']};
  }

  int page = 1;

  @override
  void getnetworkdata(Map<String, dynamic> info) {
    super.getnetworkdata(info);

    /// 展示loading
    Loading.show();
    Loading.dissmiss();
    netState = NetState.dataSussessState;

    var item = Get.arguments['item']; // as ExperimentalReportModel

    HttpMork.getMockDataWithPath(
            path: 'lib/mock/experimental_report_detail'
                '.json')
        .then((value) {
      experimentReportDetailState.experimentalReportDetailModel =
          ExperimentalReportDetailModel.fromJson(value['data']);

      netState = NetState.dataSussessState;

      /// 结束loading
      Loading.dissmiss();

      if (page == 1) {
        /// 释放下拉控件
        refreshController.refreshCompleted();
      } else {
        /// 释放上拉控件
        refreshController.loadComplete();
      }
      refreshController.loadNoData();

      if (experimentReportDetailState
          .experimentalReportDetailModel.rows.isEmpty) {
        netState = NetState.emptyDataState;
      }
      update();
    }).catchError((onError) {
      /// 结束loading
      Loading.dissmiss();
      netState = NetState.errorshowRelesh;
      if (page == 1) {
        refreshController.refreshFailed();
      } else {
        refreshController.loadFailed();
      }
      update();
    });
  }

  @override
  void onHidden() {}
}
