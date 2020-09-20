import 'package:json_annotation/json_annotation.dart';
import 'product_brand_image.dart';

part 'product_brand.g.dart';

@JsonSerializable()
class ProductBrand {
      ProductBrand();

  String id;
  String name;
  String slug;
  Links links;
  ProductBrandImage image;

  factory ProductBrand.fromJson(Map<String,dynamic> json) => _$ProductBrandFromJson(json);
  Map<String, dynamic> toJson() => _$ProductBrandToJson(this);
}

@JsonSerializable()
class Links {
      Links();

  Homepage homepage;

  factory Links.fromJson(Map<String,dynamic> json) => _$LinksFromJson(json);
  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class Homepage {
      Homepage();

  String url;
  String name;
  String type;
  bool purchasable;

  factory Homepage.fromJson(Map<String,dynamic> json) => _$HomepageFromJson(json);
  Map<String, dynamic> toJson() => _$HomepageToJson(this);
}
