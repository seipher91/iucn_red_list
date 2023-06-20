import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conservation_measures_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: true,
)
class ConservationMeasuresModel extends Equatable {
  final String code;
  final String title;

  ConservationMeasuresModel(this.code, this.title);

  factory ConservationMeasuresModel.fromJson(Map<String, dynamic> json) =>
      _$ConservationMeasuresModelFromJson(json);
  Map<String, dynamic> toJson() => _$ConservationMeasuresModelToJson(this);

  @override
  List<Object?> get props => [
        code,
        title,
      ];
}
