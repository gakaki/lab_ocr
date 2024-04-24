import 'package:get_demo/shop_category/model/small_category_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'big_category_model.g.dart';

class BigCategoryModelList {
  List<BigCategoryModel> list;
  BigCategoryModelList(this.list);
  factory BigCategoryModelList.fromJson(List<dynamic> list) {
    return BigCategoryModelList(
      list.map((item) => BigCategoryModel.fromJson(item)).toList(),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class BigCategoryModel {
  int id;
  String type;
  String name;
  String isRotation;
  List<SmallCategoryModel> children;

  BigCategoryModel({
    this.id = 0,
    this.type = '',
    this.isRotation = '',
    this.name='',
    this.children = const [],
  });

  factory BigCategoryModel.fromJson(Map<String, dynamic> json) => _$BigCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$BigCategoryModelToJson(this);
}


