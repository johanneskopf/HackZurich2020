// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hit _$HitFromJson(Map<String, dynamic> json) {
  return Hit()
    ..index = json['_index'] as String
    ..type = json['_type'] as String
    ..id = json['_id'] as String
    ..score = (json['_score'] as num)?.toDouble()
    ..source = json['_source'] == null
        ? null
        : Recipe.fromJson(json['_source'] as Map<String, dynamic>);
}

Map<String, dynamic> _$HitToJson(Hit instance) => <String, dynamic>{
      '_index': instance.index,
      '_type': instance.type,
      '_id': instance.id,
      '_score': instance.score,
      '_source': instance.source,
    };
