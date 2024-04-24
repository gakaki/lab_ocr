import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_demo/base/base_common_view.dart';
import 'package:get_demo/config/colorConfig.dart';

import 'logic.dart';

class ShopMinePage extends BaseCommonView<ShopMineLogic> {
  ShopMinePage({super.key});

  final logic = Get.find<ShopMineLogic>();

  @override
  // TODO: implement navTitle
  String? get navTitle => '我的';
  @override
  // TODO: implement isHiddenNav
  bool? get isHiddenNav => true;

  @override
  Widget buildContent() {
    /// 用户姓名
    Widget nameWidget() {
      TextStyle style = TextStyle(
          color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600);
      return Text(
        '木子雨廷',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style,
      );
    }

    /// 用户电话
    Widget phoneWidget() {
      TextStyle style = TextStyle(
          color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600);
      return Text(
        '13161126787',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style,
      );
    }

    /// 用户信息
    Widget mineHeader() {
      return Container(
        width: 1.sw,
        height: navBarH + 110.h,
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 70.h),
        decoration: BoxDecoration(
          color: ColorConfig.mainColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(14.h),
            bottomRight: Radius.circular(14.h),
          ),
        ),
        child: Row(
          children: [
            Image(
                fit: BoxFit.fill,
                width: 54.w,
                height: 54.w,
                image: const AssetImage("assets/images/login_icon.png")),
            SizedBox(
              width: 20.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [nameWidget(), phoneWidget()],
            )
          ],
        ),
      );
    }

    /// 线
    Widget line() {
      return Container(
        width: 1.sw,
        height: 1.h,
        color: ColorConfig.backgroundColor,
        margin: EdgeInsets.symmetric(vertical: 12.h),
      );
    }

    /// 我的订单文字
    Widget orderText(String title) {
      TextStyle style = TextStyle(
          color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w600);
      return Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: style,
        ),
      );
    }

    /// 订单item
    Widget orderItem(String title) {
      TextStyle style = TextStyle(
          color: ColorConfig.secondTextColor,
          fontSize: 11.sp,
          fontWeight: FontWeight.w400);
      return Column(
        children: [
          Image(
              fit: BoxFit.fill,
              width: 24.w,
              height: 24.w,
              image: const AssetImage("assets/images/daishouhuo.png")),
          SizedBox(
            height: 4.h,
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: style,
          ),
        ],
      );
    }

    /// 我的订单
    Widget myOrderList() {
      return Container(
        margin: EdgeInsets.only(top: 10.h, bottom: 5.h),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            orderText('我的订单'),
            line(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                orderItem('代付款'),
                orderItem('待拣货'),
                orderItem('待自提'),
                orderItem('配送中'),
              ],
            )
          ],
        ),
      );
    }

    /// 我的服务item
    Widget myServerItem(String title) {
      return SizedBox(
        width: 60.w,
        child: orderItem(title),
      );
    }

    /// 我的服务
    Widget myServerList() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 0.h),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            orderText('我的服务'),
            line(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              width: 1.sw - 40.w,
              child: Wrap(
                spacing: 30.w,
                runSpacing: 20.h,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  myServerItem('优惠券'),
                  myServerItem('退款服务'),
                  myServerItem('收货地址'),
                  myServerItem('联系客服'),
                  myServerItem('联系门店'),
                  myServerItem('收藏小程序'),
                ],
              ),
            )
          ],
        ),
      );
    }

    return GetBuilder<ShopMineLogic>(
      builder: (_) => creatCommonView(
          logic,
          (con) => Container(
                width: 1.sw,
                height: 1.sh,
                color: ColorConfig.backgroundColor,
                child: Column(
                  children: [mineHeader(), myOrderList(), myServerList()],
                ),
              )),
    );
  }
}
