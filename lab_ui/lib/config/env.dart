import 'package:flutter/foundation.dart';
import 'package:get_demo/config/urls.dart';
import '../util/shared_preferences.dart';
import 'ev_config.dart';

class Env {
  /// 当前环境
  static String currEnv = getCurrentEnvironment(str: EnvConfig.dev);

  /// 获取当前环境
  /// 如果是release 直接返回 prod
  /// 可以设置默认值 不设置默认 dev ,既有缓存和默认值 优先缓存
  /// 1: dev 开发环境
  /// 2: test 测试环境
  /// 3: pre 测试环境
  /// 4: prod 正式环境
  static String getCurrentEnvironment({String str = EnvConfig.dev}) {
    /// 取出缓存字段
    int environment = SharedPreferencesUtil.sharedPreferences.getInt("environment") ?? 0;
    if (kReleaseMode) {
      return EnvConfig.prod;
    }
    if (environment == 0) {
      return str;
    } else if (environment == 1) {
      return EnvConfig.dev;
    } else if (environment == 2) {
      return EnvConfig.test;
    } else if (environment == 3) {
      return EnvConfig.pre;
    } else {
      return EnvConfig.prod;
    }
  }

  /// 获取对应环境的配置
  ///
  /// [env] 可选|指定环境
  static EnvConfig getEnvConfig({String env = EnvConfig.dev}) {
    switch (env) {
      case EnvConfig.test:
        return _testConfig;
      case EnvConfig.pre:
        return _preConfig;
      case EnvConfig.prod:
        return _prodConfig;
      default:
        return _devConfig;
    }
  }

  /// 开发环境配置项
  static final EnvConfig _devConfig = EnvConfig(
    baseUrl: Urls.devBaseUrl,
  );

  /// 测试环境配置项
  static final EnvConfig _testConfig = EnvConfig(
    baseUrl: Urls.testBaseUrl,
  );

  /// 预生产环境配置项
  static final EnvConfig _preConfig = EnvConfig(
    baseUrl: Urls.preBaseUrl,
  );

  /// 生产环境配置项
  static final EnvConfig _prodConfig = EnvConfig(
    baseUrl: Urls.prodBaseUrl,
    isDebug: false,
  );

  ///获取当前域名
  static String getCurrentBaseUrl() {
    return getEnvConfig(env: currEnv).baseUrl;
  }

  ///是否不是正式环境
  static bool isNotProductionEnv() {
    return getCurrentBaseUrl() != Urls.prodBaseUrl;
  }
}
