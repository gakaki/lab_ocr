import 'model/user_login_model.dart';

class UserLoginState {
  UserLoginModel userLoginModel = UserLoginModel();

  String userName = "";
  String password = "";
  bool isLogined = false;
  String access_token = "";

  UserLoginState() {
    userLoginModel = UserLoginModel();
  }
}
