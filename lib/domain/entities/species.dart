import 'package:equatable/equatable.dart';

class Species extends Equatable {
  Species({
    required this.scientificName,
    required this.className,
    required this.category,
  });
  late final String scientificName;
  late final String className;
  late final String category;

  Species copyWith(
          {String? scientificName, String? className, String? category}) =>
      Species(
        className: className ?? this.className,
        scientificName: scientificName ?? this.scientificName,
        category: category ?? this.category,
      );

  @override
  List<Object?> get props => [
        scientificName,
        className,
        category,
      ];
}
