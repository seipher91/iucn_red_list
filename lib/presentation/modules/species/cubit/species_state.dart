part of 'species_cubit.dart';

abstract class SpeciesState extends Equatable {
  final List<Species> species;
  final String region;
  final String selectedFilter;

  const SpeciesState(
      [this.species = const [], this.region = '', this.selectedFilter = 'ALL']);

  @override
  List<Object?> get props => [species, region, selectedFilter];
}

class SpeciesInit extends SpeciesState {
  const SpeciesInit() : super();
}

class SpeciesLoading extends SpeciesState {
  const SpeciesLoading(
      [List<Species> species = const [],
      String region = '',
      String selectedFilter = 'ALL'])
      : super(species, region, selectedFilter);
}

class SpeciesLoaded extends SpeciesState {
  const SpeciesLoaded(
      [List<Species> species = const [],
      String region = '',
      String selectedFilter = 'ALL'])
      : super(species, region, selectedFilter);
}

class SpeciesError extends SpeciesState {
  final String message;
  const SpeciesError(this.message,
      [List<Species> species = const [],
      String region = '',
      String selectedFilter = 'ALL'])
      : super(species, region, selectedFilter);
}
