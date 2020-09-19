// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeIngredient _$RecipeIngredientFromJson(Map<String, dynamic> json) {
  return RecipeIngredient()
    ..id = json['id'] as int
    ..synonyms = json['synonyms'] as List
    ..name = json['name'] == null
        ? null
        : Name.fromJson(json['name'] as Map<String, dynamic>)
    ..modified = json['modified'] as String
    ..familyIds = json['family_ids'] as List;
}

Map<String, dynamic> _$RecipeIngredientToJson(RecipeIngredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'synonyms': instance.synonyms,
      'name': instance.name,
      'modified': instance.modified,
      'family_ids': instance.familyIds,
    };

Name _$NameFromJson(Map<String, dynamic> json) {
  return Name()
    ..singular = json['singular'] as String
    ..plural = json['plural'] as String;
}

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'singular': instance.singular,
      'plural': instance.plural,
    };
