import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_demo/base/base_common_controller.dart';
import 'package:get_demo/shop_car/shop_car_list/shop_car_state.dart';
import 'package:get_demo/widget/remove_good_dialog.dart';
import '../../base/base_controller.dart';
import '../../shop_home/model/good_item_model.dart';
import '../../util/event_bus.dart';
import '../../util/settlement_event.dart';

class ShopCarListLogic extends BaseCommonController {
  List<TextEditingController> controllerList = [];
  ShopCarState shopCarState = ShopCarState();

  @override
  void initData() {
    netState = NetState.emptyDataState;
    update();

    /// 监听加入购物车通知
    getNotification();
  }

  void getNotification() {
    GlobalEventBus().listen<AddGoodsEvent>((event) {
      /// 清空数组
      controllerList.clear();

      /// 处理数据
      bool isRepeatData = true;
      for (int i = 0; i < shopCarState.list.length; i++) {
        GoodItemModel model = shopCarState.list[i];
        if (event.model.goodsName == model.goodsName) {
          isRepeatData = false;
        }
        TextEditingController controller = TextEditingController();

        /// TextEditingController 赋值
        controller.text = model.cartNumber.toString();
        controllerList.add(controller);
      }
      if (isRepeatData == true) {
        shopCarState.list.add(event.model);
        TextEditingController controller = TextEditingController();

        /// TextEditingController 赋值
        controller.text = event.model.cartNumber.toString();
        controllerList.add(controller);
      }
      netState = NetState.dataSussessState;
      computeCarPrice(true);
    });
  }

  /// 点击+或者-
  void changeCartCount(int type, GoodItemModel model, int index) {
    /// type:1 减 2:加
    if (type == 1) {
      if (model.cartNumber == 1) {
        removeGood(model, 2);
        return;
      }
      model.cartNumber--;
    } else {
      model.cartNumber++;
    }
    TextEditingController controller = controllerList[index];
    controller.text = '${model.cartNumber}';
    computeCarPrice(true);

    /// 发送通知更新列表
    postNotification(model);
  }

  /// 输入框改变
  void textChangeCartCount() {
    GoodItemModel model = shopCarState.list[shopCarState.editIndex];
    TextEditingController controller = controllerList[shopCarState.editIndex];
    if (int.parse(controller.text) == 0) {
      removeGood(model, 1);
      return;
    }
    model.cartNumber = int.parse(controller.text);
    computeCarPrice(true);

    /// 发送通知更新列表
    postNotification(model);
  }

  /// 商品按钮选中
  void changeGoodIsSelectCart(GoodItemModel model) {
    model.isSelectCart = !model.isSelectCart;
    computeCarPrice(true);
  }

  /// 全选按钮
  void changeAllGoodIsSelectCart() {
    shopCarState.allIsSelectCart = !shopCarState.allIsSelectCart;
    computeCarPrice(shopCarState.allIsSelectCart, isAllBtn: true);
  }

  /// 购物车商品改变 通知商品列表
  void postNotification(GoodItemModel model) {
    GlobalEventBus().fire(ChangeGoodsEvent(model));
  }

  /// 计算购物车全部金额
  void computeCarPrice(bool isSelect, {bool isAllBtn = false}) {
    if (isAllBtn == true) {
      for (int i = 0; i < shopCarState.list.length; i++) {
        GoodItemModel model = shopCarState.list[i];
        model.isSelectCart = isSelect;
      }
    }
    int allPrice = 0;
    if (isSelect == true) {
      for (int i = 0; i < shopCarState.list.length; i++) {
        GoodItemModel model = shopCarState.list[i];
        if (model.isSelectCart == true) {
          if (model.goodsPrice == 0) {
            allPrice += model.price * model.cartNumber;
          } else {
            allPrice += model.goodsPrice * model.cartNumber;
          }
        }
      }
      shopCarState.allPriceStr = '¥${allPrice / 100}';
      if (allPrice == 0) {
        shopCarState.allIsSelectCart = false;
      }
    } else {
      shopCarState.allPriceStr = '0.00';
    }
    update();
  }

  /// 删除商品
  void removeGood(GoodItemModel model, int type) {
    /// type:1输入为0的情况,2:点击+或者-
    showDialog(
        context: Get.context!,
        builder: (cxt) {
          return RemoveGoodDialog(
            confirmFunction: () {
              shopCarState.list.remove(model);
              computeCarPrice(true);

              /// 发送通知更新列表
              model.cartNumber = 0;
              postNotification(model);
            },
            cancelFunction: () {
              if (type == 1) {
                TextEditingController controller =
                    controllerList[shopCarState.editIndex];
                controller.text = '${model.cartNumber}';
                update();
              }
            },
          );
        });
  }

  @override
  void onHidden() {}
}
