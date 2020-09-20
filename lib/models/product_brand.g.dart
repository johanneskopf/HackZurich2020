// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductBrand _$ProductBrandFromJson(Map<String, dynamic> json) {
  return ProductBrand()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..slug = json['slug'] as String
    ..links = json['links'] == null
        ? null
        : Links.fromJson(json['links'] as Map<String, dynamic>)
    ..image = json['image'] == null
        ? null
        : ProductBrandImage.fromJson(json['image'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ProductBrandToJson(ProductBrand instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'links': instance.links,
      'image': instance.image,
    };

Links _$LinksFromJson(Map<String, dynamic> json) {
  return Links()
    ..homepage = json['homepage'] == null
        ? null
        : Homepage.fromJson(json['homepage'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'homepage': instance.homepage,
    };

Homepage _$HomepageFromJson(Map<String, dynamic> json) {
  return Homepage()
    ..url = json['url'] as String
    ..name = json['name'] as String
    ..type = json['type'] as String
    ..purchasable = json['purchasable'] as bool;
}

Map<String, dynamic> _$HomepageToJson(Homepage instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'type': instance.type,
      'purchasable': instance.purchasable,
    };
