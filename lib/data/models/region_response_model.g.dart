// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionResponseModel _$RegionResponseModelFromJson(Map<String, dynamic> json) =>
    RegionResponseModel(
      count: json['count'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => RegionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegionResponseModelToJson(
        RegionResponseModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
