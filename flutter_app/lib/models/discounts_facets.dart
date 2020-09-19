import 'package:json_annotation/json_annotation.dart';


part 'discounts_facets.g.dart';

@JsonSerializable()
class DiscountsFacets {
      DiscountsFacets();

  AdditionalProp1 additionalProp1;
  AdditionalProp2 additionalProp2;
  AdditionalProp3 additionalProp3;

  factory DiscountsFacets.fromJson(Map<String,dynamic> json) => _$DiscountsFacetsFromJson(json);
  Map<String, dynamic> toJson() => _$DiscountsFacetsToJson(this);
}

@JsonSerializable()
class AdditionalProp1 {
      AdditionalProp1();

  String name;
  List<dynamic> terms;

  factory AdditionalProp1.fromJson(Map<String,dynamic> json) => _$AdditionalProp1FromJson(json);
  Map<String, dynamic> toJson() => _$AdditionalProp1ToJson(this);
}

@JsonSerializable()
class AdditionalProp2 {
      AdditionalProp2();

  String name;
  List<dynamic> terms;

  factory AdditionalProp2.fromJson(Map<String,dynamic> json) => _$AdditionalProp2FromJson(json);
  Map<String, dynamic> toJson() => _$AdditionalProp2ToJson(this);
}

@JsonSerializable()
class AdditionalProp3 {
      AdditionalProp3();

  String name;
  List<dynamic> terms;

  factory AdditionalProp3.fromJson(Map<String,dynamic> json) => _$AdditionalProp3FromJson(json);
  Map<String, dynamic> toJson() => _$AdditionalProp3ToJson(this);
}
