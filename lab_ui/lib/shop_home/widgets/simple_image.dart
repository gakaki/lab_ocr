import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/app_net_image.dart';

class SimpleImageWidget extends StatelessWidget {
  final int? type;
  final String imageUrl;
  const SimpleImageWidget({super.key, required this.imageUrl, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: type == null ? 0 : 12.w),
      child: AppNetImage(
        fit: BoxFit.fill,
        imageUrl: imageUrl,
        width: 1.sw,
        height: 120.h,
      ),
    );
  }
}
