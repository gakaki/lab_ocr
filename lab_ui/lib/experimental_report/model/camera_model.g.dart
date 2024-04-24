// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CameraModel _$CameraModelFromJson(Map<String, dynamic> json) => CameraModel(
      json['id'] as int,
      json['lab_id'] as int,
      json['lab_name'] as String,
      json['device_name'] as String,
      json['remarks'] as String,
      json['pic'] as String,
    );

Map<String, dynamic> _$CameraModelToJson(CameraModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lab_id': instance.lab_id,
      'lab_name': instance.lab_name,
      'device_name': instance.device_name,
      'remarks': instance.remarks,
      'pic': instance.pic,
    };
