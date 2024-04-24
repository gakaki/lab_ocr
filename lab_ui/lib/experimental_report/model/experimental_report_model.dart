import 'package:json_annotation/json_annotation.dart';

part 'experimental_report_model.g.dart';

class ExperimentalReportModelList {
  List<ExperimentalReportModel> list;

  ExperimentalReportModelList(this.list);

  factory ExperimentalReportModelList.fromJson(List<dynamic> list) {
    return ExperimentalReportModelList(
      list.map((item) => ExperimentalReportModel.fromJson(item)).toList(),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class ExperimentalReportModel extends Object {
  String id;

  String camera_id;

  String device_name;

  String user_id;
  String user_name;
  String pic;

  List<int> metrics;

  String result;
  String remarks;
  String start_at;
  String end_at;



  ExperimentalReportModel(
  {this.id  = '',
      this.camera_id  = '',
      this.device_name  = '',
      this.user_id  = '',
      this.user_name  = '',
      this.pic  = '',
      this.metrics  = const [],
      this.result  = '',
      this.remarks  = '',
      this.start_at  = '',
      this.end_at  = ''});

  factory ExperimentalReportModel.fromJson(Map<String, dynamic> srcJson) =>
      _$ExperimentalReportModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ExperimentalReportModelToJson(this);
}
