import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_demo/shop_home/model/good_item_model.dart';
import '../../base/base_common_view.dart';
import '../../config/colorConfig.dart';
import '../../widget/app_net_image.dart';
import '../../widget/delay_button.dart';
import '../../widget/swiper_widget/swiper_widget.dart';
import '../widgets/cart_number_widget.dart';
import 'logic.dart';

class GoodDetailPage extends BaseCommonView<GoodDetailLogic> {
  GoodDetailPage({super.key});

  @override
  // TODO: implement isHiddenNav
  bool? get isHiddenNav => true;
  @override
  // TODO: implement contentColor
  Color? get contentColor => ColorConfig.backgroundColor;
  final logic = Get.find<GoodDetailLogic>();

  /// 轮播图
  Widget _banner() {
    List<GoodItemModel> list = [];
    for (int i = 0; i < logic.goodDetailState.model.picUrls.length; i++) {
      list.add(GoodItemModel(imageUrl: logic.goodDetailState.model.picUrls[i]));
    }
    return SwiperWidget(
      imagesList: list,
      width: 1.sw,
      height: 300.h,
      onTap: (int index) {},
      type: 2,
    );
  }

  /// 商品价钱
  Widget _priceWidget() {
    TextStyle style = TextStyle(
        color: Colors.red, fontSize: 14.sp, fontWeight: FontWeight.w500);
    return Text(
      '¥${logic.goodDetailState.model.price / 100}',
      style: style,
    );
  }

  /// 月销量
  Widget _salesVolumeWidget() {
    TextStyle style = TextStyle(
        color: Colors.grey, fontSize: 12.sp, fontWeight: FontWeight.w400);
    return Text(
      '月销量: ${logic.goodDetailState.model.monthSales}',
      style: style,
    );
  }

  /// 重量
  Widget _weightWidget() {
    TextStyle style = TextStyle(
        color: ColorConfig.secondTextColor,
        fontSize: 9.sp,
        fontWeight: FontWeight.w400);
    return Container(
        padding: EdgeInsets.all(4.w),
        margin: EdgeInsets.only(left: 10.h, right: 10.h),
        decoration: BoxDecoration(
          color: ColorConfig.backgroundColor,
          borderRadius: BorderRadius.circular(2.h),
        ),
        child: Text(
          '重量:${logic.goodDetailState.model.weight}kg',
          style: style,
        ));
  }

  /// 配送业务
  Widget _songWidget() {
    TextStyle style = TextStyle(
        color: Colors.red, fontSize: 12.sp, fontWeight: FontWeight.w400);
    return Text(
      '该商品支持配送业务',
      style: style,
    );
  }

