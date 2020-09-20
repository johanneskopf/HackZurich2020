// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Discount _$DiscountFromJson(Map<String, dynamic> json) {
  return Discount()
    ..retailer = json['retailer'] == null
        ? null
        : DiscountRetailer.fromJson(json['retailer'] as Map<String, dynamic>)
    ..categories = json['categories'] as List
    ..discountEvents = json['discount_events'] as List
    ..id = json['id'] as String
    ..cmsId = json['cms_id'] as String
    ..channel = json['channel'] as String
    ..region = json['region'] as String
    ..year = json['year'] as int
    ..startDate = json['start_date'] as String
    ..endDate = json['end_date'] as String
    ..calendarWeek = json['calendar_week'] as String
    ..duration = json['duration'] as String
    ..durationDays = json['duration_days'] as int
    ..discountType = json['discount_type'] as String
    ..locationPlanningType = json['location_planning_type'] as String
    ..discountTypeId = json['discount_type_id'] as String
    ..reductionTypeId = json['reduction_type_id'] as String
    ..discountTypeLabel = json['discount_type_label'] as String
    ..specialAdvertisement = json['special_advertisement'] as bool
    ..advertisementTypeId = json['advertisement_type_id'] as String
    ..discountRegions = json['discount_regions'] as List
    ..referenceProductId = json['reference_product_id'] as String
    ..organisation = json['organisation'] as String
    ..cooperative = json['cooperative'] as String
    ..description = json['description'] as String
    ..discountHint = json['discount_hint'] as String
    ..fantasticPrice = json['fantastic_price'] as bool
    ..highPerformer = json['high_performer'] as bool
    ..collectiveDiscount = json['collective_discount'] as bool
    ..sellingUnit = json['selling_unit'] as String
    ..discountAmount = json['discount_amount'] as String
    ..savings = json['savings'] as String
    ..insteadOf = json['instead_of'] as String
    ..price = json['price'] as int
    ..originalPrice = json['original_price'] as int
    ..profit = json['profit'] as int
    ..disclaimer = json['disclaimer'] as String
    ..image = json['image'] == null
        ? null
        : DiscountImage.fromJson(json['image'] as Map<String, dynamic>)
    ..imageTransparent = json['image_transparent'] == null
        ? null
        : DiscountImageTransparent.fromJson(
            json['image_transparent'] as Map<String, dynamic>)
    ..secondaryImage = json['secondary_image'] == null
        ? null
        : SecondaryImage.fromJson(
            json['secondary_image'] as Map<String, dynamic>)
    ..additionalImages = json['additional_images'] as List
    ..logo = json['logo'] == null
        ? null
        : Logo.fromJson(json['logo'] as Map<String, dynamic>)
    ..secondaryLogo = json['secondary_logo'] == null
        ? null
        : SecondaryLogo.fromJson(json['secondary_logo'] as Map<String, dynamic>)
    ..newsletterImage = json['newsletter_image'] as String
    ..badge = json['badge'] == null
        ? null
        : Badge.fromJson(json['badge'] as Map<String, dynamic>)
    ..source = json['source'] as String
    ..bossNumber = json['boss_number'] as String
    ..publicationDate = json['publication_date'] as String
    ..discountRoleId = json['discount_role_id'] as String
    ..discountRoleLabel = json['discount_role_label'] as String
    ..visibility = json['visibility'] as String
    ..lastImported = json['last_imported'] as String
    ..lastMapped = json['last_mapped'] as String
    ..campaignIds = json['campaign_ids'] as List
    ..tags = json['tags'] as List;
}

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
      'retailer': instance.retailer,
      'categories': instance.categories,
      'discount_events': instance.discountEvents,
      'id': instance.id,
      'cms_id': instance.cmsId,
      'channel': instance.channel,
      'region': instance.region,
      'year': instance.year,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'calendar_week': instance.calendarWeek,
      'duration': instance.duration,
      'duration_days': instance.durationDays,
      'discount_type': instance.discountType,
      'location_planning_type': instance.locationPlanningType,
      'discount_type_id': instance.discountTypeId,
      'reduction_type_id': instance.reductionTypeId,
      'discount_type_label': instance.discountTypeLabel,
      'special_advertisement': instance.specialAdvertisement,
      'advertisement_type_id': instance.advertisementTypeId,
      'discount_regions': instance.discountRegions,
      'reference_product_id': instance.referenceProductId,
      'organisation': instance.organisation,
      'cooperative': instance.cooperative,
      'description': instance.description,
      'discount_hint': instance.discountHint,
      'fantastic_price': instance.fantasticPrice,
      'high_performer': instance.highPerformer,
      'collective_discount': instance.collectiveDiscount,
      'selling_unit': instance.sellingUnit,
      'discount_amount': instance.discountAmount,
      'savings': instance.savings,
      'instead_of': instance.insteadOf,
      'price': instance.price,
      'original_price': instance.originalPrice,
      'profit': instance.profit,
      'disclaimer': instance.disclaimer,
      'image': instance.image,
      'image_transparent': instance.imageTransparent,
      'secondary_image': instance.secondaryImage,
      'additional_images': instance.additionalImages,
      'logo': instance.logo,
      'secondary_logo': instance.secondaryLogo,
      'newsletter_image': instance.newsletterImage,
      'badge': instance.badge,
      'source': instance.source,
      'boss_number': instance.bossNumber,
      'publication_date': instance.publicationDate,
      'discount_role_id': instance.discountRoleId,
      'discount_role_label': instance.discountRoleLabel,
      'visibility': instance.visibility,
      'last_imported': instance.lastImported,
      'last_mapped': instance.lastMapped,
      'campaign_ids': instance.campaignIds,
      'tags': instance.tags,
    };

