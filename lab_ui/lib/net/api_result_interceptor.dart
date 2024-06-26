import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import 'package:get_demo/net/result.dart';

import '../routes/router.dart';
import '../util/log_util.dart';

class ApiResultInterceptor extends Interceptor {
  @override
  Future<void> onResponse(
      Response resp, ResponseInterceptorHandler handler) async {
    var decode = utf8.decode(resp.data);
    resp.data = json.decode(decode);
    String urlPath = resp.requestOptions.path;
    logD('response-urlPath--->:$urlPath');
    logD('response--->:${json.encode(resp.data)}');

    /// http error错误处理
    if (resp.statusCode != 200) {
      if (resp.statusCode == 401) {
        // go to login
        getx.Get.toNamed(AppRoutes.user_login);
        return;
      } else {
        handler.reject(
            DioException(requestOptions: resp.requestOptions, response: resp),
            true);
        return;
      }
    }
    final result =
        Result<dynamic>.fromMapJson(resp.data as Map<String, dynamic>);

    if (result.code == 100200) {
      /// 成功
      handler.next(resp);
      return;
    } else {
      /// 失败
      handler.reject(
          result.toException()..requestOptions = resp.requestOptions, true);
    }
    // handler.next(resp);
  }
}
