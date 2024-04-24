import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_demo/base/base_common_view.dart';

import '../../config/colorConfig.dart';
import '../report_detail_chart/pie/pie.dart';
import '../widgets/experimental_report_detail_ration.dart';
import 'logic.dart';

class ExperimentReportDetailPage
    extends BaseCommonView<ExperimentReportDetailLogic> {
  ExperimentReportDetailPage({super.key});

  /// 隐藏导航栏
  @override
  bool? get isHiddenNav => false;

  @override

  /// 设置导航栏颜色
  Color? get navColor => ColorConfig.mainColor;

  @override

  /// 设置导航栏文字
  String? get navTitle => '实验列表详情';

  @override

  /// 设置主页面颜色
  Color? get contentColor => Colors.white;

  @override

  /// 设置左边按钮宽度
  double? get leftWidth => 50;

  @override

  /// 设置左边按钮
  Widget? get leftButton => left();

  /// 左边按钮
  Widget left() {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Icon(
        Icons.arrow_back,
        color: Colors.black87,
        size: 20.w,
      ),
    );
  }

  @override
  Widget buildContent() {
    return GetBuilder<ExperimentReportDetailLogic>(
      builder: (_) => creatCommonView(
          controller,
          (con) => Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0.h),
                    child: ReportDetailChartPie(
                        model: controller.experimentReportDetailState
                            .experimentalReportDetailModel),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.h, bottom: 0.h),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.experimentReportDetailState
                          .experimentalReportDetailModel.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: ExperimentalReportRatioWidget(
                            model: controller.experimentReportDetailState
                                .experimentalReportDetailModel.rows[index],
                            index: index,
                          ),
                          onTap: () {
                            // controller.pushDetail(controller
                            //     .experimentalReportListState.itemList[index]);
                          },
                        );
                      },
                    ),
                  ),
                ],
              )),
    );
  }
}
