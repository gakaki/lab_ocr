import 'package:json_annotation/json_annotation.dart';
import 'info_model.dart';
part 'info_work_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InfoWorkModel {
  int totalCount;
  List<InfoModel> works;
  String newsContent;

  List keywords;
  String cover;
  int shareCount;
  String mcnIcon;
  String editorName;
  int mcnTemplateId;
  int followStatus;
  int entityType;

  String nickName;
  bool isThumbs;
  int commentCount;
  String pageViewStr;
  String shareCountStr;
  int subType;

  List newsPics;

  int status;

  String mcnRealName;
  String creationTime;
  bool isLike;
  String userAvatar;

  String mcnPageView;
  String description;
  String commentCountStr;
  String title;
  String mcnFansCount;

  String brandLogo;
  int channelId;
  String thumbsCounts;
  int original;
  String uVContent;
  int entityId;

  String userName;

  String userId;
  String url;
  int pageView;
  String createTime;
  int mcnId;
  int categoryId;

  InfoWorkModel(
      {this.totalCount = 0,
      this.works = const [],
      this.title = '',
      this.newsPics = const [],
      this.mcnRealName = '',
      this.nickName = '',
      this.mcnIcon = '',
      this.uVContent = '',
      this.userId = '',
      this.url = '',
      this.subType = 0,
      this.mcnId = 0,
      this.entityType = 0,
      this.description = '',
      this.createTime = '',
      this.brandLogo = '',
      this.categoryId = 0,
      this.channelId = 0,
      this.commentCount = 0,
      this.commentCountStr = '',
      this.cover = '',
      this.creationTime = '',
      this.editorName = '',
      this.entityId = 0,
      this.followStatus = 0,
      this.isLike = false,
      this.isThumbs = false,
      this.keywords = const [],
      this.mcnFansCount = '',
      this.mcnPageView = '',
      this.mcnTemplateId = 0,
      this.newsContent = '',
      this.original = 0,
      this.pageView = 0,
      this.pageViewStr = '',
      this.shareCount = 0,
      this.shareCountStr = '',
      this.status = 0,
      this.thumbsCounts = '',
      this.userAvatar = '',
      this.userName = ''});

  factory InfoWorkModel.fromJson(Map<String, dynamic> json) =>
      _$InfoWorkModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoWorkModelToJson(this);
}
