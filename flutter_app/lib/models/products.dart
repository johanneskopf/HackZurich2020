import 'package:flutter_app/models/products_discount.dart';
import 'package:json_annotation/json_annotation.dart';
import 'facets_brand.dart';
import 'facets_retailer.dart';
import 'product.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
      Products();

  @JsonKey(name: 'total_hits') int totalHits;
  Facets facets;
  List<Product> products;

  factory Products.fromJson(Map<String,dynamic> json) => _$ProductsFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}

@JsonSerializable()
class Facets {
      Facets();

  @JsonKey(name: 'purchasable_online') PurchasableOnline purchasableOnline;
  FacetsRetailer retailer;
  ProductsDiscount discount;
  Label label;
  FacetsBrand brand;

  factory Facets.fromJson(Map<String,dynamic> json) => _$FacetsFromJson(json);
  Map<String, dynamic> toJson() => _$FacetsToJson(this);
}

@JsonSerializable()
class PurchasableOnline {
      PurchasableOnline();

  String name;
  List<dynamic> terms;

  factory PurchasableOnline.fromJson(Map<String,dynamic> json) => _$PurchasableOnlineFromJson(json);
  Map<String, dynamic> toJson() => _$PurchasableOnlineToJson(this);
}

@JsonSerializable()
class Label {
      Label();

  String name;
  List<dynamic> terms;

  factory Label.fromJson(Map<String,dynamic> json) => _$LabelFromJson(json);
  Map<String, dynamic> toJson() => _$LabelToJson(this);
}
