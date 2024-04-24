// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopHomeModel _$ShopHomeModelFromJson(Map<String, dynamic> json) =>
    ShopHomeModel(
      banner: (json['banner'] as List<dynamic>?)
              ?.map((e) => GoodItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      category: (json['category'] as List<dynamic>?)
              ?.map((e) => GoodItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      columGoods: (json['columGoods'] as List<dynamic>?)
              ?.map((e) => GoodItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      meat: (json['meat'] as List<dynamic>?)
              ?.map((e) => GoodItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      member: (json['member'] as List<dynamic>?)
              ?.map((e) => GoodItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      rowGoods: (json['rowGoods'] as List<dynamic>?)
              ?.map((e) => GoodItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      vegetable: (json['vegetable'] as List<dynamic>?)
              ?.map((e) => GoodItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ShopHomeModelToJson(ShopHomeModel instance) =>
    <String, dynamic>{
      'banner': instance.banner.map((e) => e.toJson()).toList(),
      'category': instance.category.map((e) => e.toJson()).toList(),
      'member': instance.member.map((e) => e.toJson()).toList(),
      'vegetable': instance.vegetable.map((e) => e.toJson()).toList(),
      'meat': instance.meat.map((e) => e.toJson()).toList(),
      'rowGoods': instance.rowGoods.map((e) => e.toJson()).toList(),
      'columGoods': instance.columGoods.map((e) => e.toJson()).toList(),
    };
