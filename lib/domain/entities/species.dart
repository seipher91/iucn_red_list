import 'package:equatable/equatable.dart';

class Species extends Equatable {
  Species({
    required this.scientificName,
    required this.className,
    required this.category,
    this.conservationMeasures,
  });
  late final String scientificName;
  late final String className;
  late final String category;
  late final String? conservationMeasures;

  Species copyWith(
          {String? scientificName,
          String? className,
          String? category,
          String? conservationMeasures}) =>
      Species(
        className: className ?? this.className,
        scientificName: scientificName ?? this.scientificName,
        category: category ?? this.category,
        conservationMeasures: conservationMeasures ?? this.conservationMeasures,
      );

  @override
  List<Object?> get props => [
        scientificName,
        className,
        category,
        conservationMeasures,
      ];
}
