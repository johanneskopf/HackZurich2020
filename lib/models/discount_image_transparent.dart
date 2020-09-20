import 'package:json_annotation/json_annotation.dart';


part 'discount_image_transparent.g.dart';

@JsonSerializable()
class DiscountImageTransparent {
      DiscountImageTransparent();

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

  factory DiscountImageTransparent.fromJson(Map<String,dynamic> json) => _$DiscountImageTransparentFromJson(json);
  Map<String, dynamic> toJson() => _$DiscountImageTransparentToJson(this);
}
