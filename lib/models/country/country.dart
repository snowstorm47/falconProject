import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  @JsonKey(required: true, name: "country_code")
  final String countryCode;
  @JsonKey(required: true, name: "country_en")
  final String countryEn;
  @JsonKey(required: true, name: "phone_code")
  final int phoneCode;

  Country({
    required this.countryCode,
    required this.countryEn,
    required this.phoneCode,
  });

  factory Country.fromJson(Map<String, dynamic> country) =>
      _$CountryFromJson(country);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
