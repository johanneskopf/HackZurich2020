import 'package:json_annotation/json_annotation.dart';
import 'discount_retailer.dart';
import 'discount_image.dart';
import 'discount_image_transparent.dart';

part 'discount.g.dart';

@JsonSerializable()
class Discount {
      Discount();

  DiscountRetailer retailer;
  List<dynamic> categories;
  @JsonKey(name: 'discount_events') List<dynamic> discountEvents;
  String id;
  @JsonKey(name: 'cms_id') String cmsId;
  String channel;
  String region;
  int year;
  @JsonKey(name: 'start_date') String startDate;
  @JsonKey(name: 'end_date') String endDate;
  @JsonKey(name: 'calendar_week') String calendarWeek;
  String duration;
  @JsonKey(name: 'duration_days') int durationDays;
  @JsonKey(name: 'discount_type') String discountType;
  @JsonKey(name: 'location_planning_type') String locationPlanningType;
  @JsonKey(name: 'discount_type_id') String discountTypeId;
  @JsonKey(name: 'reduction_type_id') String reductionTypeId;
  @JsonKey(name: 'discount_type_label') String discountTypeLabel;
  @JsonKey(name: 'special_advertisement') bool specialAdvertisement;
  @JsonKey(name: 'advertisement_type_id') String advertisementTypeId;
  @JsonKey(name: 'discount_regions') List<dynamic> discountRegions;
  @JsonKey(name: 'reference_product_id') String referenceProductId;
  String organisation;
  String cooperative;
  String description;
  @JsonKey(name: 'discount_hint') String discountHint;
  @JsonKey(name: 'fantastic_price') bool fantasticPrice;
  @JsonKey(name: 'high_performer') bool highPerformer;
  @JsonKey(name: 'collective_discount') bool collectiveDiscount;
  @JsonKey(name: 'selling_unit') String sellingUnit;
  @JsonKey(name: 'discount_amount') String discountAmount;
  String savings;
  @JsonKey(name: 'instead_of') String insteadOf;
  int price;
  @JsonKey(name: 'original_price') int originalPrice;
  int profit;
  String disclaimer;
  DiscountImage image;
  @JsonKey(name: 'image_transparent') DiscountImageTransparent imageTransparent;
  @JsonKey(name: 'secondary_image') SecondaryImage secondaryImage;
  @JsonKey(name: 'additional_images') List<dynamic> additionalImages;
  Logo logo;
  @JsonKey(name: 'secondary_logo') SecondaryLogo secondaryLogo;
  @JsonKey(name: 'newsletter_image') String newsletterImage;
  Badge badge;
  String source;
  @JsonKey(name: 'boss_number') String bossNumber;
  @JsonKey(name: 'publication_date') String publicationDate;
  @JsonKey(name: 'discount_role_id') String discountRoleId;
  @JsonKey(name: 'discount_role_label') String discountRoleLabel;
  String visibility;
  @JsonKey(name: 'last_imported') String lastImported;
  @JsonKey(name: 'last_mapped') String lastMapped;
  @JsonKey(name: 'campaign_ids') List<dynamic> campaignIds;
  List<dynamic> tags;

  factory Discount.fromJson(Map<String,dynamic> json) => _$DiscountFromJson(json);
  Map<String, dynamic> toJson() => _$DiscountToJson(this);
}

@JsonSerializable()
class SecondaryImage {
      SecondaryImage();

  String source;
  String code;
  String description;
  String original;
  String custom;
  String small;
  String medium;
  String large;
  String hash;
  List<dynamic> tags;
  String stack;

  factory SecondaryImage.fromJson(Map<String,dynamic> json) => _$SecondaryImageFromJson(json);
  Map<String, dynamic> toJson() => _$SecondaryImageToJson(this);
}

@JsonSerializable()
class Logo {
      Logo();

  String source;
  String code;
  String description;
  String original;
  String custom;
  String small;
  String medium;
  String large;
  String hash;
  List<dynamic> tags;
  String stack;

  factory Logo.fromJson(Map<String,dynamic> json) => _$LogoFromJson(json);
  Map<String, dynamic> toJson() => _$LogoToJson(this);
}

@JsonSerializable()
class SecondaryLogo {
      SecondaryLogo();

  String source;
  String code;
  String description;
  String original;
  String custom;
  String small;
  String medium;
  String large;
  String hash;
  List<dynamic> tags;
  String stack;

  factory SecondaryLogo.fromJson(Map<String,dynamic> json) => _$SecondaryLogoFromJson(json);
  Map<String, dynamic> toJson() => _$SecondaryLogoToJson(this);
}

@JsonSerializable()
class Badge {
      Badge();

  String original;
  String stack;
  String custom;
  @JsonKey(name: 'hdpi_detail') String hdpiDetail;
  @JsonKey(name: 'hdpi_list') String hdpiList;
  @JsonKey(name: 'hdpi_slider') String hdpiSlider;
  @JsonKey(name: 'ios_detail') String iosDetail;
  @JsonKey(name: 'ios_list') String iosList;
  @JsonKey(name: 'ios_slider') String iosSlider;
  @JsonKey(name: 'ios2x_detail') String ios2xDetail;
  @JsonKey(name: 'ios2x_list') String ios2xList;
  @JsonKey(name: 'ios2x_slider') String ios2xSlider;
  @JsonKey(name: 'mdpi_detail') String mdpiDetail;
  @JsonKey(name: 'mdpi_list') String mdpiList;
  @JsonKey(name: 'mdpi_slider') String mdpiSlider;
  @JsonKey(name: 'xhdpi_detail') String xhdpiDetail;
  @JsonKey(name: 'xhdpi_list') String xhdpiList;
  @JsonKey(name: 'xhdpi_slider') String xhdpiSlider;
  @JsonKey(name: 'xxhdpi_detail') String xxhdpiDetail;
  @JsonKey(name: 'xxhdpi_list') String xxhdpiList;
  @JsonKey(name: 'xxhdpi_slider') String xxhdpiSlider;
  @JsonKey(name: 'ios_slider2x') String iosSlider2x;

  factory Badge.fromJson(Map<String,dynamic> json) => _$BadgeFromJson(json);
  Map<String, dynamic> toJson() => _$BadgeToJson(this);
}
