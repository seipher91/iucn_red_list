import 'package:dartz/dartz.dart';
import 'package:iucn_red_list/data/failure.dart';
import 'package:iucn_red_list/domain/entities/species.dart';

abstract class ISpeciesRepository {
  Future<Either<Failure, List<Species>>> getSpeciesPerRegion(String region);
  Future<Either<Failure, Species>> getConservationMeasures(
      Species species, String region);
}
