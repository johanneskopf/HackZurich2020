import 'package:json_annotation/json_annotation.dart';


part 'recipe_canonical_logo.g.dart';

@JsonSerializable()
class RecipeCanonicalLogo {
      RecipeCanonicalLogo();

  String id;
  @JsonKey(name: 'modification_date') String modificationDate;
  String hash;
  String stack;

  factory RecipeCanonicalLogo.fromJson(Map<String,dynamic> json) => _$RecipeCanonicalLogoFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeCanonicalLogoToJson(this);
}
