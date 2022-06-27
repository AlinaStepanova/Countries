import 'package:json_annotation/json_annotation.dart';
part 'state.g.dart';

@JsonSerializable()
class State {
  State(this.name);

  String name;

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  Map<String, dynamic> toJson() => _$StateToJson(this);
}
