import 'package:json_annotation/json_annotation.dart';

part 'user_login_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserLoginModel {
  String id;
  String lab_id;
  String username;
  String password;
  String is_admin;

  String last_login;
  String access_token;
  String refresh_token;
  String disabled;
  String token_type; // no usage

  UserLoginModel({
    this.id = "",
    this.lab_id = "",
    this.username = "",
    this.password = "",
    this.is_admin = "",
    this.last_login = "",
    this.access_token = "",
    this.refresh_token = "",
    this.disabled = "",
    this.token_type = "",
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> srcJson) =>
      _$UserLoginModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserLoginModelToJson(this);
}
