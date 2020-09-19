import 'package:json_annotation/json_annotation.dart';
import 'product_brand.dart';
import 'product_label.dart';
import 'product_links.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
      Product();

  String id;
  String language;
  String name;
  String slug;
  @JsonKey(name: 'boss_number') String bossNumber;
  Description description;
  List<dynamic> tags;
  @JsonKey(name: 'is_variant') bool isVariant;
  List<dynamic> gtins;
  ProductBrand brand;
  List<ProductLabel> labels;
  List<dynamic> categories;
  @JsonKey(name: 'additional_categories') List<dynamic> additionalCategories;
  List<dynamic> features;
  Image1 image;
  @JsonKey(name: 'image_transparent') ImageTransparent imageTransparent;
  @JsonKey(name: 'internal_features') List<dynamic> internalFeatures;
  Vat vat;
  ProductLinks links;
  @JsonKey(name: 'updated_at') String updatedAt;
  @JsonKey(name: 'receipt_text') String receiptText;
  Price price;
  Retailer retailer;
  Ratings ratings;
  @JsonKey(name: 'allergen_text') String allergenText;
  @JsonKey(name: 'reindex_date') String reindexDate;

  factory Product.fromJson(Map<String,dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Description {
      Description();

  String text;
  String source;

  factory Description.fromJson(Map<String,dynamic> json) => _$DescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}

@JsonSerializable()
class Image1 {
      Image1();

  String original;
  String stack;

  factory Image1.fromJson(Map<String,dynamic> json) => _$Image1FromJson(json);
  Map<String, dynamic> toJson() => _$Image1ToJson(this);
}

@JsonSerializable()
class ImageTransparent {
      ImageTransparent();

  String original;
  String stack;

  factory ImageTransparent.fromJson(Map<String,dynamic> json) => _$ImageTransparentFromJson(json);
  Map<String, dynamic> toJson() => _$ImageTransparentToJson(this);
}

@JsonSerializable()
class Vat {
      Vat();

  int id;
  double percentage;

  factory Vat.fromJson(Map<String,dynamic> json) => _$VatFromJson(json);
  Map<String, dynamic> toJson() => _$VatToJson(this);
}

@JsonSerializable()
class Price {
      Price();

  @JsonKey(name: 'valid_from') String validFrom;
  @JsonKey(name: 'valid_to') String validTo;
  String currency;
  String source;
  Item item;
  Base base;

  factory Price.fromJson(Map<String,dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}

@JsonSerializable()
class Item {
      Item();

  double price;
  int quantity;
  String unit;
  @JsonKey(name: 'varying_quantity') bool varyingQuantity;
  @JsonKey(name: 'display_quantity') String displayQuantity;

  factory Item.fromJson(Map<String,dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class Base {
      Base();

  double price;
  int quantity;
  String unit;

  factory Base.fromJson(Map<String,dynamic> json) => _$BaseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseToJson(this);
}

@JsonSerializable()
class Retailer {
      Retailer();

  String id;
  String name;

  factory Retailer.fromJson(Map<String,dynamic> json) => _$RetailerFromJson(json);
  Map<String, dynamic> toJson() => _$RetailerToJson(this);
}

@JsonSerializable()
class Ratings {
      Ratings();

  @JsonKey(name: 'count_all') int countAll;
  @JsonKey(name: 'average_all') double averageAll;

  factory Ratings.fromJson(Map<String,dynamic> json) => _$RatingsFromJson(json);
  Map<String, dynamic> toJson() => _$RatingsToJson(this);
}
