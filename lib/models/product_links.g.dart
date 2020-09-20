// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductLinks _$ProductLinksFromJson(Map<String, dynamic> json) {
  return ProductLinks()
    ..migrosCh = json['migros_ch'] == null
        ? null
        : MigrosCh.fromJson(json['migros_ch'] as Map<String, dynamic>)
    ..migipedia = json['migipedia'] == null
        ? null
        : Migipedia.fromJson(json['migipedia'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ProductLinksToJson(ProductLinks instance) =>
    <String, dynamic>{
      'migros_ch': instance.migrosCh,
      'migipedia': instance.migipedia,
    };

MigrosCh _$MigrosChFromJson(Map<String, dynamic> json) {
  return MigrosCh()
    ..url = json['url'] as String
    ..name = json['name'] as String
    ..canonical = json['canonical'] as String
    ..type = json['type'] as String
    ..purchasable = json['purchasable'] as bool;
}

Map<String, dynamic> _$MigrosChToJson(MigrosCh instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'canonical': instance.canonical,
      'type': instance.type,
      'purchasable': instance.purchasable,
    };

Migipedia _$MigipediaFromJson(Map<String, dynamic> json) {
  return Migipedia()
    ..url = json['url'] as String
    ..name = json['name'] as String
    ..canonical = json['canonical'] as String
    ..type = json['type'] as String
    ..purchasable = json['purchasable'] as bool;
}

Map<String, dynamic> _$MigipediaToJson(Migipedia instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'canonical': instance.canonical,
      'type': instance.type,
      'purchasable': instance.purchasable,
    };
