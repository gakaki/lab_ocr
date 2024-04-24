import 'package:get/get.dart';
import 'package:get_demo/base/base_list_controller.dart';
import 'package:get_demo/user_login/logic.dart';
import 'package:get_demo/widget/loading_widget.dart';
import '../../base/base_controller.dart';
import '../../net/http_mork.dart';
import '../../routes/router.dart';
import '../model/experimental_report_model.dart';
import 'states.dart';

class ReportListLogic extends BaseListController {
  final ExperimentalReportListState experimentalReportListState =
      ExperimentalReportListState();

  final userLoginLogic = Get.find<UserLoginLogic>();

  /// 跳转详情
  Future<void> pushLogin() async {
    Get.toNamed(AppRoutes.user_login);
  }

  @override
  void initData() {
    pushLogin();

    // pushDetail("65da30c6201b42da101b55ee")
    // if ( userLoginLogic.userLoginState.userLoginModel.access_token.isEmpty ){
    //   pushLogin();
    // }

    getnetworkdata(configNetWorkParmas());
  }

  @override
  void getnetworkdata(Map<String, dynamic> info) {
    super.getnetworkdata(info);

    /// 展示loading
    Loading.show();

    // String camera_id = "todo";
    // Http().client.getExperimentalReportListData(camera_id).then((value) {

    HttpMork.getMockDataWithPath(path: 'lib/mock/experimental_report_list.json')
        .then((value) {
      List<ExperimentalReportModel> list =
          ExperimentalReportModelList.fromJson(value['data']).list ?? [];
      experimentalReportListState.itemList = list;

      netState = NetState.dataSussessState;

      /// 结束loading
      Loading.dissmiss();

      //       List<ExperimentalReportModel> list = value['data'] ?? [];

      if (page == 1) {
        experimentalReportListState.itemList = list;

        /// 释放下拉控件
        refreshController.refreshCompleted();
      } else {
        experimentalReportListState.itemList += list;

        /// 释放上拉控件
        refreshController.loadComplete();
      }
      // / 判断是否可以上拉加载,一页20条,如果本页数据不足20条,说明下面没数据了.
      if (list.length < 20) {
        refreshController.loadNoData();
      }

      /// 判断数组为空,如果为空显示空视图
      if (experimentalReportListState.itemList.isEmpty) {
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
  void loadMore() {
    super.loadMore();
    page += 1;
    getnetworkdata(configNetWorkParmas());
  }

  @override
  void refreshData() {
    super.refresh();
    page = 1;
    getnetworkdata(configNetWorkParmas());
  }

  @override
  Map<String, dynamic> configNetWorkParmas() {
    return {
      'page': page,
      "ps": 2000,
      'q': '车讯原创',
      't': "0",
    };
  }

  Future<void> pushDetail(ExperimentalReportModel item) async {
    Get.toNamed(AppRoutes.experimentReportDetail, arguments: {'item': item});
  }

  Future<void> pushCreate() async {
    Get.toNamed(AppRoutes.experimentReportCreate);
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}
