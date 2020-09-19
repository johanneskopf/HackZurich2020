import 'package:json_annotation/json_annotation.dart';
import 'recipe_size_ingredient_block.dart';

part 'recipe_size.g.dart';

@JsonSerializable()
class RecipeSize {
      RecipeSize();

  String text;
  @JsonKey(name: 'text_full') String textFull;
  String unit;
  @JsonKey(name: 'unit_singular') String unitSingular;
  int quantity;
  @JsonKey(name: 'base_unit') List<dynamic> baseUnit;
  @JsonKey(name: 'ingredient_blocks') List<RecipeSizeIngredientBlock> ingredientBlocks;

  factory RecipeSize.fromJson(Map<String,dynamic> json) => _$RecipeSizeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeSizeToJson(this);
}
