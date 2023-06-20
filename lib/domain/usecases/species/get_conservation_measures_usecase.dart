import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:iucn_red_list/data/failure.dart';
import 'package:iucn_red_list/domain/entities/species.dart';
import 'package:iucn_red_list/domain/repositories/i_species_repository.dart';

@LazySingleton()
class GetConservationMeasuresUsecase {
  final ISpeciesRepository repository;

  GetConservationMeasuresUsecase(this.repository);

  Future<Either<Failure, Species>> execute(Species species, String region) =>
      repository.getConservationMeasures(species, region);
}
