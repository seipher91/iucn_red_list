// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conservation_measures_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConservationMeasuresResponseModel _$ConservationMeasuresResponseModelFromJson(
        Map<String, dynamic> json) =>
    ConservationMeasuresResponseModel(
      json['name'] as String,
      json['region_identifier'] as String,
      (json['result'] as List<dynamic>)
          .map((e) =>
              ConservationMeasuresModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConservationMeasuresResponseModelToJson(
        ConservationMeasuresResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region_identifier': instance.regionIdentifier,
      'result': instance.result.map((e) => e.toJson()).toList(),
    };
