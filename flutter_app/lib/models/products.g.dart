// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) {
  return Products()
    ..totalHits = json['total_hits'] as int
    ..facets = json['facets'] == null
        ? null
        : Facets.fromJson(json['facets'] as Map<String, dynamic>)
    ..products = (json['products'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'total_hits': instance.totalHits,
      'facets': instance.facets,
      'products': instance.products,
    };

Facets _$FacetsFromJson(Map<String, dynamic> json) {
  return Facets()
    ..purchasableOnline = json['purchasable_online'] == null
        ? null
        : PurchasableOnline.fromJson(
            json['purchasable_online'] as Map<String, dynamic>)
    ..retailer = json['retailer']
    ..discount = json['discount']
    ..label = json['label'] == null
        ? null
        : Label.fromJson(json['label'] as Map<String, dynamic>)
    ..brand = json['brand'];
}

Map<String, dynamic> _$FacetsToJson(Facets instance) => <String, dynamic>{
      'purchasable_online': instance.purchasableOnline,
      'retailer': instance.retailer,
      'discount': instance.discount,
      'label': instance.label,
      'brand': instance.brand,
    };

PurchasableOnline _$PurchasableOnlineFromJson(Map<String, dynamic> json) {
  return PurchasableOnline()
    ..name = json['name'] as String
    ..terms = json['terms'] as List;
}

Map<String, dynamic> _$PurchasableOnlineToJson(PurchasableOnline instance) =>
    <String, dynamic>{
      'name': instance.name,
      'terms': instance.terms,
    };

Label _$LabelFromJson(Map<String, dynamic> json) {
  return Label()
    ..name = json['name'] as String
    ..terms = json['terms'] as List;
}

Map<String, dynamic> _$LabelToJson(Label instance) => <String, dynamic>{
      'name': instance.name,
      'terms': instance.terms,
    };
