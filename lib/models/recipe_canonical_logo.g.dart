// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_canonical_logo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeCanonicalLogo _$RecipeCanonicalLogoFromJson(Map<String, dynamic> json) {
  return RecipeCanonicalLogo()
    ..id = json['id'] as String
    ..modificationDate = json['modification_date'] as String
    ..hash = json['hash'] as String
    ..stack = json['stack'] as String;
}

Map<String, dynamic> _$RecipeCanonicalLogoToJson(
        RecipeCanonicalLogo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modification_date': instance.modificationDate,
      'hash': instance.hash,
      'stack': instance.stack,
    };
