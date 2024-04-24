import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_demo/config/colorConfig.dart';
import 'package:get_demo/shop_message/shop_message_list/logic.dart';
import '../../base/base_list_view.dart';
import '../../config/change_widget.dart';
import '../../config/env.dart';
import '../../widget/loading_widget.dart';
import '../widgets/info_item.dart';

///
/// 首页
///

class ShopMessageListPage extends BaseListView<ShopMessageListLogic> {
  ShopMessageListPage({super.key});

  @override

  /// 设置导航栏颜色
  Color? get navColor => ColorConfig.mainColor;

  @override

  /// 设置导航栏文字
  String? get navTitle => '资讯';
  @override

  /// 设置主页面颜色
  Color? get contentColor => Colors.white;
  @override

  /// 设置左边按钮宽度
  double? get leftWidth => 50;
  @override

  /// 设置左边按钮
  Widget? get leftButton => left();
  @override

  ///  设置右边按钮
  List<Widget>? get rightActionList => [
        GestureDetector(
          onTap: () {
            Loading.showToast('点击右边按钮 1');
          },
          child: Icon(
            Icons.search,
            color: Colors.black87,
            size: 24.w,
          ),
        ),
        SizedBox(
          width: 14.w,
        ),
        GestureDetector(
          onTap: () {
            Loading.showToast('点击右边按钮 2');
          },
          child: Icon(
            Icons.security,
            color: Colors.black87,
            size: 20.w,
          ),
        ),
        SizedBox(
          width: 20.w,
        )
      ];

  /// 左边按钮
  Widget left() {
    return Env.isNotProductionEnv()
        ? InkWell(
            onTap: () {
              showDialog(
                  context: Get.context!,
                  builder: (cxt) {
                    return const ChangeWidget();
                  });
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 50,
              height: 20,
              child: const Text(
                '切换环境',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        : const SizedBox();
  }

  @override
  Widget buildContent() {
    // TODO: implement buildContent
    return GetBuilder<ShopMessageListLogic>(
      builder: (_) {
        return creatRefresherListView(
            controller,
            (con) => ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: controller.messageState.infoList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: InfoWidget(
                        model: controller.messageState.infoList[index],
                        index: index,
                      ),
                      onTap: () {
                        controller.pushDetail(
                            controller.messageState.infoList[index].id);
                      },
                    );
                  },
                ));
      },
    );
  }
}
