// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeciesResponseModel _$SpeciesResponseModelFromJson(
        Map<String, dynamic> json) =>
    SpeciesResponseModel(
      count: json['count'] as int,
      result: (json['result'] as List<dynamic>)
          .map((e) => SpeciesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpeciesResponseModelToJson(
        SpeciesResponseModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'result': instance.result.map((e) => e.toJson()).toList(),
    };
