import 'package:json_annotation/json_annotation.dart';


part 'recipe_images_ratio.g.dart';

@JsonSerializable()
class RecipeImagesRatio {
      RecipeImagesRatio();

  String ratio;
  String stack;

  factory RecipeImagesRatio.fromJson(Map<String,dynamic> json) => _$RecipeImagesRatioFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeImagesRatioToJson(this);
}
