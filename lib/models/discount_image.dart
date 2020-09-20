import 'package:json_annotation/json_annotation.dart';


part 'discount_image.g.dart';

@JsonSerializable()
class DiscountImage {
      DiscountImage();

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

  factory DiscountImage.fromJson(Map<String,dynamic> json) => _$DiscountImageFromJson(json);
  Map<String, dynamic> toJson() => _$DiscountImageToJson(this);
}
