// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'small_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmallCategoryModel _$SmallCategoryModelFromJson(Map<String, dynamic> json) =>
    SmallCategoryModel(
      id: json['id'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      name: json['name'] as String? ?? '',
      isSelect: json['isSelect'] as bool? ?? false,
    );

Map<String, dynamic> _$SmallCategoryModelToJson(SmallCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'isSelect': instance.isSelect,
      'name': instance.name,
    };
