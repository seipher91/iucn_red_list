import 'package:equatable/equatable.dart';

class Species extends Equatable {
  Species({
    required this.scientificName,
    required this.className,
  });
  late final String scientificName;
  late final String className;

  Species copyWith({String? scientificName, String? className}) => Species(
      className: className ?? this.className,
      scientificName: scientificName ?? this.scientificName);

  @override
  List<Object?> get props => [
        scientificName,
        className,
      ];
}
