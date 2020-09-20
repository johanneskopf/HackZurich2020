// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discounts_facets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscountsFacets _$DiscountsFacetsFromJson(Map<String, dynamic> json) {
  return DiscountsFacets()
    ..additionalProp1 = json['additionalProp1'] == null
        ? null
        : AdditionalProp1.fromJson(
            json['additionalProp1'] as Map<String, dynamic>)
    ..additionalProp2 = json['additionalProp2'] == null
        ? null
        : AdditionalProp2.fromJson(
            json['additionalProp2'] as Map<String, dynamic>)
    ..additionalProp3 = json['additionalProp3'] == null
        ? null
        : AdditionalProp3.fromJson(
            json['additionalProp3'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DiscountsFacetsToJson(DiscountsFacets instance) =>
    <String, dynamic>{
      'additionalProp1': instance.additionalProp1,
      'additionalProp2': instance.additionalProp2,
      'additionalProp3': instance.additionalProp3,
    };

AdditionalProp1 _$AdditionalProp1FromJson(Map<String, dynamic> json) {
  return AdditionalProp1()
    ..name = json['name'] as String
    ..terms = json['terms'] as List;
}

Map<String, dynamic> _$AdditionalProp1ToJson(AdditionalProp1 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'terms': instance.terms,
    };

AdditionalProp2 _$AdditionalProp2FromJson(Map<String, dynamic> json) {
  return AdditionalProp2()
    ..name = json['name'] as String
    ..terms = json['terms'] as List;
}

Map<String, dynamic> _$AdditionalProp2ToJson(AdditionalProp2 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'terms': instance.terms,
    };

AdditionalProp3 _$AdditionalProp3FromJson(Map<String, dynamic> json) {
  return AdditionalProp3()
    ..name = json['name'] as String
    ..terms = json['terms'] as List;
}

Map<String, dynamic> _$AdditionalProp3ToJson(AdditionalProp3 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'terms': instance.terms,
    };
