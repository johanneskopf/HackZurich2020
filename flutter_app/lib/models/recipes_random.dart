import 'package:json_annotation/json_annotation.dart';

import 'hit.dart';


part 'recipes_random.g.dart';

@JsonSerializable()
class RecipesRandom {
      RecipesRandom();

  int took;
  @JsonKey(name: 'timed_out') bool timedOut;
  @JsonKey(name: '_shards') Shards shards;
  Hits hits;

  factory RecipesRandom.fromJson(Map<String,dynamic> json) => _$RecipesRandomFromJson(json);
  Map<String, dynamic> toJson() => _$RecipesRandomToJson(this);
}

@JsonSerializable()
class Shards {
      Shards();

  int total;
  int successful;
  int skipped;
  int failed;

  factory Shards.fromJson(Map<String,dynamic> json) => _$ShardsFromJson(json);
  Map<String, dynamic> toJson() => _$ShardsToJson(this);
}

@JsonSerializable()
class Hits {
      Hits();

  Total total;
  @JsonKey(name: 'max_score') double maxScore;
  List<Hit> hits;

  factory Hits.fromJson(Map<String,dynamic> json) => _$HitsFromJson(json);
  Map<String, dynamic> toJson() => _$HitsToJson(this);
}

@JsonSerializable()
class Total {
      Total();

  int value;
  String relation;

  factory Total.fromJson(Map<String,dynamic> json) => _$TotalFromJson(json);
  Map<String, dynamic> toJson() => _$TotalToJson(this);
}
