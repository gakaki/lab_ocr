import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFractionPaginationBuilder extends SwiperPlugin {
  const CustomFractionPaginationBuilder(
      {this.color,
      this.fontSize = 20.0,
      this.key,
      this.activeColor,
      this.activeFontSize = 35.0,
      this.backgroundColor});

  final Color? color;

  final Color? activeColor;

  final double fontSize;

  final double activeFontSize;
  final Color? backgroundColor;

  final Key? key;

  @override
  Widget build(BuildContext context, SwiperPluginConfig? config) {
    final themeData = Theme.of(context);
    final activeColor = this.activeColor ?? themeData.primaryColor;
    final color = this.color ?? themeData.scaffoldBackgroundColor;

    if (Axis.vertical == config!.scrollDirection) {
      return Container(
        padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 2.h, bottom: 2.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.h),
          color: backgroundColor ?? Colors.black26,
        ),
        child: Column(
          key: key,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '${config.activeIndex + 1}',
              style: TextStyle(color: activeColor, fontSize: activeFontSize),
            ),
            Text(
              '/',
              style: TextStyle(color: color, fontSize: fontSize),
            ),
            Text(
              '${config.itemCount}',
              style: TextStyle(color: color, fontSize: fontSize),
            )
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 2.h, bottom: 2.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.h),
          color: backgroundColor ?? Colors.black26,
        ),
        child: Row(
          key: key,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '${config.activeIndex + 1}',
              style: TextStyle(color: activeColor, fontSize: activeFontSize),
            ),
            Text(
              ' / ${config.itemCount}',
              style: TextStyle(color: color, fontSize: fontSize),
            )
          ],
        ),
      );
    }
  }
}
