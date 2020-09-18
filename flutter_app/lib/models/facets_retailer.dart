import 'package:json_annotation/json_annotation.dart';


part 'facets_retailer.g.dart';

@JsonSerializable()
class FacetsRetailer {
      FacetsRetailer();

  String name;
  List<dynamic> terms;

  factory FacetsRetailer.fromJson(Map<String,dynamic> json) => _$FacetsRetailerFromJson(json);
  Map<String, dynamic> toJson() => _$FacetsRetailerToJson(this);
}
