import 'package:json_annotation/json_annotation.dart';


part 'recipe_ingredient.g.dart';

@JsonSerializable()
class RecipeIngredient {
      RecipeIngredient();

  int id;
  List<dynamic> synonyms;
  Name name;
  String modified;
  @JsonKey(name: 'family_ids') List<dynamic> familyIds;

  factory RecipeIngredient.fromJson(Map<String,dynamic> json) => _$RecipeIngredientFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeIngredientToJson(this);
}

@JsonSerializable()
class Name {
      Name();

  String singular;
  String plural;

  factory Name.fromJson(Map<String,dynamic> json) => _$NameFromJson(json);
  Map<String, dynamic> toJson() => _$NameToJson(this);
}
