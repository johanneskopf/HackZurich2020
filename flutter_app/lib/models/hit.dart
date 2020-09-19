import 'package:json_annotation/json_annotation.dart';
import 'recipe.dart';

part 'hit.g.dart';

@JsonSerializable()
class Hit {
      Hit();

  @JsonKey(name: '_index') String index;
  @JsonKey(name: '_type') String type;
  @JsonKey(name: '_id') String id;
  @JsonKey(name: '_score') double score;
  @JsonKey(name: '_source') Recipe source;

  factory Hit.fromJson(Map<String,dynamic> json) => _$HitFromJson(json);
  Map<String, dynamic> toJson() => _$HitToJson(this);
}
