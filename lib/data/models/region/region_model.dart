import 'package:json_annotation/json_annotation.dart';
part 'region_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: true,
)
class RegionModel {
  RegionModel({
    required this.name,
    required this.identifier,
  });
  late final String name;
  late final String identifier;

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegionModelToJson(this);
}
