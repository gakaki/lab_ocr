import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_demo/base/base_common_view.dart';

import 'logic.dart';

class UserLoginPage extends BaseCommonView<UserLoginLogic> {
  UserLoginPage({super.key});

  /// 隐藏导航栏
  @override
  bool? get isHiddenNav => false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget buildContent() {
    return GetBuilder<UserLoginLogic>(
        builder: (_) => creatCommonView(
            controller,
            (con) => Scaffold(
                resizeToAvoidBottomInset: false,
                body: Stack(
                  children: [
                    PopScope(
                        canPop: false,
                        onPopInvoked: (bool didPop) async {
                          print(didPop);
                          if (didPop) {
                            return;
                          }
                          // 不让后退了 需要登录 交给controller那里了
                          // final bool shouldPop = await _showBackDialog() ?? false;
                          // if (context.mounted && shouldPop) {
                          //   Navigator.pop(context);
                          // }
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '欢迎使用本系统',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 36),
                                  TextFormField(
                                    onChanged: (value) => {
                                      controller.userLoginState.userName = value
                                    },
                                    decoration: const InputDecoration(
                                      labelText: '用户名',
                                      prefixIcon: Icon(Icons.person),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  TextFormField(
                                    onChanged: (value) => {
                                      controller.userLoginState.password = value
                                    },
                                    decoration: const InputDecoration(
                                      labelText: '密码',
                                      prefixIcon: Icon(Icons.lock),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        controller.login();
                                      }
                                    },
                                    child: const Text('登录'),
                                  ),
                                ],
                              ),
                            ))),
                  ],
                ))));
  }
}
