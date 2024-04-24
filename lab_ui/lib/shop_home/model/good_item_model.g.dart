// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'good_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodItemModel _$GoodItemModelFromJson(Map<String, dynamic> json) =>
    GoodItemModel(
      imageUrl: json['imageUrl'] as String? ?? '',
      content: json['content'] as String? ?? '',
      goodsPrice: json['goodsPrice'] as int? ?? 0,
      goodsName: json['goodsName'] as String? ?? '',
      monthSales: json['monthSales'] as int? ?? 0,
      cartNumber: json['cartNumber'] as int? ?? 0,
      coverPicUrl: json['coverPicUrl'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      spec: json['spec'] as String? ?? '',
      weight: (json['weight'] as num?)?.toDouble() ?? 0,
      description: json['description'] as String? ?? '',
      picUrls: (json['picUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isSelectCart: json['isSelectCart'] as bool? ?? false,
    );

Map<String, dynamic> _$GoodItemModelToJson(GoodItemModel instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'content': instance.content,
      'goodsPrice': instance.goodsPrice,
      'goodsName': instance.goodsName,
      'monthSales': instance.monthSales,
      'cartNumber': instance.cartNumber,
      'isSelectCart': instance.isSelectCart,
      'coverPicUrl': instance.coverPicUrl,
      'price': instance.price,
      'spec': instance.spec,
      'weight': instance.weight,
      'description': instance.description,
      'picUrls': instance.picUrls,
    };
