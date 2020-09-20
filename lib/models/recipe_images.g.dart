// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeImages _$RecipeImagesFromJson(Map<String, dynamic> json) {
  return RecipeImages()
    ..id = json['id'] as String
    ..hash = json['hash'] as String
    ..title = json['title'] as String
    ..altText = json['alt_text'] as String
    ..order = json['order'] as int
    ..modificationDate = json['modification_date'] as String
    ..ratios = (json['ratios'] as List)
        ?.map((e) => e == null
            ? null
            : RecipeImagesRatio.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RecipeImagesToJson(RecipeImages instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hash': instance.hash,
      'title': instance.title,
      'alt_text': instance.altText,
      'order': instance.order,
      'modification_date': instance.modificationDate,
      'ratios': instance.ratios,
    };
