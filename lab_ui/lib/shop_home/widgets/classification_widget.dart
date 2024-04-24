import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_demo/config/colorConfig.dart';
import 'package:get_demo/widget/app_net_image.dart';

import '../model/good_item_model.dart';

/// FileName: classification_widget
///
/// Description: 商品分类组件
/// Author: 木子雨廷
/// Date: 2023/07/04
///
class ClassificationWidget extends StatelessWidget {
  /// 事件
  Function onTap;

  /// 图片数组
  final List<GoodItemModel> imagesList;

  ClassificationWidget(
      {super.key, required this.onTap, required this.imagesList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 1.sw,
      height: 180.h,
      child: GridView.builder(
        itemCount: imagesList.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 14.h,
            crossAxisSpacing: 15.w,
            childAspectRatio: 0.84),
        padding: EdgeInsets.all(10.w),
        itemBuilder: getItem,
      ),
    );
  }

  Widget getItem(context, index) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.h),
            ),
            child: AppNetImage(
              imageUrl: imagesList[index].imageUrl,
              width: (1.sw - 160.w) / 5,
              height: 42.h,
            ),
          ),
          Text(
            imagesList[index].content,
            style: TextStyle(
                fontSize: 14.sp,
                color: ColorConfig.secondTextColor,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
