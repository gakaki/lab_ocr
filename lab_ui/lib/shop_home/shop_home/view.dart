import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get_demo/base/base_common_view.dart';
import 'package:get_demo/tabbar/controller/tabbar_controller.dart';
import '../../config/change_widget.dart';
import '../../routes/router.dart';
import '../../util/event_bus.dart';
import '../../util/settlement_event.dart';
import '../../widget/swiper_widget/swiper_widget.dart';
import '../widgets/classification_widget.dart';
import '../widgets/good_item_widget.dart';
import '../widgets/simple_image.dart';
import '../widgets/vip_product_widget.dart';
import 'logic.dart';
import 'package:collection/collection.dart';

class ShopHomePage extends BaseCommonView<ShopHomeLogic> {
  ShopHomePage({super.key});
  final logic = Get.find<ShopHomeLogic>();

  @override
  // TODO: implement navTitle
  String? get navTitle => "首页";

  @override
  // TODO: implement leftWidth
  double? get leftWidth => 80.w;
  @override
  // TODO: implement leftButton
  Widget? get leftButton => changeNetBtn();

  /// 切换域名按钮
  Widget changeNetBtn() {
    return InkWell(
      onTap: () {
        showDialog(
            context: Get.context!,
            builder: (cxt) {
              return const ChangeWidget();
            });
      },
      child: Container(
        width: 80.w,
        height: 30.h,
        alignment: Alignment.center,
        child: Text(
          '切换环境',
          style: TextStyle(color: Colors.white, fontSize: 14.sp),
        ),
      ),
    );
  }

  @override
  Widget buildContent() {
    final logicTabbar = Get.find<TabbarController>();

    return GetBuilder<ShopHomeLogic>(
      builder: (_) => creatCommonView(
          logic,
          (con) => Container(
                color: const Color(0xFFF0F0F0),
                child: SingleChildScrollView(
                  child: StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    children: [
                      ...logic.homeState.tiles.mapIndexed((index, tile) {
                        return StaggeredGridTile.extent(
                          crossAxisCellCount: tile.crossAxisCount,
                          mainAxisExtent: index == 0
                              ? 620.h
                              : (tile.crossAxisCount == 2 ? 120.h : 200.h),
                          child: index == 0
                              ? _headerWidget(logicTabbar)
                              : (tile.crossAxisCount == 2
                                  ? SimpleImageWidget(
                                      imageUrl: logic.homeState.homeModel
                                          .columGoods[index - 1].imageUrl,
                                      type: 1,
                                    )
                                  : GoodItemWidget(
                                      index: index,
                                      model: logic.homeState.homeModel
                                          .columGoods[index - 1],
                                      onTap: () {
                                        /// 跳转商品详情
                                        Get.toNamed(AppRoutes.shopDetail);
                                      },
                                      addTap: () {
                                        /// 加入购物车
                                        logic.changeCartNumberMethond(logic
                                            .homeState
                                            .homeModel
                                            .columGoods[index - 1]);
                                      },
                                    )),
                        );
                      }),
                    ],
                  ),
                ),
              )),
    );
  }

  Widget _headerWidget(TabbarController logicTabbar) {
    return Column(
      children: [
        SwiperWidget(
          imagesList: logic.homeState.homeModel.banner,
          width: 1.sw,
          height: 160.h,
          alignment: Alignment.bottomRight,
          onTap: (int index) {},
          type: 1,
        ),
        ClassificationWidget(
          onTap: (int index) {
            logicTabbar.tabIndex.value = 1;
            logicTabbar.update();
          },
          imagesList: logic.homeState.homeModel.category,
        ),
        SimpleImageWidget(
          imageUrl: logic.homeState.homeModel.member[0].imageUrl,
        ),
        VipProductWidget(
            onTap: (int index) {
              Get.toNamed(AppRoutes.shopDetail);
            },
            imagesList: logic.homeState.homeModel.rowGoods),
      ],
    );
  }
}

class GridTile {
  const GridTile(this.crossAxisCount, this.mainAxisCount);
  final int crossAxisCount;
  final int mainAxisCount;
}
