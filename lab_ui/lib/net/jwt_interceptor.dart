import 'package:dio/dio.dart';
import 'package:get_demo/util/shared_preferences.dart';

import '../util/log_util.dart';

class JWTInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var jwt = getJwt();
    options.headers['Authorization'] = 'Bearer $jwt';
    if (jwt == "") {}

    logD("requestt headers---->:${options.headers}");

    return handler.next(options);
  }

  // 假设你有一个方法来获取JWT，这里我们用一个字符串代替
  String getJwt() {
    return SharedPreferencesUtil.getString("access_token");
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.headers['jwt-need-update'] == 'true') {
      // 更新JWT的逻辑
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 处理错误，例如当JWT过期时
    if (err.response?.statusCode == 401) {
      // 处理401未授权错误，可能需要重新登录或刷新JWT
    }
    handler.next(err);
  }
}
