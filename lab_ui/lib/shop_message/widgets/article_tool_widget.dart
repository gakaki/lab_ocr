import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_demo/widget/delay_button.dart';
import '../message_detail/message_detail/logic.dart';
import '../model/info_work_model.dart';

class ArticleTooWidget extends StatelessWidget {
  final InfoWorkModel model;
  const ArticleTooWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MessageDetailLogic>();

    return Container(
      width: 1.sw,
      height: 60.h,
      padding: EdgeInsets.only(left: 18.w, right: 18.w),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [commitWidget(), zanWidget(), likeWidget(controller)],
      ),
    );
  }

  /// 评论
  Widget commitWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 18.w),
      margin: EdgeInsets.only(right: 18.w),
      width: 200.w,
      height: 30.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F9FF),
        borderRadius: BorderRadius.all(Radius.circular(35.h)),
      ),
      child: Text(
        '想说点什么..',
        style: TextStyle(fontSize: 12.sp, color: const Color(0xFF999999)),
      ),
    );
  }

  /// 点赞
  Widget zanWidget() {
    return DelayButton(
        width: 40.w,
        height: 40.h,
        onTap: () {},
        mainWidget: Column(
          children: [
            Image.asset(
              "assets/images/zan_nonal.png",
              fit: BoxFit.fitWidth,
              width: 18.w,
              height: 18.w,
              color: Colors.blueGrey,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '点赞',
              style: TextStyle(fontSize: 12.sp, color: const Color(0xFF999999)),
            ),
          ],
        ));
  }

  /// 喜欢
  Widget likeWidget(MessageDetailLogic controller) {
    return DelayButton(
        width: 40.w,
        height: 40.h,
        onTap: () {
          /// 喜欢接口
          controller.likeMethond(model);
        },
        mainWidget: Column(
          children: [
            Image.asset(
              "assets/images/no_collention.png",
              fit: BoxFit.fitWidth,
              width: 18.w,
              height: 18.w,
              color: model.isThumbs == true ? Colors.red : Colors.blueGrey,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text('喜欢',
                style:
                    TextStyle(fontSize: 12.sp, color: const Color(0xFF999999))),
          ],
        ));
  }
}
