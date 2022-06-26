import 'package:json_annotation/json_annotation.dart';
part 'continent.g.dart';

@JsonSerializable()
class Continent {
  Continent(this.name);

  String name;

  factory Continent.fromJson(Map<String, dynamic> json) =>
      _$ContinentFromJson(json);

  Map<String, dynamic> toJson() => _$ContinentToJson(this);
}
