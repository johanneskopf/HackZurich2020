// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe()
    ..taxonomies = json['taxonomies'] as List
    ..taxonomyGroups = json['taxonomy_groups'] as List
    ..id = json['id'] as String
    ..language = json['language'] as String
    ..title = json['title'] as String
    ..originalTitle = json['original_title']
    ..teasertext = json['teasertext'] as String
    ..slug = json['slug'] as String
    ..baseUnit = json['base_unit'] as List
    ..durations = json['durations'] as List
    ..durationTotal = json['duration_total'] as String
    ..durationTotalInMinutes = json['duration_total_in_minutes'] as int
    ..hasVideo = json['has_video'] as bool
    ..hints = json['hints'] as List
    ..nutrients = json['nutrients'] == null
        ? null
        : Nutrients.fromJson(json['nutrients'] as Map<String, dynamic>)
    ..steps = (json['steps'] as List)
        ?.map((e) =>
            e == null ? null : RecipeStep.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..ingredients = (json['ingredients'] as List)
        ?.map((e) => e == null
            ? null
            : RecipeIngredient.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..ingredientFamilies = json['ingredient_families'] as List
    ..tags = (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..utilities = json['utilities'] as List
    ..video = json['video']
    ..scalingHint = json['scaling_hint']
    ..canonical = json['canonical'] == null
        ? null
        : Canonical.fromJson(json['canonical'] as Map<String, dynamic>)
    ..images = (json['images'] as List)
        ?.map((e) =>
            e == null ? null : RecipeImages.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..urls = json['urls'] as List
    ..created = json['created'] as String
    ..modified = json['modified'] as String
    ..published = json['published'] as String
    ..sizes = json['sizes'] as List
    ..availableSizes = json['available_sizes'] as List
    ..relatedRecipes = json['related_recipes'] as List
    ..allSeasons = json['all_seasons'] as bool
    ..rating = json['rating'] == null
        ? null
        : Rating.fromJson(json['rating'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'taxonomies': instance.taxonomies,
      'taxonomy_groups': instance.taxonomyGroups,
      'id': instance.id,
      'language': instance.language,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'teasertext': instance.teasertext,
      'slug': instance.slug,
      'base_unit': instance.baseUnit,
      'durations': instance.durations,
      'duration_total': instance.durationTotal,
      'duration_total_in_minutes': instance.durationTotalInMinutes,
      'has_video': instance.hasVideo,
      'hints': instance.hints,
      'nutrients': instance.nutrients,
      'steps': instance.steps,
      'ingredients': instance.ingredients,
      'ingredient_families': instance.ingredientFamilies,
      'tags': instance.tags,
      'utilities': instance.utilities,
      'video': instance.video,
      'scaling_hint': instance.scalingHint,
      'canonical': instance.canonical,
      'images': instance.images,
      'urls': instance.urls,
      'created': instance.created,
      'modified': instance.modified,
      'published': instance.published,
      'sizes': instance.sizes,
      'available_sizes': instance.availableSizes,
      'related_recipes': instance.relatedRecipes,
      'all_seasons': instance.allSeasons,
      'rating': instance.rating,
    };

Nutrients _$NutrientsFromJson(Map<String, dynamic> json) {
  return Nutrients()
    ..calories = json['calories'] as int
    ..carbohydrates = json['carbohydrates'] as int
    ..carbohydratesPercent = (json['carbohydrates_percent'] as num)?.toDouble()
    ..fat = json['fat'] as int
    ..fatPercent = (json['fat_percent'] as num)?.toDouble()
    ..kilojoule = json['kilojoule'] as int
    ..proteins = json['proteins'] as int
    ..proteinsPercent = (json['proteins_percent'] as num)?.toDouble();
}

Map<String, dynamic> _$NutrientsToJson(Nutrients instance) => <String, dynamic>{
      'calories': instance.calories,
      'carbohydrates': instance.carbohydrates,
      'carbohydrates_percent': instance.carbohydratesPercent,
      'fat': instance.fat,
      'fat_percent': instance.fatPercent,
      'kilojoule': instance.kilojoule,
      'proteins': instance.proteins,
      'proteins_percent': instance.proteinsPercent,
    };

Canonical _$CanonicalFromJson(Map<String, dynamic> json) {
  return Canonical()
    ..master = json['master'] as String
    ..url = json['url'] as String
    // ..logo = json['logo'];
  ..logo = RecipeCanonicalLogo.fromJson(json['logo']);
}

Map<String, dynamic> _$CanonicalToJson(Canonical instance) => <String, dynamic>{
      'master': instance.master,
      'url': instance.url,
      'logo': instance.logo,
    };

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return Rating()
    ..count = json['count'] as int
    ..average = json['average']
    ..rounded = json['rounded'];
}

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'count': instance.count,
      'average': instance.average,
      'rounded': instance.rounded,
    };
