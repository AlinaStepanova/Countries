import 'package:json_annotation/json_annotation.dart';
part 'language.g.dart';

@JsonSerializable()
class Language {
  Language(this.name);

  String name;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}
