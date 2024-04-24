import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_demo/experimental_report/model/experimental_report_detail_model.dart';
import 'package:get_demo/experimental_report/report_detail_chart/pie/widgets/indicator.dart';

import 'resources/app_colors.dart';

class ReportDetailChartPie extends StatelessWidget {

  final ExperimentalReportDetailModel model;
  final int touchedIndex = -1;

  const ReportDetailChartPie(
      {super.key, required this.model});

  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[

          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      // setState(() {
                      //   if (!event.isInterestedForInteractions ||
                      //       pieTouchResponse == null ||
                      //       pieTouchResponse.touchedSection == null) {
                      //     touchedIndex = -1;
                      //     return;
                      //   }
                      //   touchedIndex = pieTouchResponse
                      //       .touchedSection!.touchedSectionIndex;
                      // });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: AppColors.contentColorBlue,
                text: '正常',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: AppColors.contentColorYellow,
                text: '错误',
                isSquare: true,
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.contentColorYellow,
            value: model.chart[0].ratio.toDouble(),
            title: "${model.chart[0].ratio.toDouble()}%",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.contentColorBlue,
            value: model.chart[1].ratio.toDouble(),
            title: "${model.chart[1].ratio.toDouble()}%",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
