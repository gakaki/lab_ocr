import 'package:get_demo/base/base_common_controller.dart';
import 'package:get_demo/net/http_mork.dart';
import 'package:get_demo/shop_home/model/good_item_model.dart';
import 'package:get_demo/shop_home/model/shop_home_model.dart';
import 'package:get_demo/shop_home/shop_home/view.dart';
import '../../base/base_controller.dart';
import '../../util/event_bus.dart';
import '../../util/settlement_event.dart';
import 'home_state.dart';

class ShopHomeLogic extends BaseCommonController {
  final HomeState homeState = HomeState();


  @override
  void initData() {
    getnetworkdata(configNetWorkParmas());

    /// 接受购物车商品数量改变
    getCartNotification();
  }

  /// 请求数据,在这里使用mock数据模拟的网络请求,getnetworkdata父类定义好的,直接重写即可
  @override
  Future<void> getnetworkdata(Map<String, dynamic> info) async {
    super.getnetworkdata(info);

    try {
      Map<String, dynamic> result =
          await HttpMork.getMockDataWithPath(path: 'lib/mock/home_data.json');
      homeState.homeModel = ShopHomeModel.fromJson(result['data']);
      homeState.tiles.add(
        const GridTile(2, 1),
      );
      homeState.tiles.add(
        const GridTile(2, 1),
      );
      for (int i = 0; i < homeState.homeModel.columGoods.length; i++) {
        homeState.tiles.add(const GridTile(1, 1));
      }
      homeState.tiles.insert(12, const GridTile(2, 1));
      List<GoodItemModel> dataList = homeState.homeModel.columGoods;
      dataList.insert(0, homeState.homeModel.vegetable[0]);
      dataList.insert(11, homeState.homeModel.meat[0]);
      homeState.homeModel.columGoods = dataList;
      netState = NetState.dataSussessState;
      update();
    } catch (e) {
      netState = NetState.errorshowRelesh;
      update();
    } finally {}
  }

  void getCartNotification() {
    GlobalEventBus().listen<ChangeGoodsEvent>((event) {
      /// 处理数据
      for (int i = 0; i <homeState.homeModel.columGoods.length; i++) {
        GoodItemModel model =  homeState.homeModel.columGoods[i];
        if (event.model.goodsName == model.goodsName) {
          model.cartNumber = event.model.cartNumber;
        }
      }
      netState = NetState.dataSussessState;
      update();
    });
  }

  /// 上传接口的参数
  @override
  Map<String, dynamic> configNetWorkParmas() {
    return {'': ''};
  }

  /// 更新加入购物车商品数量
  void changeCartNumberMethond(GoodItemModel model) {
    model.cartNumber++;
    model.isSelectCart = true;
    update();
    GlobalEventBus().fire(AddGoodsEvent(model));
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}
