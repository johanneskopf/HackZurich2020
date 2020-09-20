// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_random.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipesRandom _$RecipesRandomFromJson(Map<String, dynamic> json) {
  return RecipesRandom()
    ..took = json['took'] as int
    ..timedOut = json['timed_out'] as bool
    ..shards = json['_shards'] == null
        ? null
        : Shards.fromJson(json['_shards'] as Map<String, dynamic>)
    ..hits = json['hits'] == null
        ? null
        : Hits.fromJson(json['hits'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RecipesRandomToJson(RecipesRandom instance) =>
    <String, dynamic>{
      'took': instance.took,
      'timed_out': instance.timedOut,
      '_shards': instance.shards,
      'hits': instance.hits,
    };

Shards _$ShardsFromJson(Map<String, dynamic> json) {
  return Shards()
    ..total = json['total'] as int
    ..successful = json['successful'] as int
    ..skipped = json['skipped'] as int
    ..failed = json['failed'] as int;
}

Map<String, dynamic> _$ShardsToJson(Shards instance) => <String, dynamic>{
      'total': instance.total,
      'successful': instance.successful,
      'skipped': instance.skipped,
      'failed': instance.failed,
    };

Hits _$HitsFromJson(Map<String, dynamic> json) {
  return Hits()
    ..total = json['total'] == null
        ? null
        : Total.fromJson(json['total'] as Map<String, dynamic>)
    ..maxScore = (json['max_score'] as num)?.toDouble()
    // ..hits = json['hits'] as List;
    ..hits = List<Hit>.from((json['hits'] as List).map((h) => Hit.fromJson(h)));
}

Map<String, dynamic> _$HitsToJson(Hits instance) => <String, dynamic>{
      'total': instance.total,
      'max_score': instance.maxScore,
      'hits': instance.hits,
    };

Total _$TotalFromJson(Map<String, dynamic> json) {
  return Total()
    ..value = json['value'] as int
    ..relation = json['relation'] as String;
}

Map<String, dynamic> _$TotalToJson(Total instance) => <String, dynamic>{
      'value': instance.value,
      'relation': instance.relation,
    };
