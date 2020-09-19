// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_size_ingredient_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeSizeIngredientBlock _$RecipeSizeIngredientBlockFromJson(
    Map<String, dynamic> json) {
  return RecipeSizeIngredientBlock()
    ..title = json['title']
    ..ingredients = (json['ingredients'] as List)
        ?.map((e) => e == null
            ? null
            : RecipeSizeIngredientBlockIngredient.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RecipeSizeIngredientBlockToJson(
        RecipeSizeIngredientBlock instance) =>
    <String, dynamic>{
      'title': instance.title,
      'ingredients': instance.ingredients,
    };
