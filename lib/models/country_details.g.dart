// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryDetails _$CountryDetailsFromJson(Map<String, dynamic> json) =>
    CountryDetails(
      json['name'] as String,
      json['code'] as String,
      json['emoji'] as String,
      json['currency'] as String,
      json['capital'] as String,
    );

Map<String, dynamic> _$CountryDetailsToJson(CountryDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'emoji': instance.emoji,
      'currency': instance.currency,
      'capital': instance.capital,
    };
