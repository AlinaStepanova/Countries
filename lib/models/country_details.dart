import 'package:json_annotation/json_annotation.dart';

part 'country_details.g.dart';

@JsonSerializable()
class CountryDetails {
  CountryDetails(this.name, this.code, this.emoji, this.currency, this.capital);

  String name;
  String code;
  String emoji;
  String currency;
  String capital;

  factory CountryDetails.fromJson(Map<String, dynamic> json) =>
      _$CountryDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDetailsToJson(this);
}
