import 'package:dio/dio.dart';
import '../config/env.dart';
import 'api_result_interceptor.dart';
import 'error_interceptor.dart';
import 'jwt_interceptor.dart';
import 'middle_interceptor.dart';
import 'rest_client.dart';

class Http {
  ///超时时间
  static const Duration connectTimeout = Duration(milliseconds: 20 * 1000);

  static const Duration receiveTimeout = Duration(milliseconds: 20 * 1000);


  /// 实例化
  static final Http _instance = Http._internal();

  /// 构造返回单例
  factory Http() => _instance;

  late Dio dio;
  late RestClient client;

  static late String ip;
  static late String dk;

  Http._internal() {
    BaseOptions options = BaseOptions(
      connectTimeout: connectTimeout,
      /// 响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: receiveTimeout,
      baseUrl: Env.getEnvConfig(env: Env.currEnv).baseUrl,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.bytes,
      receiveDataWhenStatusError: false,
    );

    dio = Dio(options);
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //   client.badCertificateCallback = (cert, host, port) {
    //     return true;
    //   };
    //   return null;
    // };
    // 添加error拦截器
    dio.interceptors.add(MiddleInterceptor());
    dio.interceptors.add(ErrorInterceptor());
    dio.interceptors.add(ApiResultInterceptor());
    dio.interceptors.add(JWTInterceptor());
    client = RestClient(dio, baseUrl: Env.getEnvConfig(env: Env.currEnv).baseUrl);
  }
}

