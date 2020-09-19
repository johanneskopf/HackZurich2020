// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_image_transparent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscountImageTransparent _$DiscountImageTransparentFromJson(
    Map<String, dynamic> json) {
  return DiscountImageTransparent()
    ..source = json['source'] as String
    ..code = json['code'] as String
    ..description = json['description'] as String
    ..original = json['original'] as String
    ..custom = json['custom'] as String
    ..small = json['small'] as String
    ..medium = json['medium'] as String
    ..large = json['large'] as String
    ..hash = json['hash'] as String
    ..tags = json['tags'] as List
    ..stack = json['stack'] as String;
}

Map<String, dynamic> _$DiscountImageTransparentToJson(
        DiscountImageTransparent instance) =>
    <String, dynamic>{
      'source': instance.source,
      'code': instance.code,
      'description': instance.description,
      'original': instance.original,
      'custom': instance.custom,
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
      'hash': instance.hash,
      'tags': instance.tags,
      'stack': instance.stack,
    };
