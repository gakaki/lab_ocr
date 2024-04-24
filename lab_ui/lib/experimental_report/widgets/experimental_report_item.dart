import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../config/themConfig.dart';
import '../../widget/app_net_image.dart';
import '../model/experimental_report_model.dart';
import '../report_list/logic.dart';

class ExperimentalReportWidget extends StatelessWidget {
  final ExperimentalReportModel model;
  final int index;

  const ExperimentalReportWidget(
      {super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    final login = Get.find<ReportListLogic>();

    return Container(
      width: 1.sw,
      color: Colors.white,
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // threeImageWidget(),

          experimentalReportWidget(),
          // SizedBox(
          //   height: 10.h,
          // ),
          // titleWidget(),
          // SizedBox(
          //   height: 10.h,
          // ),
          // authorWidget(),
          // SizedBox(
          //   height: 14.h,
          // ),
          lineWidget()
        ],
      ),
    );
  }

  /// 三张图片
  Widget threeImageWidget() {
    List<Widget> rowWidget = [];
    // for (int i = 0; i < model.newsPics.length; i++) {
    rowWidget.add(
      ClipRRect(
        borderRadius: BorderRadius.circular(5.h),
        child: AppNetImage(
          imageUrl: model.pic,
          width: (1.sw - 40.w) / 3,
          height: (1.sw - 40.w) / 3 / 3 * 2,
        ),
      ),
    );

    rowWidget.add(
      SizedBox(
        width: 10.w,
      ),
    );

    // }

    return Row(
      children: rowWidget,
    );
  }

  /// 文字描述
  Widget titleWidget() {
    return Text(
      model.device_name,
      style: Get.isDarkMode
          ? darkTheme.textTheme.bodyMedium
          : lightTheme.textTheme.bodyMedium,
    );
  }

  /// 作者
  Widget authorWidget() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.w),
          child: AppNetImage(
            imageUrl: model.pic,
            width: 20.w,
            height: 20.w,
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          model.device_name,
          style: Get.isDarkMode
              ? darkTheme.textTheme.bodyLarge
              : lightTheme.textTheme.bodyLarge,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          model.device_name,
          style: Get.isDarkMode
              ? darkTheme.textTheme.bodySmall
              : lightTheme.textTheme.bodySmall,
        ),
      ],
    );
  }

  /// 线
  Widget lineWidget() {
    return Container(
      height: 2.h,
      width: 1.sw - 20.w,
      color: Get.isDarkMode ? darkTheme.dividerColor : lightTheme.dividerColor,
    );
  }

  /// 文字描述
  Widget experimentalReportWidget() {
    return Card(
      child: Column(
        children: <Widget>[
          // 第一行：姓名和时间
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(model.user_name),
                Text(model.end_at),
              ],
            ),
          ),
          // 第二行：设备名和实验结果
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(model.device_name),
                Text(model.result == "success" ? "成功" : "失败"),
              ],
            ),
          ),
          // 第三行：备注
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 10),
            child: Text(model.remarks),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              model.pic,
              width: 50.0, // 设置图片宽度，高度会根据宽高比自动调整
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
