import 'package:iucn_red_list/data/models/species/species_model.dart';
import 'package:iucn_red_list/domain/entities/species.dart';
import 'package:json_annotation/json_annotation.dart';
part 'species_response_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: true,
)
class SpeciesResponseModel {
  SpeciesResponseModel({
    required this.count,
    required this.result,
  });
  late final int count;
  late final List<SpeciesModel> result;

  factory SpeciesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SpeciesResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$SpeciesResponseModelToJson(this);

  List<Species> toEntity() {
    return [
      ...result.map((e) => Species(
          className: e.className,
          scientificName: e.scientificName,
          category: e.category))
    ];
  }
}
