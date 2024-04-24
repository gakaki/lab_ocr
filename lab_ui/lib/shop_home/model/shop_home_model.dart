import 'package:json_annotation/json_annotation.dart';

import 'good_item_model.dart';
part 'shop_home_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ShopHomeModel {
  /// 轮播
  List<GoodItemModel> banner;

  /// 分类
  List<GoodItemModel> category;

  /// vip大图
  List<GoodItemModel> member;

  /// 蔬菜大图
  List<GoodItemModel> vegetable;

  /// 肉大图
  List<GoodItemModel> meat;

  /// 热卖菜
  List<GoodItemModel> rowGoods;

  /// 全部菜
  List<GoodItemModel> columGoods;

  ShopHomeModel(
      {this.banner = const [],
      this.category = const [],
      this.columGoods = const [],
      this.meat = const [],
      this.member = const [],
      this.rowGoods = const [],
      this.vegetable = const []});

  factory ShopHomeModel.fromJson(Map<String, dynamic> json) => _$ShopHomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopHomeModelToJson(this);
}
