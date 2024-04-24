import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_demo/base/base_list_controller.dart';
import 'package:get_demo/widget/loading_widget.dart';
import '../../base/base_controller.dart';
import '../../net/http.dart';
import '../../routes/router.dart';
import '../model/info_model.dart';
import 'message_states.dart';

/// 首页控制器
///

class ShopMessageListLogic extends BaseListController {
  /// 实例化状态类，以便操作所有的变量
  final MessageState messageState = MessageState();

  @override
  void initData() {
    getnetworkdata(configNetWorkParmas());
  }

  @override
  void getnetworkdata(Map<String, dynamic> info) {
    super.getnetworkdata(info);

    /// 展示loading
    Loading.show();

    Http()
        .client
        .getInfoListData(info['page'], info['ps'], info['q'], info['t'])
        .then((value) {
      netState = NetState.dataSussessState;

      /// 结束loading
      Loading.dissmiss();
      List<InfoModel> list = value.data?.works ?? [];
      if (page == 1) {
        messageState.infoList = list;

        /// 释放下拉控件
        refreshController.refreshCompleted();
      } else {
        messageState.infoList += list;

        /// 释放上拉控件
        refreshController.loadComplete();
      }

      /// 判断数组为空,如果为空显示空视图
      if (messageState.infoList.isEmpty) {
        netState = NetState.emptyDataState;
      }

      /// 判断是否可以上拉加载,一页20条,如果本页数据不足20条,说明下面没数据了.
      if (list.length < 20) {
        refreshController.loadNoData();
      }

      update();
      // Error: type 'AppException' is not a subtype of type 'DioException'
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
      "ps": 20,
      'q': '车讯原创',
      't': "0",
    };
  }

  /// 跳转详情
  Future<void> pushDetail(int id) async {
    Get.toNamed(AppRoutes.infoDetail, arguments: {'entityId': id});
  }

  /// 点赞
  void zanMethond(int index) {
    /// 刷新会消失,实现的假的功能.
    InfoModel infoModel = messageState.infoList[index];
    infoModel.isThumbs = 1;
    messageState.infoList.removeAt(index);
    messageState.infoList.insert(index, infoModel);
    update();
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}
