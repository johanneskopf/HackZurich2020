// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product()
    ..id = json['id'] as String
    ..language = json['language'] as String
    ..name = json['name'] as String
    ..slug = json['slug'] as String
    ..bossNumber = json['boss_number'] as String
    ..description = json['description'] == null
        ? null
        : Description.fromJson(json['description'] as Map<String, dynamic>)
    ..tags = json['tags'] as List
    ..isVariant = json['is_variant'] as bool
    ..gtins = json['gtins'] as List
    ..brand = json['brand'] == null
        ? null
        : ProductBrand.fromJson(json['brand'] as Map<String, dynamic>)
    ..labels = (json['labels'] as List)
        ?.map((e) =>
            e == null ? null : ProductLabel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..categories = json['categories'] as List
    ..additionalCategories = json['additional_categories'] as List
    ..features = json['features'] as List
    ..image = json['image'] == null
        ? null
        : Image1.fromJson(json['image'] as Map<String, dynamic>)
    ..imageTransparent = json['image_transparent'] == null
        ? null
        : ImageTransparent.fromJson(
            json['image_transparent'] as Map<String, dynamic>)
    ..internalFeatures = json['internal_features'] as List
    ..vat = json['vat'] == null
        ? null
        : Vat.fromJson(json['vat'] as Map<String, dynamic>)
    ..links = json['links'] == null
        ? null
        : ProductLinks.fromJson(json['links'] as Map<String, dynamic>)
    ..updatedAt = json['updated_at'] as String
    ..receiptText = json['receipt_text'] as String
    ..price = json['price'] == null
        ? null
        : Price.fromJson(json['price'] as Map<String, dynamic>)
    ..retailer = json['retailer'] == null
        ? null
        : Retailer.fromJson(json['retailer'] as Map<String, dynamic>)
    ..ratings = json['ratings'] == null
        ? null
        : Ratings.fromJson(json['ratings'] as Map<String, dynamic>)
    ..allergenText = json['allergen_text'] as String
    ..reindexDate = json['reindex_date'] as String;
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'language': instance.language,
      'name': instance.name,
      'slug': instance.slug,
      'boss_number': instance.bossNumber,
      'description': instance.description,
      'tags': instance.tags,
      'is_variant': instance.isVariant,
      'gtins': instance.gtins,
      'brand': instance.brand,
      'labels': instance.labels,
      'categories': instance.categories,
      'additional_categories': instance.additionalCategories,
      'features': instance.features,
      'image': instance.image,
      'image_transparent': instance.imageTransparent,
      'internal_features': instance.internalFeatures,
      'vat': instance.vat,
      'links': instance.links,
      'updated_at': instance.updatedAt,
      'receipt_text': instance.receiptText,
      'price': instance.price,
      'retailer': instance.retailer,
      'ratings': instance.ratings,
      'allergen_text': instance.allergenText,
      'reindex_date': instance.reindexDate,
    };

Description _$DescriptionFromJson(Map<String, dynamic> json) {
  return Description()
    ..text = json['text'] as String
    ..source = json['source'] as String;
}

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'text': instance.text,
      'source': instance.source,
    };

Image1 _$Image1FromJson(Map<String, dynamic> json) {
  return Image1()
    ..original = json['original'] as String
    ..stack = json['stack'] as String;
}

Map<String, dynamic> _$Image1ToJson(Image1 instance) => <String, dynamic>{
      'original': instance.original,
      'stack': instance.stack,
    };

ImageTransparent _$ImageTransparentFromJson(Map<String, dynamic> json) {
  return ImageTransparent()
    ..original = json['original'] as String
    ..stack = json['stack'] as String;
}

Map<String, dynamic> _$ImageTransparentToJson(ImageTransparent instance) =>
    <String, dynamic>{
      'original': instance.original,
      'stack': instance.stack,
    };

Vat _$VatFromJson(Map<String, dynamic> json) {
  return Vat()
    ..id = json['id'] as int
    ..percentage = (json['percentage'] as num)?.toDouble();
}

Map<String, dynamic> _$VatToJson(Vat instance) => <String, dynamic>{
      'id': instance.id,
      'percentage': instance.percentage,
    };

Price _$PriceFromJson(Map<String, dynamic> json) {
  return Price()
    ..validFrom = json['valid_from'] as String
    ..validTo = json['valid_to'] as String
    ..currency = json['currency'] as String
    ..source = json['source'] as String
    ..item = json['item'] == null
        ? null
        : Item.fromJson(json['item'] as Map<String, dynamic>)
    ..base = json['base'] == null
        ? null
        : Base.fromJson(json['base'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'valid_from': instance.validFrom,
      'valid_to': instance.validTo,
      'currency': instance.currency,
      'source': instance.source,
      'item': instance.item,
      'base': instance.base,
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item()
    ..price = (json['price'] as num)?.toDouble()
    ..quantity = json['quantity'] as int
    ..unit = json['unit'] as String
    ..varyingQuantity = json['varying_quantity'] as bool
    ..displayQuantity = json['display_quantity'] as String;
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'price': instance.price,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'varying_quantity': instance.varyingQuantity,
      'display_quantity': instance.displayQuantity,
    };

Base _$BaseFromJson(Map<String, dynamic> json) {
  return Base()
    ..price = (json['price'] as num)?.toDouble()
    ..quantity = json['quantity'] as int
    ..unit = json['unit'] as String;
}

Map<String, dynamic> _$BaseToJson(Base instance) => <String, dynamic>{
      'price': instance.price,
      'quantity': instance.quantity,
      'unit': instance.unit,
    };

Retailer _$RetailerFromJson(Map<String, dynamic> json) {
  return Retailer()
    ..id = json['id'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$RetailerToJson(Retailer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Ratings _$RatingsFromJson(Map<String, dynamic> json) {
  return Ratings()
    ..countAll = json['count_all'] as int
    ..averageAll = (json['average_all'] as num)?.toDouble();
}

Map<String, dynamic> _$RatingsToJson(Ratings instance) => <String, dynamic>{
      'count_all': instance.countAll,
      'average_all': instance.averageAll,
    };
