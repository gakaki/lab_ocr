import 'package:get_demo/shop_home/model/good_item_model.dart';

/// 添加商品到购物车
class AddGoodsEvent {
  GoodItemModel model;
  AddGoodsEvent(this.model);
}

/// 购物车商品改变通知列表
class ChangeGoodsEvent {
  GoodItemModel model;
  ChangeGoodsEvent(this.model);
}
