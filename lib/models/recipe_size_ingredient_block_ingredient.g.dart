// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_size_ingredient_block_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeSizeIngredientBlockIngredient
    _$RecipeSizeIngredientBlockIngredientFromJson(Map<String, dynamic> json) {
  return RecipeSizeIngredientBlockIngredient()
    ..id = json['id'] as String
    ..isMainIngredient = json['is_main_ingredient'] as bool
    ..text = json['text'] as String
    ..amount = json['amount'] == null
        ? null
        : RecipeIngredientAmount.fromJson(
            json['amount'] as Map<String, dynamic>)
    ..availability = json['availability'] == null
        ? null
        : Availability.fromJson(json['availability'] as Map<String, dynamic>)
    ..cultivar = json['cultivar'] == null
        ? null
        : Cultivar.fromJson(json['cultivar'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RecipeSizeIngredientBlockIngredientToJson(
        RecipeSizeIngredientBlockIngredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_main_ingredient': instance.isMainIngredient,
      'text': instance.text,
      'amount': instance.amount,
      'availability': instance.availability,
      'cultivar': instance.cultivar,
    };

Availability _$AvailabilityFromJson(Map<String, dynamic> json) {
  return Availability()
    ..key = json['key'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$AvailabilityToJson(Availability instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };

Cultivar _$CultivarFromJson(Map<String, dynamic> json) {
  return Cultivar()
    ..id = json['id'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$CultivarToJson(Cultivar instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
