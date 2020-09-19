// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsDiscount _$ProductsDiscountFromJson(Map<String, dynamic> json) {
  return ProductsDiscount()
    ..name = json['name'] as String
    ..terms = json['terms'] as List;
}

Map<String, dynamic> _$ProductsDiscountToJson(ProductsDiscount instance) =>
    <String, dynamic>{
      'name': instance.name,
      'terms': instance.terms,
    };
