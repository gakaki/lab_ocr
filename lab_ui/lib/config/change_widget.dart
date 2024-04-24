import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restart_app/restart_app.dart';
import '../util/shared_preferences.dart';

class ChangeWidget extends StatefulWidget {
  const ChangeWidget({super.key});

  @override
  State<ChangeWidget> createState() => _ChangeWidgetState();
}

class _ChangeWidgetState extends State<ChangeWidget> {
  @override
  Widget build(BuildContext context) {
    final width = ScreenUtil().screenWidth - 80.w;
    List list = [
      {"name": "dev 开发环境", "value": 1},
      {"name": "test 测试环境", "value": 2},
      {"name": "pre 测试环境", "value": 3},
      {"name": "prod 正式环境", "value": 4}
    ];
    return Material(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              width: width,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.w))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 14.w,),
                      const Text(
                        "App切换环境,杀死App生效",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 24,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black54,
                              size: 20,
                            )),
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      itemBuilder: (cxt, index) {
                        return GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: const Color(0xFFF3F4F8), width: 1.h))),
                            child: Text(
                              list[index]['name'],
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w400,color: Colors.black87),
                            ),
                          ),
                          onTap: () {
                            SharedPreferencesUtil.sharedPreferences
                                .setInt("environment", list[index]['value']);
                            Navigator.pop(context);
                            /// 重启App
                            Restart.restartApp();
                          },
                        );
                      },
                      itemCount: list.length,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
