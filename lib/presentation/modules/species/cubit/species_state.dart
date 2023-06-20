part of 'species_cubit.dart';

abstract class SpeciesState extends Equatable {
  final List<Species> species;
  final String region;
  final bool isFiltered;

  const SpeciesState(
      [this.species = const [], this.region = '', this.isFiltered = false]);

  @override
  List<Object?> get props => [species, region, isFiltered];
}

class SpeciesInit extends SpeciesState {
  const SpeciesInit() : super();
}

class SpeciesLoading extends SpeciesState {
  const SpeciesLoading(
      [List<Species> species = const [],
      String region = '',
      bool isFiltered = false])
      : super(species, region, isFiltered);
}

class SpeciesLoaded extends SpeciesState {
  const SpeciesLoaded(
      [List<Species> species = const [],
      String region = '',
      bool isFiltered = false])
      : super(species, region, isFiltered);
}

class SpeciesError extends SpeciesState {
  final String message;
  const SpeciesError(this.message,
      [List<Species> species = const [],
      String region = '',
      bool isFiltered = false])
      : super(species, region, isFiltered);
}
