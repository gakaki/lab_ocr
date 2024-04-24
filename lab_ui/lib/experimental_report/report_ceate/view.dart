import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_demo/base/base_common_view.dart';

import '../../config/change_widget.dart';
import '../../config/colorConfig.dart';
import 'logic.dart';

class ExperimentReportCreatePage
    extends BaseCommonView<ExperimentReportCreateLogic> {
  ExperimentReportCreatePage({super.key});

  /// 隐藏导航栏
  @override
  bool? get isHiddenNav => false;

  final _formKey = GlobalKey<FormState>();

  @override

  /// 设置导航栏颜色
  Color? get navColor => ColorConfig.mainColor;
  @override

  /// 设置导航栏文字
  String? get navTitle => '实验 登记';
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
    return GetBuilder<ExperimentReportCreateLogic>(
      builder: (_) => creatCommonView(
          controller,
          (con) => Stack(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            const Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("用户名001"),
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("设备名001")),
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            TextFormField(
                              maxLines: 2,
                              decoration: const InputDecoration(
                                labelText: "实验备注",
                                hintText: "实验备注必填",
                                // prefixIcon: Icon(Icons.people),
                                hintStyle: TextStyle(
                                    fontSize: 29, fontWeight: FontWeight.bold),
                                labelStyle: TextStyle(fontSize: 29),
                              ),
                              // onSaved: (value) => _remark = value!,
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            ElevatedButton(
                              // onPressed: ()  {
                              //    controller.submit();
                              // },
                              onPressed: () async {
                                await controller.submit();
                              },
                              child: const Text('开始实验'),
                            ),
                          ],
                        ),
                      ))
                ],
              )),
    );
  }
}
