import 'package:equatable/equatable.dart';

class Region extends Equatable {
  Region({
    required this.name,
    required this.identifier,
  });
  late final String name;
  late final String identifier;

  Region copyWith({String? name, String? identifier}) => Region(
      identifier: identifier ?? this.identifier, name: name ?? this.name);

  @override
  List<Object?> get props => [
        name,
        identifier,
      ];
}
