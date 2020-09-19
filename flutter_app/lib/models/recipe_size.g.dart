// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_size.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeSize _$RecipeSizeFromJson(Map<String, dynamic> json) {
  return RecipeSize()
    ..text = json['text'] as String
    ..textFull = json['text_full'] as String
    ..unit = json['unit'] as String
    ..unitSingular = json['unit_singular'] as String
    ..quantity = json['quantity'] as int
    ..baseUnit = json['base_unit'] as List
    ..ingredientBlocks = (json['ingredient_blocks'] as List)
        ?.map((e) => e == null
            ? null
            : RecipeSizeIngredientBlock.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RecipeSizeToJson(RecipeSize instance) =>
    <String, dynamic>{
      'text': instance.text,
      'text_full': instance.textFull,
      'unit': instance.unit,
      'unit_singular': instance.unitSingular,
      'quantity': instance.quantity,
      'base_unit': instance.baseUnit,
      'ingredient_blocks': instance.ingredientBlocks,
    };
