import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../config/themConfig.dart';
import '../../widget/app_net_image.dart';
import '../model/experimental_report_detail_model.dart';
import '../model/experimental_report_model.dart';
import '../report_list/logic.dart';

class ExperimentalReportRatioWidget extends StatelessWidget {
  final ExperimentalReportDetailRowModel model;
  final int index;

  const ExperimentalReportRatioWidget(
      {super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      color: Colors.white,
      // padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [experimentalReportWidget()],
      ),
    );
  }

  Widget experimentalReportWidget() {
    return Card(
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Text(model.created_at),
                // Text(model.file_time),
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
                Text(model.ocr.pv.toString()),
                Text(model.ocr.pv > 60 ? "成功" : "失败"),
              ],
            ),
          ),
          // 第三行：备注
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 10),
            child: Text(model.ocr.warning.toString()),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Image.network(
          //     model.file_path,
          //     width: 50.0, // 设置图片宽度，高度会根据宽高比自动调整
          //     fit: BoxFit.cover,
          //   ),
          // ),
        ],
      ),
    );
  }
}
