// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experimental_report_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperimentalReportDetailModel _$ExperimentalReportDetailModelFromJson(
        Map<String, dynamic> json) =>
    ExperimentalReportDetailModel(
      rows: (json['rows'] as List<dynamic>?)
              ?.map((e) => ExperimentalReportDetailRowModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      length: json['length'] as int? ?? 0,
      chart: (json['chart'] as List<dynamic>?)
              ?.map((e) => Chart.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ExperimentalReportDetailModelToJson(
        ExperimentalReportDetailModel instance) =>
    <String, dynamic>{
      'rows': instance.rows.map((e) => e.toJson()).toList(),
      'length': instance.length,
      'chart': instance.chart.map((e) => e.toJson()).toList(),
    };

ExperimentalReportDetailRowModel _$ExperimentalReportDetailRowModelFromJson(
        Map<String, dynamic> json) =>
    ExperimentalReportDetailRowModel(
      oss_path: json['oss_path'] as String? ?? "",
      file_path: json['file_path'] as String? ?? "",
      created_at: json['created_at'] as String? ?? "",
      file_time: json['file_time'] as String? ?? "",
    )
      ..ocr = Ocr.fromJson(json['ocr'] as Map<String, dynamic>)
      ..time_in_range =
          Time_in_range.fromJson(json['time_in_range'] as Map<String, dynamic>);

Map<String, dynamic> _$ExperimentalReportDetailRowModelToJson(
        ExperimentalReportDetailRowModel instance) =>
    <String, dynamic>{
      'oss_path': instance.oss_path,
      'file_path': instance.file_path,
      'ocr': instance.ocr.toJson(),
      'time_in_range': instance.time_in_range.toJson(),
      'created_at': instance.created_at,
      'file_time': instance.file_time,
    };

Ocr _$OcrFromJson(Map<String, dynamic> json) => Ocr(
      pv: json['pv'] as int? ?? 0,
      sv: json['sv'] as int? ?? 0,
      warning: json['warning'] as bool? ?? false,
    );

Map<String, dynamic> _$OcrToJson(Ocr instance) => <String, dynamic>{
      'pv': instance.pv,
      'sv': instance.sv,
      'warning': instance.warning,
    };

Time_in_range _$Time_in_rangeFromJson(Map<String, dynamic> json) =>
    Time_in_range(
      id: json['id'] as String? ?? "",
      camera_id: json['camera_id'] as String? ?? "",
      device_name: json['device_name'] as String? ?? "",
      username: json['username'] as String? ?? "",
      pic: json['pic'] as String? ?? "",
      result: json['result'] as String? ?? "",
      remarks: json['remarks'] as String? ?? "",
      start_at: json['start_at'] as String? ?? "",
      end_at: json['end_at'] as String? ?? "",
    );

Map<String, dynamic> _$Time_in_rangeToJson(Time_in_range instance) =>
    <String, dynamic>{
      'id': instance.id,
      'camera_id': instance.camera_id,
      'device_name': instance.device_name,
      'username': instance.username,
      'pic': instance.pic,
      'result': instance.result,
      'remarks': instance.remarks,
      'start_at': instance.start_at,
      'end_at': instance.end_at,
    };

Chart _$ChartFromJson(Map<String, dynamic> json) => Chart(
      ratio: json['ratio'] as int? ?? 0,
      type: json['type'] as String? ?? "right",
    );

Map<String, dynamic> _$ChartToJson(Chart instance) => <String, dynamic>{
      'ratio': instance.ratio,
      'type': instance.type,
    };
