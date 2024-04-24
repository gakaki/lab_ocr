import 'package:json_annotation/json_annotation.dart';
part 'small_category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SmallCategoryModel {
  int id;
  String type;
  bool isSelect;
  String name;

  SmallCategoryModel({
    this.id = 0,
    this.type = '',
    this.name='',
    this.isSelect=false
  });

  factory SmallCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SmallCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SmallCategoryModelToJson(this);
}
