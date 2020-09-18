import 'package:json_annotation/json_annotation.dart';


part 'product_label_image.g.dart';

@JsonSerializable()
class ProductLabelImage {
      ProductLabelImage();

  String original;
  String stack;

  factory ProductLabelImage.fromJson(Map<String,dynamic> json) => _$ProductLabelImageFromJson(json);
  Map<String, dynamic> toJson() => _$ProductLabelImageToJson(this);
}
