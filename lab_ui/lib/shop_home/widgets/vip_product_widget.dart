import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_demo/config/colorConfig.dart';

import '../../widget/app_net_image.dart';
import '../model/good_item_model.dart';

class VipProductWidget extends StatelessWidget {
  /// 事件
  Function onTap;

  /// 图片数组
  final List<GoodItemModel> imagesList;

  VipProductWidget({super.key, required this.onTap, required this.imagesList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 150.h,
      color: Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 0),
          itemCount: imagesList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: _getItem),
    );
  }

  Widget _getItem(cxt, index) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_imageWidget(index), _titleWidget(index), _priceWidget(index)],
      ),
    );
  }

  /// 商品名称
  Widget _titleWidget(int index) {
    TextStyle style =
        TextStyle(color: ColorConfig.firstTextColor, fontSize: 14.sp, fontWeight: FontWeight.w600);
    return Container(
      width: 80.w,
      margin: EdgeInsets.symmetric(horizontal: 18.w),
      padding: EdgeInsets.only(bottom: 3.h),
      child: Text(
        imagesList[index].goodsName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style,
      ),
    );
  }

  /// 商品图片
  Widget _imageWidget(int index) {
    return Container(
      margin: EdgeInsets.all(10.w),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.h),
      ),
      child: AppNetImage(
        imageUrl: imagesList[index].imageUrl,
        width: 80.w,
        height: 80.h,
      ),
    );
  }

  /// 商品价钱
  Widget _priceWidget(int index) {
    TextStyle style = TextStyle(color: Colors.red, fontSize: 14.sp, fontWeight: FontWeight.w500);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Text(
        '¥${imagesList[index].goodsPrice}',
        style: style,
      ),
    );
  }
}
