import 'package:json_annotation/json_annotation.dart';
import 'recipe_images_ratio.dart';

part 'recipe_images.g.dart';

@JsonSerializable()
class RecipeImages {
      RecipeImages();

  String id;
  String hash;
  String title;
  @JsonKey(name: 'alt_text') String altText;
  int order;
  @JsonKey(name: 'modification_date') String modificationDate;
  List<RecipeImagesRatio> ratios;

  factory RecipeImages.fromJson(Map<String,dynamic> json) => _$RecipeImagesFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeImagesToJson(this);
}
