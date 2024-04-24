import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartNumberWidget extends StatelessWidget {
  final int number;
  const CartNumberWidget({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.w400);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.h),
        color: Colors.red,
      ),
      child: Text(
        number.toString(),
        style: style,
      ),
    );
  }
}
