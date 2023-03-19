// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['country_code', 'country_en', 'phone_code'],
  );
  return Country(
    countryCode: json['country_code'] as String,
    countryEn: json['country_en'] as String,
    phoneCode: json['phone_code'] as int,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'country_code': instance.countryCode,
      'country_en': instance.countryEn,
      'phone_code': instance.phoneCode,
    };
