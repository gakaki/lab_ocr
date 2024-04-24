import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_demo/shop_home/model/good_item_model.dart';

import '../../config/colorConfig.dart';
import '../../widget/app_net_image.dart';
import '../../widget/delay_button.dart';
import 'cart_number_widget.dart';

class GoodItemWidget extends StatelessWidget {
  final GoodItemModel model;
  final Function onTap;
  final Function addTap;
  final int index;
  const GoodItemWidget(
      {super.key,
      required this.model,
      required this.onTap,
      required this.addTap,
      required this.index});

  @override
  Widget build(BuildContext context) {
    /// 商品名称
    Widget titleWidget() {
      TextStyle style = TextStyle(
          color: ColorConfig.firstTextColor, fontSize: 14.sp, fontWeight: FontWeight.w600);
      return Container(
        margin: EdgeInsets.only(left: 10.w),
        width: 180.w,
        child: Text(
          model.goodsName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: style,
        ),
      );
    }

    /// 商品图片
    Widget imageWidget() {
      return Container(
        margin: EdgeInsets.all(10.w),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.h),
        ),
        child: AppNetImage(
          imageUrl: model.imageUrl,
          width: (1.sw - 40.w) / 2,
          height: 120.h,
        ),
      );
    }

    /// 商品价钱
    Widget priceWidget() {
      TextStyle style = TextStyle(color: Colors.red, fontSize: 14.sp, fontWeight: FontWeight.w500);
      return Text(
        '¥${model.goodsPrice / 100}',
        style: style,
      );
    }

    /// 加号按钮
    Widget addBtnWidget() {
      return DelayButton(
        width: 22.w,
        height: 22.w,
        clickSpaceTime: 1,
        alignment: Alignment.center,
        onTap: () {
          addTap();
        },
        mainWidget: Text('+',
            style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.w600)),
        decoration: BoxDecoration(
          color: ColorConfig.mainColor,
          borderRadius: BorderRadius.circular(11.h),
        ),
      );
    }

    /// 加入购物车数量
    Widget addCartNumber() {
      return model.cartNumber > 0
          ? Positioned(
              right: 2.w,
              top: 155.h,
              child: CartNumberWidget(
                number: model.cartNumber,
              ),
            )
          : const SizedBox();
    }

    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageWidget(),
                titleWidget(),
                SizedBox(
                  height: 6.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 14.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [priceWidget(), addBtnWidget()],
                  ),
                )
              ],
            ),
          ),
          addCartNumber()
        ],
      ),
    );
  }
}
