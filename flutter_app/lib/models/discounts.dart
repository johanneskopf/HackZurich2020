import 'package:json_annotation/json_annotation.dart';
import 'discount.dart';
import 'discounts_facets.dart';

part 'discounts.g.dart';

@JsonSerializable()
class Discounts {
      Discounts();

  List<Discount> discounts;
  DiscountsFacets facets;
  @JsonKey(name: 'total_hits') int totalHits;
  List<dynamic> ids;

  factory Discounts.fromJson(Map<String,dynamic> json) => _$DiscountsFromJson(json);
  Map<String, dynamic> toJson() => _$DiscountsToJson(this);
}
