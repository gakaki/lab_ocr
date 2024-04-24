import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../shop_home/widgets/cart_number_widget.dart';
import '../controller/tabbar_controller.dart';

class TabbarPage extends GetView<TabbarController> {
  const TabbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabbarController>(
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: controller.tabIndex.value,
          children: controller.tabPageList,
        ),
        // bottomNavigationBar: _buildBottomTab(),
        // 暂时关闭
      ),
    );
  }

  /// 底部tab
  Widget _buildBottomTab() {
    return BottomNavigationBar(
      unselectedItemColor: const Color(0xFF666666),
      selectedItemColor: const Color(0xFF000000),
      selectedFontSize: 12.0,
      unselectedFontSize: 10.0,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 12.h, bottom: 6.h),
            child: Image(
              fit: BoxFit.fill,
              width: 20.w,
              height: 20.w,
              image: const AssetImage("assets/images/tab_shouye.png"),
              color:
                  controller.tabIndex.value == 0 ? Colors.black : Colors.grey,
            ),
          ),
          label: '首页',
        ),
        BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 12.h, bottom: 6.h),
              child: Image(
                width: 20.w,
                height: 20.w,
                image: const AssetImage("assets/images/tab_category.png"),
                color:
                    controller.tabIndex.value == 1 ? Colors.black : Colors.grey,
              ),
            ),
            label: '商品分类'),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 12.h, bottom: 6.h),
            child: Image(
              fit: BoxFit.fill,
              width: 20.w,
              height: 20.w,
              image: const AssetImage("assets/images/tab_main_unchecked.png"),
              color:
                  controller.tabIndex.value == 2 ? Colors.black : Colors.grey,
            ),
          ),
          label: '资讯',
        ),
        BottomNavigationBarItem(
            icon: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: 12.h, bottom: 6.h, left: 12.w, right: 18.w),
                  child: Image(
                    width: 20.w,
                    height: 20.w,
                    image: const AssetImage("assets/images/tab_gouwuche.png"),
                    color: controller.tabIndex.value == 3
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
                Obx(() => Positioned(
                      right: 0,
                      child: controller.cartNumber.value == 0
                          ? const SizedBox()
                          : CartNumberWidget(
                              number: controller.cartNumber.value,
                            ),
                    ))
              ],
            ),
            label: '购物车'),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 12.h, bottom: 6.h),
            child: Image(
              fit: BoxFit.fill,
              width: 20.w,
              height: 20.w,
              image: const AssetImage("assets/images/black_cart.png"),
              color:
                  controller.tabIndex.value == 4 ? Colors.black : Colors.grey,
            ),
          ),
          label: '我的',
        ),
      ],
      currentIndex: controller.tabIndex.value,
      onTap: (int index) async {
        if (controller.tabIndex.value == index) {
          return;
        }
        controller.tabIndex.value = index;
        controller.update();
      },
    );
  }
}
