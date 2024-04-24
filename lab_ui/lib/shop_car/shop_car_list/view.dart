import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_demo/base/base_common_view.dart';

import '../../config/colorConfig.dart';
import '../../shop_home/model/good_item_model.dart';
import '../../widget/app_net_image.dart';
import '../../widget/delay_button.dart';
import 'logic.dart';

class ShopCarListPage extends BaseCommonView<ShopCarListLogic> {
  ShopCarListPage({super.key});

  final logic = Get.find<ShopCarListLogic>();

  @override
  // TODO: implement leftButton
  Widget? get leftButton => _left();
  @override
  // TODO: implement leftWidth
  double? get leftWidth => 100;

  @override
  // TODO: implement navColor
  Color? get navColor => Colors.white;

  /// 左侧显示widget
  Widget _left() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 14.w),
      child: Text(
        '购物车',
        style: TextStyle(color: ColorConfig.mainColor),
      ),
    );
  }

  /// 购物车item
  Widget _cartItem(GoodItemModel model, int index) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(Get.context!).requestFocus(FocusNode());
        logic.textChangeCartCount();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.h),
        margin: EdgeInsets.only(bottom: 1.h),
        alignment: Alignment.center,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    logic.changeGoodIsSelectCart(model);
                  },
                  child: SizedBox(
                    width: 34.w,
                    height: 50.h,
                    child: Align(
                      child: _selectWidget(model.isSelectCart),
                    ),
                  ),
                ),
                _imageWidget(model),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _titleWidget(model),
                    SizedBox(
                      height: 8.h,
                    ),
                    _priceWidget(model)
                  ],
                ),
              ],
            ),
            _toolWidget(index),
          ],
        ),
      ),
    );
  }

  /// 选择按钮
  Widget _selectWidget(bool isSelectCart) {
    return Image(
        fit: BoxFit.fill,
        width: 18.w,
        height: 18.w,
        color: ColorConfig.mainColor,
        image: AssetImage(isSelectCart == true
            ? "assets/images/ic_audit_select.png"
            : "assets/images/ic_audit_normal.png"));
  }

  /// 商品图片
  Widget _imageWidget(GoodItemModel model) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h, top: 10.h, left: 14.w, right: 14.w),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.h),
      ),
      child: AppNetImage(
        imageUrl: model.imageUrl.isEmpty ? model.coverPicUrl : model.imageUrl,
        width: 46.w,
        height: 46.h,
      ),
    );
  }

  /// 商品名称
  Widget _titleWidget(GoodItemModel model) {
    TextStyle style = TextStyle(
        color: ColorConfig.firstTextColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600);
    return SizedBox(
      width: 110.w,
      child: Text(
        model.goodsName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style,
      ),
    );
  }

  /// 商品价钱
  Widget _priceWidget(GoodItemModel model) {
    TextStyle style = TextStyle(
        color: Colors.red, fontSize: 14.sp, fontWeight: FontWeight.w500);
    return Text(
      model.goodsPrice == 0
          ? '¥${model.price / 100}'
          : '¥${model.goodsPrice / 100}',
      style: style,
    );
  }

  /// 底部商品价钱
  Widget _bottomPriceWidget() {
    TextStyle style = TextStyle(
        color: Colors.red, fontSize: 14.sp, fontWeight: FontWeight.w500);
    return Text(
      logic.shopCarState.allPriceStr,
      style: style,
    );
  }

  /// 加减
  Widget _toolWidget(int index) {
    return Row(
      children: [
        InkWell(
          child: Container(
            width: 34.w,
            height: 40.h,
            margin: EdgeInsets.only(right: 6.w),
            alignment: Alignment.center,
            child: Text(
              '-',
              style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorConfig.firstTextColor),
            ),
          ),
          onTap: () {
            logic.changeCartCount(1, logic.shopCarState.list[index], index);
          },
        ),
        _inputWidget(index),
        InkWell(
          child: Container(
            width: 34.w,
            height: 40.h,
            margin: EdgeInsets.only(left: 6.w),
            alignment: Alignment.center,
            child: Text(
              '+',
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorConfig.mainColor),
            ),
          ),
          onTap: () {
            logic.changeCartCount(2, logic.shopCarState.list[index], index);
          },
        )
      ],
    );
  }

  /// 输入框
  Widget _inputWidget(int index) {
    return Container(
      width: 42.w,
      height: 24.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ColorConfig.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(12.h))),
      child: TextField(
        controller: logic.controllerList[index],
        textAlign: TextAlign.center,
        cursorColor: Colors.black45,
        style: TextStyle(fontSize: 10.sp, color: Colors.black),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          border: InputBorder.none,
          focusColor: Colors.orange,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorConfig.mainColor,
              width: 1.w,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12.h),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorConfig.backgroundColor,
              width: 1.w,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12.h),
            ),
          ),
        ),
        onChanged: (String number) {
          logic.shopCarState.editIndex = index;
        },
      ),
    );
  }

  /// 底部
  Widget _bottomWidget() {
    return Positioned(
        left: 0,
        bottom: 0,
        child: Container(
          width: 1.sw,
          height: 50.h,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _allSelctBtn(),
              Row(
                children: [
                  Text(
                    '合计:',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorConfig.firstTextColor),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  _bottomPriceWidget(),
                  SizedBox(
                    width: 20.w,
                  ),
                  _suanBtn(),
                ],
              ),
            ],
          ),
        ));
  }

  /// 结算按钮
  Widget _suanBtn() {
    return DelayButton(
      width: 80.w,
      height: 38.h,
      onTap: () {},
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: logic.shopCarState.allIsSelectCart == true
            ? ColorConfig.mainColor
            : Colors.black12,
        borderRadius: BorderRadius.circular(19.h),
      ),
      mainWidget: Text(
        '结算',
        style: TextStyle(fontSize: 13.sp, color: Colors.white),
      ),
    );
  }

  /// 全选按钮
  Widget _allSelctBtn() {
    return InkWell(
      onTap: () {
        logic.changeAllGoodIsSelectCart();
      },
      child: Row(
        children: [
          _selectWidget(logic.shopCarState.allIsSelectCart),
          SizedBox(
            width: 10.w,
          ),
          Text(
            '全选',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: ColorConfig.firstTextColor),
          )
        ],
      ),
    );
  }

  @override
  Widget buildContent() {
    return GetBuilder<ShopCarListLogic>(
      builder: (_) => creatCommonView(
          logic,
          (con) => Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(Get.context!).requestFocus(FocusNode());
                      logic.textChangeCartCount();
                    },
                    child: Container(
                      width: 1.sw,
                      height: 1.sh,
                      color: ColorConfig.backgroundColor,
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 60.h),
                        itemBuilder: (cxt, index) {
                          return _cartItem(
                              logic.shopCarState.list[index], index);
                        },
                        itemCount: logic.shopCarState.list.length,
                      ),
                    ),
                  ),
                  _bottomWidget()
                ],
              )),
    );
  }
}
