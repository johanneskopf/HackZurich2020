// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_size_ingredient_block_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeSizeIngredientBlockIngredient
    _$RecipeSizeIngredientBlockIngredientFromJson(Map<String, dynamic> json) {
  double _quantity = 0.0;
  RegExp exp = new RegExp(r"quantity=[0-9]+(\.[0-9]*)");
  Iterable<RegExpMatch> matches = exp.allMatches(json['amount']);
  if(matches.isNotEmpty)
    _quantity = num.tryParse(matches.first.group(0).replaceFirst("quantity=", ""))?.toDouble();
  return RecipeSizeIngredientBlockIngredient()
    ..id = json['id'] as String
    ..isMainIngredient = json['is_main_ingredient'] as bool
    ..text = json['text'] as String
    ..amount = json['amount'] as String
    ..quantity = _quantity
    ..availability = json['availability']
    ..cultivar = json['cultivar'] as String;
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
