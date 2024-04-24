import 'package:get/get.dart';
import 'package:get_demo/base/base_common_controller.dart';
import 'package:get_demo/user_login/model/user_login_model.dart';

import '../../../base/base_controller.dart';
import '../../../net/http.dart';
import '../../../widget/loading_widget.dart';
import '../util/shared_preferences.dart';
import 'user_login_state.dart';

class UserLoginLogic extends BaseCommonController {
  UserLoginState userLoginState = UserLoginState();

  @override
  void initData() {
    getnetworkdata(configNetWorkParmas());
  }

  @override
  void getnetworkdata(Map<String, dynamic> info) {
    super.getnetworkdata(info);

    Loading.show();
    Loading.dissmiss();
    netState = NetState.dataSussessState;

    update();
  }

  final ACCESS_TOKEN = "access_token";

  void login() {
    // just clone
    userLoginState.userLoginModel.username = userLoginState.userName.toString();
    userLoginState.userLoginModel.password = userLoginState.password.toString();

    userLoginState.userLoginModel.username = "johndoe";
    userLoginState.userLoginModel.password = "secret";
    print(userLoginState.userName);

    Http()
        .client
        .token(
          userLoginState.userLoginModel.username,
          userLoginState.userLoginModel.password,
        )
        .then((value) {
      netState = NetState.dataSussessState;
      Loading.dissmiss();

      userLoginState.userLoginModel = value.data as UserLoginModel;
      userLoginState.access_token = userLoginState.userLoginModel.access_token;

      SharedPreferencesUtil.setString(
          ACCESS_TOKEN, userLoginState.access_token);

      if (value.data == null) {
        netState = NetState.emptyDataState;
      }
      userLoginState.isLogined = true;
      // 回退
      Get.back();

      update();
    }).catchError((onError) {
      print(onError);
      Loading.dissmiss();
      netState = NetState.errorshowRelesh;
      update();
    });
  }

  @override
  configNetWorkParmas() {
    return {};
  }

  @override
  void onHidden() {}
}
