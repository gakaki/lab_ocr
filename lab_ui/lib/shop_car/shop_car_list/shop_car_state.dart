import '../../shop_home/model/good_item_model.dart';

class ShopCarState {
  List<GoodItemModel> list = [];

  /// 编辑的商品index
  int editIndex = 0;

  /// 全选按钮状态
  bool allIsSelectCart = true;

  /// 总价钱
  String allPriceStr = '';

  ShopCarState() {
    list = [];
    editIndex = 0;
    allIsSelectCart = true;
    allPriceStr = '';
  }
}
