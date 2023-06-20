// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeciesModel _$SpeciesModelFromJson(Map<String, dynamic> json) => SpeciesModel(
      scientificName: json['scientific_name'] as String,
      className: json['class_name'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$SpeciesModelToJson(SpeciesModel instance) =>
    <String, dynamic>{
      'scientific_name': instance.scientificName,
      'class_name': instance.className,
      'category': instance.category,
    };
