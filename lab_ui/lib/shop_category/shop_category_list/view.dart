import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_demo/base/base_common_view.dart';
import 'package:get_demo/config/colorConfig.dart';
import 'package:get_demo/shop_category/model/big_category_model.dart';
import '../../routes/router.dart';
import '../../shop_home/model/good_item_model.dart';
import '../widgets/right_content_item.dart';
import 'logic.dart';

class ShopCategoryListPage extends BaseCommonView<ShopCategoryListLogic> {
  ShopCategoryListPage({super.key});

  final logic = Get.find<ShopCategoryListLogic>();

  @override
  // TODO: implement navTitle
  String? get navTitle => '商品分类';

  /// 右侧
  Widget _rightWidget() {
    return Stack(
      children: [
        Column(
          children: [_rightHeader(), _rightContent()],
        ),

        /// 黑色半透明背景
        Positioned(
            child: Obx(() => logic.categoryState.isShow.value == true
                ? InkWell(
                    onTap: () {
                      logic.changeStates();
                    },
                    child: Container(
                      width: 1.sw - 100.w,
                      height: 1.sh,
                      color: const Color.fromRGBO(1, 1, 1, 0.2),
                    ),
                  )
                : const SizedBox())),

        /// 下拉筛选框
        Obx(() => AnimatedPositioned(
              /// -300.h Container自适应高度了,所以给了一个相对来说大的值
              top: logic.categoryState.isShow.value == true ? 0 : -300.h,
              duration: const Duration(milliseconds: 100),
              child: Container(
                width: 1.sw - 100.w,
                color: Colors.white,
                padding: EdgeInsets.only(
                    left: 12.w, right: 12.w, bottom: 20.h, top: 3.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '全部分类',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp),
                        ),
                        _pullDownWidget('icon_topic_up@2x.png')
                      ],
                    ),
                    SizedBox(
                      width: 1.sw - 100.w,
                      child: Wrap(
                        spacing: 10.w,
                        runSpacing: 10.h,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: _categoryWidgets(),
                      ),
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }

  /// 创建小分类
  List<Widget> _categoryWidgets() {
    List<Widget> list = [];
    for (int i = 0; i < logic.categoryState.rightHeaderList.length; i++) {
      list.add(InkWell(
        onTap: () {
          logic.changeRightHeaderIndex(logic.categoryState.rightHeaderList[i]);
          logic.changeStates();
        },
        child: Container(
          width: logic.categoryState.rightHeaderList[i].name.length * 20.w,
          height: 26.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ColorConfig.backgroundColor,
            border: Border.all(
                color: logic.categoryState.rightHeaderList[i].isSelect
                    ? ColorConfig.mainColor
                    : Colors.grey,
                width: 1),
            borderRadius: BorderRadius.circular(4.h),
          ),
          child: Text(logic.categoryState.rightHeaderList[i].name,
              style: TextStyle(
                  fontSize: 13.sp,
                  color: logic.categoryState.rightHeaderList[i].isSelect
                      ? ColorConfig.mainColor
                      : Colors.black45)),
        ),
      ));
    }
    return list;
  }

  /// 下拉按钮
  Widget _pullDownWidget(String imageName) {
    return InkWell(
      onTap: () {
        logic.changeStates();
      },
      child: SizedBox(
        width: 30.w,
        height: 40.h,
        child: Align(
          child: Image(
              fit: BoxFit.fill,
              width: 18.w,
              height: 18.w,
              image: AssetImage("assets/images/$imageName")),
        ),
      ),
    );
  }

  /// 右侧头部
  Widget _rightHeader() {
    return Stack(
      children: [
        Container(
          width: 1.sw - 130.w,
          height: 40.h,
          color: Colors.white,
          margin: EdgeInsets.only(right: 30.w),
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 0),
              itemCount: logic.categoryState.rightHeaderList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (cxt, index) {
                return _rightHeaderItem(index);
              }),
        ),
        Positioned(
            right: 0, top: 0, child: _pullDownWidget('icon_topic_down@2x.png')),
      ],
    );
  }

  /// 右侧头部item
  Widget _rightHeaderItem(int index) {
    return GestureDetector(
      onTap: () {
        logic
            .changeRightHeaderIndex(logic.categoryState.rightHeaderList[index]);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 6.h, bottom: 6.h, left: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: ColorConfig.backgroundColor,
          border: Border.all(
              color: logic.categoryState.rightHeaderList[index].isSelect
                  ? ColorConfig.mainColor
                  : Colors.grey,
              width: 1),
          borderRadius: BorderRadius.circular(4.h),
        ),
        child: Text(
          logic.categoryState.rightHeaderList[index].name,
          style: TextStyle(
              fontSize: 13.sp,
              color: logic.categoryState.rightHeaderList[index].isSelect
                  ? ColorConfig.mainColor
                  : Colors.black45),
        ),
      ),
    );
  }

  /// 右侧内容
  Widget _rightContent() {
    return Expanded(
        child: SizedBox(
      width: 1.sw - 100.w,
      child: GridView.builder(
        itemCount: logic.categoryState.rightDataList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 6.w,
            childAspectRatio: 0.5),
        padding: EdgeInsets.only(top: 10.h, left: 8.w, right: 8.w),
        itemBuilder: (cxt, index) {
          return _rightContentItem(
              index, logic.categoryState.rightDataList[index]);
        },
      ),
    ));
  }

  /// 右侧内容item
  Widget _rightContentItem(int index, GoodItemModel model) {
    return RightContentItem(
      model: model,
      onTap: () {
        Get.toNamed(AppRoutes.shopDetail);
      },
      addTap: () {
        logic.changeCartNumberMethond(model);
      },
      index: index,
    );
  }

  /// 左侧列表
  Widget _leftWidget() {
    return SizedBox(
        width: 100.w,
        height: 1.sh,
        child: ListView.builder(
          itemBuilder: (cxt, index) {
            return _leftItem(logic.categoryState.leftDataList[index], index);
          },
          itemCount: logic.categoryState.leftDataList.length,
        ));
  }

  /// 左侧列表item
  Widget _leftItem(BigCategoryModel model, int index) {
    return GestureDetector(
      onTap: () {
        logic.changeIndex(index);
      },
      child: Stack(
        children: [
          Container(
            height: 44.h,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            alignment: Alignment.center,
            color: index == logic.categoryState.selectIndex
                ? Colors.white
                : ColorConfig.backgroundColor,
            child: Text(
              model.name,
              style: TextStyle(
                  color: index == logic.categoryState.selectIndex
                      ? const Color(0xFF000000)
                      : const Color(0xFF666666),
                  fontSize: 14.sp,
                  fontWeight: index == logic.categoryState.selectIndex
                      ? FontWeight.w600
                      : FontWeight.w400),
            ),
          ),
          Positioned(
              left: 0,
              top: 0,
              child: Visibility(
                visible:
                    index == logic.categoryState.selectIndex ? true : false,
                child: Container(
                  color: Colors.redAccent,
                  width: 4.w,
                  height: 44.h,
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget buildContent() {
    return GetBuilder<ShopCategoryListLogic>(
      builder: (_) => creatCommonView(
          logic,
          (con) => Row(
                children: [_leftWidget(), _rightWidget()],
              )),
    );
  }
}
