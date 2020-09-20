// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discounts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Discounts _$DiscountsFromJson(Map<String, dynamic> json) {
  return Discounts()
    ..discounts = (json['discounts'] as List)
        ?.map((e) =>
            e == null ? null : Discount.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..facets = json['facets'] == null
        ? null
        : DiscountsFacets.fromJson(json['facets'] as Map<String, dynamic>)
    ..totalHits = json['total_hits'] as int
    ..ids = json['ids'] as List;
}

Map<String, dynamic> _$DiscountsToJson(Discounts instance) => <String, dynamic>{
      'discounts': instance.discounts,
      'facets': instance.facets,
      'total_hits': instance.totalHits,
      'ids': instance.ids,
    };
