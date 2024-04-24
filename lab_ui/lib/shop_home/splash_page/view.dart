import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_demo/widget/delay_button.dart';

import '../../routes/router.dart';
import 'logic.dart';

class SplashPagePage extends GetView<SplashPageLogic> {
  const SplashPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SplashPageLogic>();

    return Scaffold(
      backgroundColor: const Color(0xFFEFF4FF),
      body: Obx(() => AnimatedOpacity(
            opacity: logic.opacityLevel.value,
            duration: const Duration(milliseconds: 3000),
            onEnd: () {
              Get.toNamed(AppRoutes.appMain);
            },
            child: Stack(
              children: [
                SizedBox(
                  width: 1.sw,
                  height: 1.sh,
                  child: Image.asset(
                    'assets/images/qdy_20200910.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    right: 20.w,
                    bottom: ScreenUtil().bottomBarHeight + 40.h,
                    child: DelayButton(
                      width: 80.w,
                      height: 40.h,
                      onTap: () {
                        Get.toNamed(AppRoutes.appMain);
                      },
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20.h),
                      ),
                      mainWidget: Text(
                        '跳过',
                        style: TextStyle(fontSize: 13.sp, color: Colors.white),
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
