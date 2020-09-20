import 'package:json_annotation/json_annotation.dart';


part 'facets_brand.g.dart';

@JsonSerializable()
class FacetsBrand {
      FacetsBrand();

  String name;
  List<dynamic> terms;

  factory FacetsBrand.fromJson(Map<String,dynamic> json) => _$FacetsBrandFromJson(json);
  Map<String, dynamic> toJson() => _$FacetsBrandToJson(this);
}
