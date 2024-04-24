// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'big_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BigCategoryModel _$BigCategoryModelFromJson(Map<String, dynamic> json) =>
    BigCategoryModel(
      id: json['id'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      isRotation: json['isRotation'] as String? ?? '',
      name: json['name'] as String? ?? '',
      children: (json['children'] as List<dynamic>?)
              ?.map(
                  (e) => SmallCategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BigCategoryModelToJson(BigCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'isRotation': instance.isRotation,
      'children': instance.children.map((e) => e.toJson()).toList(),
    };
