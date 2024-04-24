import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_demo/config/colorConfig.dart';

class RemoveGoodDialog extends StatefulWidget {
  final Function confirmFunction;
  final Function? cancelFunction;

  const RemoveGoodDialog({
    super.key,
    required this.confirmFunction,
    this.cancelFunction,
  });

  @override
  State<RemoveGoodDialog> createState() => _RemoveGoodDialogState();
}

class _RemoveGoodDialogState extends State<RemoveGoodDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = 1.sw - 84.w;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Center(
            child: Container(
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12.w))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      '提示',
                      style: TextStyle(
                          color: const Color(0xFF000000),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Text(
                        '是否删除此商品',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF999999),
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    // Flexible(child: Container()),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                            if (widget.cancelFunction != null) {
                              widget.cancelFunction!();
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: width / 2,
                            height: 45.h,
                            child: Text('取消',
                                style: TextStyle(
                                    color: const Color(0xFF999999),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                            widget.confirmFunction();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: width / 2,
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: ColorConfig.mainColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.h),
                                  bottomRight: Radius.circular(12.h)),
                            ),
                            child: Text('确定',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600)),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
