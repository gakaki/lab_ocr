import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../shop_home/model/good_item_model.dart';
import '../model/big_category_model.dart';
import '../model/small_category_model.dart';

class CategoryState {
  /// 左侧选中
  int selectIndex = 0;

  /// 左侧数据
  List<BigCategoryModel> leftDataList = [];

  /// 右侧商品数据
  List<GoodItemModel> rightDataList = [];

  /// 右侧分类数据
  List<SmallCategoryModel> rightHeaderList = [];

  /// 是否展示下拉筛选框
  RxBool isShow = false.obs;

  CategoryState() {
    selectIndex = 0;
    leftDataList = [];
    rightDataList = [];
    rightHeaderList = [];
    isShow = false.obs;
  }
}
