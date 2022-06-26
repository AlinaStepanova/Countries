import 'package:countries/models/continent.dart';
import 'package:countries/models/language.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_details.g.dart';

@JsonSerializable()
class CountryDetails {
  CountryDetails(this.name, this.code, this.emoji, this.currency, this.capital,
      this.languages, this.continent);

  String name;
  String code;
  String emoji;
  String currency;
  String capital;
  List<Language> languages;
  Continent continent;

  factory CountryDetails.fromJson(Map<String, dynamic> json) =>
      _$CountryDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDetailsToJson(this);
}
