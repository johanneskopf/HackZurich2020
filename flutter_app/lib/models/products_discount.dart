import 'package:json_annotation/json_annotation.dart';


part 'products_discount.g.dart';

@JsonSerializable()
class ProductsDiscount {
      ProductsDiscount();

  String name;
  List<dynamic> terms;

  factory ProductsDiscount.fromJson(Map<String,dynamic> json) => _$ProductsDiscountFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsDiscountToJson(this);
}
