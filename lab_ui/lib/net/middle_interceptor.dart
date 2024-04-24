import 'dart:convert';
import 'package:dio/dio.dart';

import '../util/log_util.dart';

class MiddleInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // 将数据内容json 转为字符串
    String content = json.encode(options.data);
    // 获取url 路径
    String urlPath = options.path;

    logD("requestPath---->:$urlPath");
    logD("requestParam--->:${options.queryParameters}");
    return handler.next(options);
  }
}
