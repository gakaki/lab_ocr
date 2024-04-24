import 'package:get_demo/base/base_common_controller.dart';
import 'package:get_demo/shop_category/model/big_category_model.dart';
import 'package:get_demo/shop_category/shop_category_list/category_state.dart';
import 'package:get_demo/shop_home/model/good_item_model.dart';
import '../../base/base_controller.dart';
import '../../net/http_mork.dart';
import '../../util/event_bus.dart';
import '../../util/settlement_event.dart';
import '../model/small_category_model.dart';

class ShopCategoryListLogic extends BaseCommonController {
  CategoryState categoryState = CategoryState();

  @override
  void initData() {
    getnetworkdata(configNetWorkParmas());
    getCartNotification();
  }

  @override
  Future<void> getnetworkdata(Map<String, dynamic> info) async {
    super.getnetworkdata(info);

    try {
      Map<String, dynamic> result = await HttpMork.getMockDataWithPath(
          path: 'lib/mock/category_left_data.json');
      categoryState.leftDataList =
          BigCategoryModelList.fromJson(result['data']).list;
      categoryState.rightHeaderList = categoryState.leftDataList[0].children;
      getRightData();
    } catch (e) {
      netState = NetState.errorshowRelesh;
      update();
    } finally {}
  }

  Future<void> getRightData() async {
    try {
      Map<String, dynamic> result = await HttpMork.getMockDataWithPath(
          path: 'lib/mock/category_right_1_data.json');
      categoryState.rightDataList =
          GoodItemModelList.fromJson(result['data']['records']).list;
      netState = NetState.dataSussessState;
      update();
    } catch (e) {
      netState = NetState.errorshowRelesh;
      update();
    } finally {}
  }

  /// 点击左侧选择
  void changeIndex(int index) {
    categoryState.selectIndex = index;
    if (index < categoryState.leftDataList.length) {
      categoryState.rightHeaderList =
          categoryState.leftDataList[index].children;
    } else {
      categoryState.rightHeaderList = [];
    }
    update();
  }

  /// 点击右侧头部选择
  void changeRightHeaderIndex(SmallCategoryModel smallCategoryModel) {
    for (int i = 0; i < categoryState.rightHeaderList.length; i++) {
      SmallCategoryModel model = categoryState.rightHeaderList[i];
      model.isSelect = false;
    }
    smallCategoryModel.isSelect = true;
    update();
  }

  /// 点击下拉筛选框
  void changeStates() {
    categoryState.isShow.value = !categoryState.isShow.value;
  }

  /// 加入购物车
  void changeCartNumberMethond(GoodItemModel model) {
    model.cartNumber++;
    model.isSelectCart = true;
    update();
    GlobalEventBus().fire(AddGoodsEvent(model));
  }

  void getCartNotification() {
    GlobalEventBus().listen<ChangeGoodsEvent>((event) {
      /// 处理数据
      for (int i = 0; i < categoryState.rightDataList.length; i++) {
        GoodItemModel model = categoryState.rightDataList[i];
        if (event.model.goodsName == model.goodsName) {
          model.cartNumber = event.model.cartNumber;
        }
      }
      netState = NetState.dataSussessState;
      update();
    });
  }

  @override
  Map<String, dynamic> configNetWorkParmas() {
    return {'': ''};
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}
