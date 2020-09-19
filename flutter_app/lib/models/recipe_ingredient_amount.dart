import 'package:json_annotation/json_annotation.dart';


part 'recipe_ingredient_amount.g.dart';

@JsonSerializable()
class RecipeIngredientAmount {
      RecipeIngredientAmount();

  @JsonKey(name: 'is_approximate') bool isApproximate;
  int quantity;
  @JsonKey(name: 'quantity_up_to') dynamic quantityUpTo;
  String text;
  String unit;

  factory RecipeIngredientAmount.fromJson(Map<String,dynamic> json) => _$RecipeIngredientAmountFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeIngredientAmountToJson(this);
}
