import 'package:flutter_app/models/recipe_canonical_logo.dart';
import 'package:json_annotation/json_annotation.dart';


part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
      Recipe();

  List<dynamic> taxonomies;
  @JsonKey(name: 'taxonomy_groups') List<dynamic> taxonomyGroups;
  String id;
  String language;
  String title;
  @JsonKey(name: 'original_title') dynamic originalTitle;
  String teasertext;
  String slug;
  @JsonKey(name: 'base_unit') List<dynamic> baseUnit;
  List<dynamic> durations;
  @JsonKey(name: 'duration_total') String durationTotal;
  @JsonKey(name: 'duration_total_in_minutes') int durationTotalInMinutes;
  @JsonKey(name: 'has_video') bool hasVideo;
  List<dynamic> hints;
  Nutrients nutrients;
  List<dynamic> steps;
  List<dynamic> ingredients;
  @JsonKey(name: 'ingredient_families') List<dynamic> ingredientFamilies;
  List<dynamic> tags;
  List<dynamic> utilities;
  dynamic video;
  @JsonKey(name: 'scaling_hint') dynamic scalingHint;
  Canonical canonical;
  List<dynamic> images;
  List<dynamic> urls;
  String created;
  String modified;
  String published;
  List<dynamic> sizes;
  @JsonKey(name: 'available_sizes') List<dynamic> availableSizes;
  @JsonKey(name: 'related_recipes') List<dynamic> relatedRecipes;
  @JsonKey(name: 'all_seasons') bool allSeasons;
  Rating rating;

  factory Recipe.fromJson(Map<String,dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}

@JsonSerializable()
class Nutrients {
      Nutrients();

  int calories;
  int carbohydrates;
  @JsonKey(name: 'carbohydrates_percent') double carbohydratesPercent;
  int fat;
  @JsonKey(name: 'fat_percent') double fatPercent;
  int kilojoule;
  int proteins;
  @JsonKey(name: 'proteins_percent') double proteinsPercent;

  factory Nutrients.fromJson(Map<String,dynamic> json) => _$NutrientsFromJson(json);
  Map<String, dynamic> toJson() => _$NutrientsToJson(this);
}

@JsonSerializable()
class Canonical {
      Canonical();

  String master;
  String url;
  RecipeCanonicalLogo logo;

  factory Canonical.fromJson(Map<String,dynamic> json) => _$CanonicalFromJson(json);
  Map<String, dynamic> toJson() => _$CanonicalToJson(this);
}

@JsonSerializable()
class Rating {
      Rating();

  int count;
  dynamic average;
  dynamic rounded;

  factory Rating.fromJson(Map<String,dynamic> json) => _$RatingFromJson(json);
  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
