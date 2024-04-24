// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) => InfoModel(
      mcnRealName: json['mcnRealName'] as String? ?? '',
      videoCover: json['videoCover'] as String? ?? '',
      avatarUrl: json['avatarUrl'] as String? ?? '',
      adFlag: json['adFlag'] as int? ?? 0,
      adFlagShow: json['adFlagShow'] as int? ?? 0,
      adsType: json['adsType'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      checkStatus: json['checkStatus'] as int? ?? 0,
      createTime: json['createTime'] as String? ?? '',
      description: json['description'] as String? ?? '',
      entityType: json['entityType'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
      mcnIcon: json['mcnIcon'] as String? ?? '',
      newsPics: json['newsPics'] as List<dynamic>? ?? const [],
      nickName: json['nickName'] as String? ?? '',
      url: json['url'] as String? ?? '',
      userId: json['userId'] as int? ?? 0,
      uVContent: json['uVContent'] as int? ?? 0,
      uVContentStr: json['uVContentStr'] as String? ?? '',
      worksType: json['worksType'] as int? ?? 0,
      createTimeStr: json['createTimeStr'] as String? ?? '',
      isThumbs: json['isThumbs'] as int? ?? 0,
    );

Map<String, dynamic> _$InfoModelToJson(InfoModel instance) => <String, dynamic>{
      'mcnRealName': instance.mcnRealName,
      'uVContentStr': instance.uVContentStr,
      'adFlag': instance.adFlag,
      'description': instance.description,
      'title': instance.title,
      'checkStatus': instance.checkStatus,
      'mcnIcon': instance.mcnIcon,
      'adFlagShow': instance.adFlagShow,
      'adsType': instance.adsType,
      'worksType': instance.worksType,
      'id': instance.id,
      'uVContent': instance.uVContent,
      'avatarUrl': instance.avatarUrl,
      'entityType': instance.entityType,
      'nickName': instance.nickName,
      'userId': instance.userId,
      'url': instance.url,
      'createTime': instance.createTime,
      'createTimeStr': instance.createTimeStr,
      'videoCover': instance.videoCover,
      'newsPics': instance.newsPics,
      'isThumbs': instance.isThumbs,
    };
