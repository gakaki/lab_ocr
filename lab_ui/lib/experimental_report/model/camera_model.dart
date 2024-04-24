import 'package:json_annotation/json_annotation.dart';
part 'camera_model.g.dart';


@JsonSerializable(explicitToJson: true)
class CameraModel {

  int id;
  int lab_id;
  String lab_name;
  String device_name;

  String remarks;
  String pic;

  CameraModel(this.id,this.lab_id,this.lab_name,this.device_name,this.remarks,this.pic);

  factory CameraModel.fromJson(Map<String, dynamic> srcJson) => _$CameraModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CameraModelToJson(this);

}


