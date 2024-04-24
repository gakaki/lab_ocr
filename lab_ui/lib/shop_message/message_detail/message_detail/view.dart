import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_demo/base/base_common_view.dart';

import '../../widgets/article_nav_widget.dart';
import '../../widgets/article_tool_widget.dart';
import '../../widgets/article_web_widget.dart';
import 'logic.dart';

class MessageDetailPage extends BaseCommonView<MessageDetailLogic> {
  MessageDetailPage({super.key});

  /// 隐藏导航栏
  @override
  bool? get isHiddenNav => true;

  @override
  Widget buildContent() {
    return GetBuilder<MessageDetailLogic>(
      builder: (_) => creatCommonView(
          controller,
          (con) => Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().statusBarHeight + kToolbarHeight,
                        bottom: ScreenUtil().bottomBarHeight + 60.h),
                    child: ArticleWebWidget(
                      htmlStr: controller.messageDetailState.infoWorkModel.newsContent,
                    ),
                  ),
                  const Positioned(child: ArticleNavWidget()),
                  Positioned(
                      bottom: ScreenUtil().bottomBarHeight,
                      child: ArticleTooWidget(
                        model: controller.messageDetailState.infoWorkModel,
                      ))
                ],
              )),
    );
  }
}
