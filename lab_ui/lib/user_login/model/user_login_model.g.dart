// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginModel _$UserLoginModelFromJson(Map<String, dynamic> json) =>
    UserLoginModel(
      id: json['id'] as String? ?? "",
      lab_id: json['lab_id'] as String? ?? "",
      username: json['username'] as String? ?? "",
      password: json['password'] as String? ?? "",
      is_admin: json['is_admin'] as String? ?? "",
      last_login: json['last_login'] as String? ?? "",
      access_token: json['access_token'] as String? ?? "",
      refresh_token: json['refresh_token'] as String? ?? "",
      disabled: json['disabled'] as String? ?? "",
      token_type: json['token_type'] as String? ?? "",
    );

Map<String, dynamic> _$UserLoginModelToJson(UserLoginModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lab_id': instance.lab_id,
      'username': instance.username,
      'password': instance.password,
      'is_admin': instance.is_admin,
      'last_login': instance.last_login,
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
      'disabled': instance.disabled,
      'token_type': instance.token_type,
    };
