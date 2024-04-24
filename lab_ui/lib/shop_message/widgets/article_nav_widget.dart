import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../config/themConfig.dart';
import '../../widget/app_net_image.dart';
import '../../widget/delay_button.dart';
import '../message_detail/message_detail/logic.dart';

class ArticleNavWidget extends StatelessWidget {
  const ArticleNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MessageDetailLogic>();

    /// 导航栏
    return Container(
      padding:
          EdgeInsets.only(right: 15.w, top: ScreenUtil().statusBarHeight + 5.h),
      width: 1.sw,
      color: Colors.white,
      height: ScreenUtil().statusBarHeight + kToolbarHeight,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DelayButton(
                width: 40.w,
                height: ScreenUtil().statusBarHeight + kToolbarHeight,
                onTap: () {
                  Get.back();
                },
                mainWidget: Image.asset("assets/images/back_black.png",
                    fit: BoxFit.cover,
                    color: Colors.blueGrey,
                    width: 26.w,
                    height: 26.w),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.w),
                child: AppNetImage(
                  imageUrl: controller.messageDetailState.infoWorkModel.mcnIcon,
                  width: 40.w,
                  height: 40.w,
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.messageDetailState.infoWorkModel.mcnRealName,
                    style: lightTheme.textTheme.bodyMedium,
                  ),
                  Text(
                    '浏览量 ${controller.messageDetailState.infoWorkModel.pageViewStr}  粉丝 ${controller.messageDetailState.infoWorkModel.mcnFansCount}',
                    style: lightTheme.textTheme.bodyLarge,
                  ),
                ],
              )
            ],
          ),
          DelayButton(
            width: 60.w,
            height: 30.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(35.h)),
              border: Border.all(width: 1, color: Colors.black54),
            ),
            onTap: () {},
            mainWidget: Text(
              '关注',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
