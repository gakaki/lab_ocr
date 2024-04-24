import 'package:json_annotation/json_annotation.dart';
part 'good_item_model.g.dart';

class GoodItemModelList {
  List<GoodItemModel> list;
  GoodItemModelList(this.list);
  factory GoodItemModelList.fromJson(List<dynamic> list) {
    return GoodItemModelList(
      list.map((item) => GoodItemModel.fromJson(item)).toList(),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class GoodItemModel {
  String imageUrl;
  String content;
  int goodsPrice;
  String goodsName;
  int monthSales;

  /// 加入购物车数量
  int cartNumber;

  /// 购物车商品是否选中
  bool isSelectCart;
  String coverPicUrl;
  int price;
  String spec;
  double weight;
  String description;
  List<String> picUrls;
  GoodItemModel(
      {this.imageUrl = '',
      this.content = '',
      this.goodsPrice = 0,
      this.goodsName = '',
      this.monthSales = 0,
      this.cartNumber = 0,
      this.coverPicUrl = '',
      this.price = 0,
      this.spec = '',
      this.weight = 0,
      this.description = '',
      this.picUrls = const [],
      this.isSelectCart = false});

  factory GoodItemModel.fromJson(Map<String, dynamic> json) => _$GoodItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoodItemModelToJson(this);
}
