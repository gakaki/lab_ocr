import 'package:json_annotation/json_annotation.dart';
part 'info_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InfoModel {
  String mcnRealName;
  String uVContentStr;
  int adFlag;
  String description;
  String title;
  int checkStatus;
  String mcnIcon;
  int adFlagShow;
  int adsType;
  int worksType;
  int id;
  int uVContent;
  String avatarUrl;
  int entityType;
  String nickName;
  int userId;
  String url;
  String createTime;
  String createTimeStr;
  String videoCover;
  List newsPics;
  int isThumbs;

  InfoModel(
      {this.mcnRealName = '',
      this.videoCover = '',
      this.avatarUrl = '',
      this.adFlag = 0,
      this.adFlagShow = 0,
      this.adsType = 0,
      this.title = '',
      this.checkStatus = 0,
      this.createTime = '',
      this.description = '',
      this.entityType = 0,
      this.id = 0,
      this.mcnIcon = '',
      this.newsPics = const [],
      this.nickName = '',
      this.url = '',
      this.userId = 0,
      this.uVContent = 0,
      this.uVContentStr = '',
      this.worksType = 0,
      this.createTimeStr = '',
      this.isThumbs = 0});

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoModelToJson(this);
}
