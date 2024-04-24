import 'dart:convert';
import 'package:flutter/services.dart';

class HttpMork {
  /// 获取本地mock数据
  static Future getMockDataWithPath({required String path}) async {
    return HttpMork.mock(path: path);
  }

  static Future<dynamic> mock({required String path}) async {
    var responseStr = await rootBundle.loadString(path);
    var responseJson = json.decode(responseStr);
    return responseJson;
  }
}
