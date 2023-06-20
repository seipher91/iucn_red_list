import 'package:json_annotation/json_annotation.dart';
part 'species_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: true,
)
class SpeciesModel {
  SpeciesModel({
    required this.scientific_name,
    required this.class_name,
  });
  late final String scientific_name;
  late final String class_name;

  factory SpeciesModel.fromJson(Map<String, dynamic> json) =>
      _$SpeciesModelFromJson(json);
  Map<String, dynamic> toJson() => _$SpeciesModelToJson(this);
}
