import 'package:json_annotation/json_annotation.dart';


part 'recipe_size_ingredient_block_ingredient.g.dart';

@JsonSerializable()
class RecipeSizeIngredientBlockIngredient {
      RecipeSizeIngredientBlockIngredient();

  String id;
  @JsonKey(name: 'is_main_ingredient') bool isMainIngredient;
  String text;
  String amount;
  double quantity;
  dynamic availability;
  String cultivar;

  factory RecipeSizeIngredientBlockIngredient.fromJson(Map<String,dynamic> json) => _$RecipeSizeIngredientBlockIngredientFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeSizeIngredientBlockIngredientToJson(this);
}
