import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_demo/routes/router.dart';
import 'package:get_demo/tabbar/binding/tabbar_binding.dart';

import 'package:get_demo/tabbar/view/tabbar_view.dart';
import 'package:get_demo/user_login/binding.dart';
import 'package:get_demo/user_login/logic.dart';
import 'package:get_demo/user_login/view.dart';
import 'package:get_demo/util/global.dart';
import 'config/themConfig.dart';

Future<void> main() async {
  Get.lazyPut<UserLoginLogic>(() => UserLoginLogic());

  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ///app 全局context
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) => GetMaterialApp(
              getPages: AppRoutes.routes,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate, //iOS
              ],
              defaultTransition: Transition.cupertino,
              supportedLocales: const [
                Locale('zh', 'CN'),
                Locale('en', 'US'),
              ],
              builder: (context, widget) {
                return MediaQuery(
                  //设置文字大小不随系统设置改变
                  data: MediaQuery.of(context).copyWith(
                    textScaler: const TextScaler.linear(1.0),
                  ),
                  child: FlutterEasyLoading(
                    child: widget,
                  ),
                );
              },
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,

              // home: UserLoginPage(),
              // initialBinding: UserLoginBinding(),

              home: TabbarPage(),
              initialBinding: TabbarBinding(),

              // home: const SplashPagePage(),
              // initialBinding: SplashPageBinding(),
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeMode.light,
              routingCallback: (routing) {},
            ));
  }
}
