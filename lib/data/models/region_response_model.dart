import 'package:iucn_red_list/data/models/region_model.dart';
import 'package:iucn_red_list/domain/entities/region.dart';
import 'package:json_annotation/json_annotation.dart';
part 'region_response_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: true,
)
class RegionResponseModel {
  RegionResponseModel({
    required this.count,
    required this.results,
  });
  late final int count;
  late final List<RegionModel> results;

  factory RegionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegionResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegionResponseModelToJson(this);

  List<Region> toEntity() {
    return [
      ...results.map((e) => Region(name: e.name, identifier: e.identifier))
    ];
  }
}
