import 'package:json_annotation/json_annotation.dart';
import 'recipe_size_ingredient_block_ingredient.dart';

part 'recipe_size_ingredient_block.g.dart';

@JsonSerializable()
class RecipeSizeIngredientBlock {
      RecipeSizeIngredientBlock();

  dynamic title;
  List<RecipeSizeIngredientBlockIngredient> ingredients;

  factory RecipeSizeIngredientBlock.fromJson(Map<String,dynamic> json) => _$RecipeSizeIngredientBlockFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeSizeIngredientBlockToJson(this);
}
