import 'package:json_annotation/json_annotation.dart';


part 'image_discount.g.dart';

@JsonSerializable()
class ImageDiscount {
      ImageDiscount();

  String source;
  String code;
  String description;
  String original;
  String custom;
  String small;
  String medium;
  String large;
  String hash;
  List<dynamic> tags;
  String stack;

  factory ImageDiscount.fromJson(Map<String,dynamic> json) => _$ImageDiscountFromJson(json);
  Map<String, dynamic> toJson() => _$ImageDiscountToJson(this);
}
