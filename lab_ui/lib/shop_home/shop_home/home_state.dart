import 'package:get_demo/shop_home/shop_home/view.dart';

import '../model/shop_home_model.dart';

class HomeState {
  ShopHomeModel homeModel = ShopHomeModel();
  List<GridTile> tiles = [];

  HomeState() {
    tiles = [];
    homeModel = ShopHomeModel();
  }
}
