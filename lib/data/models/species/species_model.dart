import 'package:json_annotation/json_annotation.dart';
part 'species_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: true,
)
class SpeciesModel {
  SpeciesModel({
    required this.scientificName,
    required this.className,
    required this.category,
  });
  late final String scientificName;
  late final String className;
  late final String category;

  factory SpeciesModel.fromJson(Map<String, dynamic> json) =>
      _$SpeciesModelFromJson(json);
  Map<String, dynamic> toJson() => _$SpeciesModelToJson(this);
}