  /// 商品介绍
  Widget _introduce() {
    TextStyle style = TextStyle(
        color: ColorConfig.firstTextColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600);
    return Container(
      margin: EdgeInsets.all(8.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.h),
      ),
      width: 1.sw - 20.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            logic.goodDetailState.model.goodsName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: style,
          ),
          Container(
            padding: EdgeInsets.all(12.w),
            margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
            decoration: BoxDecoration(
              color: const Color(0xFFFAEAEF),
              borderRadius: BorderRadius.circular(4.h),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_priceWidget(), _salesVolumeWidget()],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_weightWidget(), _songWidget()],
            ),
          )
        ],
      ),
    );
  }

  /// 配送减免
  Widget _distributionWidget() {
    TextStyle style = TextStyle(
        color: const Color(0xFFE02020),
        fontSize: 12.sp,
        fontWeight: FontWeight.w500);
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAEAEF),
        borderRadius: BorderRadius.circular(4.h),
      ),
      padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 4.h, bottom: 4.h),
      child: Text(
        '配送减免',
        style: style,
      ),
    );
  }

  /// 配送减免
  Widget _distributionDesWidget() {
    TextStyle style = TextStyle(
        color: const Color(0xFFE02020),
        fontSize: 12.sp,
        fontWeight: FontWeight.w400);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.h),
      ),
      padding: EdgeInsets.only(left: 6.w, top: 4.h, bottom: 4.h),
      child: Text(
        '全场满38元免配送费(满38元免配送费)',
        style: style,
      ),
    );
  }

  /// 商品活动
  Widget _activity() {
    TextStyle style = TextStyle(
        color: ColorConfig.firstTextColor,
        fontSize: 13.sp,
        fontWeight: FontWeight.w600);
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.h),
      ),
      width: 1.sw - 20.w,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(4.w),
                alignment: Alignment.center,
                child: Text(
                  '活动',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: style,
                ),
              ),
              _distributionWidget(),
            ],
          ),
          _distributionDesWidget()
        ],
      ),
    );
  }

  /// 商品规格
  Widget _specification() {
    TextStyle style = TextStyle(
        color: ColorConfig.firstTextColor,
        fontSize: 13.sp,
        fontWeight: FontWeight.w600);
    TextStyle qianStyle = TextStyle(
        color: ColorConfig.secondTextColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400);
    return Container(
      padding: EdgeInsets.all(14.w),
      margin: EdgeInsets.only(top: 8.h, bottom: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.h),
      ),
      width: 1.sw - 20.w,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '规格',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: style,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            logic.goodDetailState.model.spec,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: qianStyle,
          ),
        ],
      ),
    );
  }

  /// 商品详情
  Widget _desWidget() {
    TextStyle style = TextStyle(
        color: ColorConfig.firstTextColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600);

    List<Widget> widgetList = [];
    List<String> strList = [
      'https://oss.ystpay.cn/ystsr/2023/07/1551bed5ff3846a59e0d7aa10c278a83.jpg',
      'https://oss.ystpay.cn/ystsr/2023/07/52da45936b4044f48e622db133b990b0.jpg',
      'https://oss.ystpay.cn/ystsr/2023/07/b5dab2af0ff145dcba2fe0bcc1370afa.jpg',
      'https://oss.ystpay.cn/ystsr/2023/07/c4c7bb773b6e40c4a21bc149c11762ca.jpg',
      'https://oss.ystpay.cn/ystsr/2023/07/cc4bd28404554e21aa51127456ececa4.jpg',
      'https://oss.ystpay.cn/ystsr/2023/07/f0daf76a6a634e18aaff57c6f3514655.jpg',
      'https://oss.ystpay.cn/ystsr/2023/07/9a640cc58b2746359f4e9bfca97e4210.jpg',
      'https://oss.ystpay.cn/ystsr/2023/07/10130415b64142ed98816d70e7cb8e96.jpg',
      'https://oss.ystpay.cn/ystsr/2023/07/208b6656b60046679c622053e001716f.jpg'
    ];

    for (int i = 0; i < strList.length; i++) {
      widgetList.add(
        AppNetImage(
          imageUrl: strList[i],
          width: (1.sw - 20.w),
        ),
      );
    }
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.h),
      ),
      width: 1.sw - 20.w,
      alignment: Alignment.center,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 6.w),
                padding: EdgeInsets.all(4.w),
                width: 2.w,
                height: 16.h,
                color: ColorConfig.mainColor,
              ),
              Container(
                padding: EdgeInsets.all(4.w),
                alignment: Alignment.center,
                child: Text(
                  '商品详情',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: style,
                ),
              ),
            ],
          ),
          ...widgetList
        ],
      ),
    );
  }

  /// 返回按钮
  Widget _backWidget() {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
          width: 1.sw,
          height: navBarH + 20.h,
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  width: 40.w,
                  height: 40.h,
                  child: Image.asset(
                    "assets/images/back_black.png",
                    fit: BoxFit.fitWidth,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Get.back();
                },
              )
            ],
          )),
    );
  }

  /// 购物车
  Widget _cart() {
    return Stack(
      children: [
        DelayButton(
            width: 80.w,
            height: 50.h,
            onTap: () {},
            alignment: Alignment.center,
            mainWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/tab_gouwuche.png",
                  fit: BoxFit.fitWidth,
                  width: 20.w,
                  height: 20.w,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  ' 购物车',
                  style: TextStyle(
                      fontSize: 12.sp, color: ColorConfig.secondTextColor),
                ),
              ],
            )),
        Positioned(
            top: 0,
            right: 10.w,
            child: const CartNumberWidget(
              number: 20,
            ))
      ],
    );
  }

  /// 加入购物车
  Widget _addCart(int type) {
    return DelayButton(
      width: (1.sw - 80.w) / 2,
      height: 50.h,
      onTap: () {},
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: type == 2 ? ColorConfig.mainColor : ColorConfig.qianMainColor),
      mainWidget: Text(
        type == 1 ? '加入购物车' : '立即购买',
        style: TextStyle(fontSize: 13.sp, color: Colors.white),
      ),
    );
  }

  /// 底部按钮
  Widget _bottomTool() {
    return Positioned(
        bottom: 0,
        left: 0,
        child: Container(
          width: 1.sw,
          height: 50.h,
          color: Colors.white,
          child: Row(
            children: [
              _cart(),
              _addCart(1),
              _addCart(2),
            ],
          ),
        ));
  }

  @override
  Widget buildContent() {
    return GetBuilder<GoodDetailLogic>(
      builder: (_) => creatCommonView(
          logic,
          (con) => Stack(
                children: [
                  /// 页面主体
                  Container(
                    width: 1.sw,
                    height: 1.sh - safeBarH,
                    color: ColorConfig.backgroundColor,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: safeBarH + 30.h),
                      child: Column(
                        children: [
                          _banner(),
                          _introduce(),
                          _activity(),
                          _specification(),
                          _desWidget(),
                        ],
                      ),
                    ),
                  ),
                  _backWidget(),
                  _bottomTool()
                ],
              )),
    );
  }
}
