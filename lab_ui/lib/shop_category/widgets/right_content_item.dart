import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_demo/shop_home/model/good_item_model.dart';
import '../../config/colorConfig.dart';
import '../../shop_home/widgets/cart_number_widget.dart';
import '../../widget/app_net_image.dart';
import '../../widget/delay_button.dart';

class RightContentItem extends StatelessWidget {
  final GoodItemModel model;
  final Function onTap;
  final Function addTap;
  final int index;
  const RightContentItem(
      {super.key,
      required this.model,
      required this.onTap,
      required this.addTap,
      required this.index});

  /// 商品名称
  Widget _titleWidget() {
    TextStyle style =
        TextStyle(color: ColorConfig.firstTextColor, fontSize: 14.sp, fontWeight: FontWeight.w600);
    return SizedBox(
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
  Widget _imageWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.h),
      ),
      child: AppNetImage(
        imageUrl: model.coverPicUrl,
        width: (1.sw - 40.w) / 2,
        height: 120.h,
      ),
    );
  }

  /// 月销量
  Widget _salesVolumeWidget() {
    TextStyle style = TextStyle(color: Colors.grey, fontSize: 14.sp, fontWeight: FontWeight.w500);
    return Text(
      '月销量: ${model.monthSales}',
      style: style,
    );
  }

  /// 配送减免
  Widget _distributionWidget() {
    TextStyle style =
        TextStyle(color: const Color(0xFFE02020), fontSize: 14.sp, fontWeight: FontWeight.w500);
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAEAEF),
        borderRadius: BorderRadius.circular(4.h),
      ),
      padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 3.h, bottom: 3.h),
      child: Text(
        '配送减免',
        style: style,
      ),
    );
  }

  /// 商品价钱
  Widget _priceWidget() {
    TextStyle style = TextStyle(color: Colors.red, fontSize: 14.sp, fontWeight: FontWeight.w500);
    return Text(
      '¥${model.price / 100}',
      style: style,
    );
  }

  /// 加号按钮
  Widget _addBtnWidget() {
    return DelayButton(
      width: 22.w,
      height: 22.w,
      alignment: Alignment.center,
      onTap: () {
        addTap();
      },
      mainWidget: Text('+',
          style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.w600)),
      decoration: BoxDecoration(
        color: ColorConfig.mainColor,
        borderRadius: BorderRadius.circular(13.h),
      ),
    );
  }

  /// 加入购物车数量
  Widget addCartNumber() {
    return model.cartNumber > 0
        ? Positioned(
            right: 6.w,
            bottom: 28.h,
            child: CartNumberWidget(
              number: model.cartNumber,
            ),
          )
        : const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imageWidget(),
              _titleWidget(),
              SizedBox(
                height: 8.h,
              ),
              _salesVolumeWidget(),
              SizedBox(
                height: 8.h,
              ),
              _distributionWidget(),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_priceWidget(), _addBtnWidget()],
                ),
              )
            ],
          ),
          addCartNumber()
        ],
      ),
    );
  }
}
