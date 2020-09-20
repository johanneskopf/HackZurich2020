import 'package:json_annotation/json_annotation.dart';


part 'discount_retailer.g.dart';

@JsonSerializable()
class DiscountRetailer {
      DiscountRetailer();

  String id;
  String name;

  factory DiscountRetailer.fromJson(Map<String,dynamic> json) => _$DiscountRetailerFromJson(json);
  Map<String, dynamic> toJson() => _$DiscountRetailerToJson(this);
}
