// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_label.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductLabel _$ProductLabelFromJson(Map<String, dynamic> json) {
  return ProductLabel()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..slug = json['slug'] as String
    ..image = json['image'] == null
        ? null
        : ProductLabelImage.fromJson(json['image'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ProductLabelToJson(ProductLabel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
    };
