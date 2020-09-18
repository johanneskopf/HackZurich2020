import 'package:json_annotation/json_annotation.dart';


part 'product_links.g.dart';

@JsonSerializable()
class ProductLinks {
      ProductLinks();

  @JsonKey(name: 'migros_ch') MigrosCh migrosCh;
  Migipedia migipedia;

  factory ProductLinks.fromJson(Map<String,dynamic> json) => _$ProductLinksFromJson(json);
  Map<String, dynamic> toJson() => _$ProductLinksToJson(this);
}

@JsonSerializable()
class MigrosCh {
      MigrosCh();

  String url;
  String name;
  String canonical;
  String type;
  bool purchasable;

  factory MigrosCh.fromJson(Map<String,dynamic> json) => _$MigrosChFromJson(json);
  Map<String, dynamic> toJson() => _$MigrosChToJson(this);
}

@JsonSerializable()
class Migipedia {
      Migipedia();

  String url;
  String name;
  String canonical;
  String type;
  bool purchasable;

  factory Migipedia.fromJson(Map<String,dynamic> json) => _$MigipediaFromJson(json);
  Map<String, dynamic> toJson() => _$MigipediaToJson(this);
}
