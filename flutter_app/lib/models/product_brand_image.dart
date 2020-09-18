import 'package:json_annotation/json_annotation.dart';


part 'product_brand_image.g.dart';

@JsonSerializable()
class ProductBrandImage {
      ProductBrandImage();

  String original;
  String stack;

  factory ProductBrandImage.fromJson(Map<String,dynamic> json) => _$ProductBrandImageFromJson(json);
  Map<String, dynamic> toJson() => _$ProductBrandImageToJson(this);
}
