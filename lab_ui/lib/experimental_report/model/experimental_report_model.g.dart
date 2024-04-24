// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experimental_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperimentalReportModel _$ExperimentalReportModelFromJson(
        Map<String, dynamic> json) =>
    ExperimentalReportModel(
      id: json['id'] as String? ?? '',
      camera_id: json['camera_id'] as String? ?? '',
      device_name: json['device_name'] as String? ?? '',
      user_id: json['user_id'] as String? ?? '',
      user_name: json['user_name'] as String? ?? '',
      pic: json['pic'] as String? ?? '',
      metrics:
          (json['metrics'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      result: json['result'] as String? ?? '',
      remarks: json['remarks'] as String? ?? '',
      start_at: json['start_at'] as String? ?? '',
      end_at: json['end_at'] as String? ?? '',
    );

Map<String, dynamic> _$ExperimentalReportModelToJson(
        ExperimentalReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'camera_id': instance.camera_id,
      'device_name': instance.device_name,
      'user_id': instance.user_id,
      'user_name': instance.user_name,
      'pic': instance.pic,
      'metrics': instance.metrics,
      'result': instance.result,
      'remarks': instance.remarks,
      'start_at': instance.start_at,
      'end_at': instance.end_at,
    };
