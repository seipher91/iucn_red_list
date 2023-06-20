import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:iucn_red_list/data/models/species/conservation_measures_model.dart';

part 'conservation_measures_response_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: true,
)
class ConservationMeasuresResponseModel extends Equatable {
  final String name;
  final String regionIdentifier;
  final List<ConservationMeasuresModel> result;

  ConservationMeasuresResponseModel(
      this.name, this.regionIdentifier, this.result);

  factory ConservationMeasuresResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$ConservationMeasuresResponseModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ConservationMeasuresResponseModelToJson(this);

  @override
  List<Object?> get props => [
        name,
        regionIdentifier,
        result,
      ];
}
