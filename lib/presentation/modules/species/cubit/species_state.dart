part of 'species_cubit.dart';

abstract class SpeciesState extends Equatable {
  final List<Species> species;
  final String region;

  const SpeciesState([this.species = const [], this.region = '']);

  @override
  List<Object?> get props => [species, region];
}

class SpeciesInit extends SpeciesState {
  SpeciesInit() : super();
}

class SpeciesLoading extends SpeciesState {
  const SpeciesLoading([List<Species> species = const []]) : super(species);
}

class SpeciesLoaded extends SpeciesState {
  const SpeciesLoaded([List<Species> species = const [], String region = ''])
      : super(species, region);
}

class SpeciesError extends SpeciesState {
  final String message;
  const SpeciesError(this.message,
      [List<Species> species = const [], String region = ''])
      : super(species, region);
}