SecondaryImage _$SecondaryImageFromJson(Map<String, dynamic> json) {
  return SecondaryImage()
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

Map<String, dynamic> _$SecondaryImageToJson(SecondaryImage instance) =>
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

Logo _$LogoFromJson(Map<String, dynamic> json) {
  return Logo()
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

Map<String, dynamic> _$LogoToJson(Logo instance) => <String, dynamic>{
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

SecondaryLogo _$SecondaryLogoFromJson(Map<String, dynamic> json) {
  return SecondaryLogo()
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

Map<String, dynamic> _$SecondaryLogoToJson(SecondaryLogo instance) =>
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

Badge _$BadgeFromJson(Map<String, dynamic> json) {
  return Badge()
    ..original = json['original'] as String
    ..stack = json['stack'] as String
    ..custom = json['custom'] as String
    ..hdpiDetail = json['hdpi_detail'] as String
    ..hdpiList = json['hdpi_list'] as String
    ..hdpiSlider = json['hdpi_slider'] as String
    ..iosDetail = json['ios_detail'] as String
    ..iosList = json['ios_list'] as String
    ..iosSlider = json['ios_slider'] as String
    ..ios2xDetail = json['ios2x_detail'] as String
    ..ios2xList = json['ios2x_list'] as String
    ..ios2xSlider = json['ios2x_slider'] as String
    ..mdpiDetail = json['mdpi_detail'] as String
    ..mdpiList = json['mdpi_list'] as String
    ..mdpiSlider = json['mdpi_slider'] as String
    ..xhdpiDetail = json['xhdpi_detail'] as String
    ..xhdpiList = json['xhdpi_list'] as String
    ..xhdpiSlider = json['xhdpi_slider'] as String
    ..xxhdpiDetail = json['xxhdpi_detail'] as String
    ..xxhdpiList = json['xxhdpi_list'] as String
    ..xxhdpiSlider = json['xxhdpi_slider'] as String
    ..iosSlider2x = json['ios_slider2x'] as String;
}

Map<String, dynamic> _$BadgeToJson(Badge instance) => <String, dynamic>{
      'original': instance.original,
      'stack': instance.stack,
      'custom': instance.custom,
      'hdpi_detail': instance.hdpiDetail,
      'hdpi_list': instance.hdpiList,
      'hdpi_slider': instance.hdpiSlider,
      'ios_detail': instance.iosDetail,
      'ios_list': instance.iosList,
      'ios_slider': instance.iosSlider,
      'ios2x_detail': instance.ios2xDetail,
      'ios2x_list': instance.ios2xList,
      'ios2x_slider': instance.ios2xSlider,
      'mdpi_detail': instance.mdpiDetail,
      'mdpi_list': instance.mdpiList,
      'mdpi_slider': instance.mdpiSlider,
      'xhdpi_detail': instance.xhdpiDetail,
      'xhdpi_list': instance.xhdpiList,
      'xhdpi_slider': instance.xhdpiSlider,
      'xxhdpi_detail': instance.xxhdpiDetail,
      'xxhdpi_list': instance.xxhdpiList,
      'xxhdpi_slider': instance.xxhdpiSlider,
      'ios_slider2x': instance.iosSlider2x,
    };
