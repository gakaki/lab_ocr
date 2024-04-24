import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_demo/experimental_report/report_list/view.dart';
import 'package:get_demo/shop_car/shop_car_list/view.dart';
import 'package:get_demo/shop_category/shop_category_list/view.dart';
import 'package:get_demo/shop_home/shop_home/view.dart';
import 'package:get_demo/shop_message/shop_message_list/view.dart';
import 'package:get_demo/shop_mine/shop_mine/view.dart';
import '../../base/base_controller.dart';
import '../../shop_home/model/good_item_model.dart';
import '../../util/event_bus.dart';
import '../../util/settlement_event.dart';

/// tabar 控制器
///

class TabbarController extends BaseController {
  List<Widget> tabPageList = [
    // ShopHomePage(),
    // ShopCategoryListPage(),
    ExperimentalReportListPage(),
    // ShopMessageListPage(),
    // ShopCarListPage(),
    // ShopMinePage()
  ];
  var tabIndex = 0.obs;

  /// 购物车总数
  RxInt cartNumber = 0.obs;

  // /// 操作首页加入购物车
  // int homeCar = 0;
  //
  // /// 编辑购物车页面
  // int car = 0;

  List<GoodItemModel> goodList = [];

  @override
  void initData() {
    /// 操作首页
    GlobalEventBus().listen<AddGoodsEvent>((event) {
      cartNumber.value = 0;

      /// 处理数据
      bool isRepeatData = true;
      for (int i = 0; i < goodList.length; i++) {
        GoodItemModel model = goodList[i];
        if (event.model.goodsName == model.goodsName) {
          isRepeatData = false;
        }
        cartNumber.value += model.cartNumber;
      }
      if (isRepeatData == true) {
        goodList.add(event.model);
        cartNumber.value += event.model.cartNumber;
      }
    });

    /// 操作购物车
    GlobalEventBus().listen<ChangeGoodsEvent>((event) {
      cartNumber.value = 0;

      /// 处理数据
      bool isRepeatData = true;
      for (int i = 0; i < goodList.length; i++) {
        GoodItemModel model = goodList[i];
        if (event.model.goodsName == model.goodsName) {
          isRepeatData = false;
        }
        cartNumber.value += model.cartNumber;
      }
      if (isRepeatData == true) {
        goodList.add(event.model);
        cartNumber.value += event.model.cartNumber;
      }
    });
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}
