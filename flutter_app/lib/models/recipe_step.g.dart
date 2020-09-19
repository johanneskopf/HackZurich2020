// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeStep _$RecipeStepFromJson(Map<String, dynamic> json) {
  return RecipeStep()
    ..title = json['title']
    ..description = json['description'] as String
    ..video = json['video']
    ..image = json['image'];
}

Map<String, dynamic> _$RecipeStepToJson(RecipeStep instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'video': instance.video,
      'image': instance.image,
    };
