import 'package:json_annotation/json_annotation.dart';
import 'recipe_ingredient_amount.dart';

part 'recipe_size_ingredient_block_ingredient.g.dart';

@JsonSerializable()
class RecipeSizeIngredientBlockIngredient {
      RecipeSizeIngredientBlockIngredient();

  String id;
  @JsonKey(name: 'is_main_ingredient') bool isMainIngredient;
  String text;
  RecipeIngredientAmount amount;
  Availability availability;
  Cultivar cultivar;

  factory RecipeSizeIngredientBlockIngredient.fromJson(Map<String,dynamic> json) => _$RecipeSizeIngredientBlockIngredientFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeSizeIngredientBlockIngredientToJson(this);
}

@JsonSerializable()
class Availability {
      Availability();

  String key;
  String name;

  factory Availability.fromJson(Map<String,dynamic> json) => _$AvailabilityFromJson(json);
  Map<String, dynamic> toJson() => _$AvailabilityToJson(this);
}

@JsonSerializable()
class Cultivar {
      Cultivar();

  String id;
  String name;

  factory Cultivar.fromJson(Map<String,dynamic> json) => _$CultivarFromJson(json);
  Map<String, dynamic> toJson() => _$CultivarToJson(this);
}
