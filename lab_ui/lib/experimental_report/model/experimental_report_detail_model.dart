import 'package:json_annotation/json_annotation.dart';

part 'experimental_report_detail_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ExperimentalReportDetailModel extends Object {
  List<ExperimentalReportDetailRowModel> rows;

  int length;

  List<Chart> chart;

  @JsonKey(name: 'rows')
  ExperimentalReportDetailModel(
      {this.rows = const [], this.length = 0, this.chart = const []});

  factory ExperimentalReportDetailModel.fromJson(
          Map<String, dynamic> srcJson) =>
      _$ExperimentalReportDetailModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ExperimentalReportDetailModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ExperimentalReportDetailRowModel extends Object {
  String oss_path = "";

  String file_path = "";

  Ocr ocr = Ocr();

  Time_in_range time_in_range = Time_in_range();

  String created_at;

  String file_time;

  ExperimentalReportDetailRowModel({
    this.oss_path = "",
    this.file_path = "",
    this.created_at = "",
    this.file_time = "",
  });

  factory ExperimentalReportDetailRowModel.fromJson(
          Map<String, dynamic> srcJson) =>
      _$ExperimentalReportDetailRowModelFromJson(srcJson);

  Map<String, dynamic> toJson() =>
      _$ExperimentalReportDetailRowModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Ocr extends Object {
  int pv;

  int sv;

  bool warning;

  Ocr({this.pv = 0, this.sv = 0, this.warning = false});

  factory Ocr.fromJson(Map<String, dynamic> srcJson) => _$OcrFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OcrToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Time_in_range extends Object {
  String id;

  String camera_id;

  String device_name;

  String username;

  String pic;

  String result;

  String remarks;

  String start_at;

  String end_at;

  Time_in_range({
    this.id = "",
    this.camera_id = "",
    this.device_name = "",
    this.username = "",
    this.pic = "",
    this.result = "",
    this.remarks = "",
    this.start_at = "",
    this.end_at = "",
  });

  factory Time_in_range.fromJson(Map<String, dynamic> srcJson) =>
      _$Time_in_rangeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Time_in_rangeToJson(this);
}

@JsonSerializable()
class Chart extends Object {
  int ratio;

  String type;

  Chart({this.ratio = 0, this.type = "right"});

  factory Chart.fromJson(Map<String, dynamic> srcJson) =>
      _$ChartFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ChartToJson(this);
}
