import 'package:json_annotation/json_annotation.dart';
import 'product_label_image.dart';

part 'product_label.g.dart';

@JsonSerializable()
class ProductLabel {
      ProductLabel();

  String id;
  String name;
  String slug;
  ProductLabelImage image;

  factory ProductLabel.fromJson(Map<String,dynamic> json) => _$ProductLabelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductLabelToJson(this);
}
