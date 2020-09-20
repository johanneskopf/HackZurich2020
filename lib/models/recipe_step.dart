import 'package:json_annotation/json_annotation.dart';


part 'recipe_step.g.dart';

@JsonSerializable()
class RecipeStep {
      RecipeStep();

  String title;
  String description;
  dynamic video;
  dynamic image;

  factory RecipeStep.fromJson(Map<String,dynamic> json) => _$RecipeStepFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeStepToJson(this);
}
