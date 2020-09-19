// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_ingredient_amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeIngredientAmount _$RecipeIngredientAmountFromJson(
    Map<String, dynamic> json) {
  return RecipeIngredientAmount()
    ..isApproximate = json['is_approximate'] as bool
    ..quantity = (json['quantity'] as num)?.toDouble()
    ..quantityUpTo = json['quantity_up_to']
    ..text = json['text'] as String
    ..unit = json['unit'] as String;
}

Map<String, dynamic> _$RecipeIngredientAmountToJson(
        RecipeIngredientAmount instance) =>
    <String, dynamic>{
      'is_approximate': instance.isApproximate,
      'quantity': instance.quantity,
      'quantity_up_to': instance.quantityUpTo,
      'text': instance.text,
      'unit': instance.unit,
    };
