import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:iucn_red_list/data/failure.dart';
import 'package:iucn_red_list/domain/entities/species.dart';
import 'package:iucn_red_list/domain/repositories/i_species_repository.dart';

@LazySingleton()
class GetSpeciesUsecase {
  final ISpeciesRepository repository;

  GetSpeciesUsecase(this.repository);

  Future<Either<Failure, List<Species>>> execute(String region) =>
      repository.getSpeciesPerRegion(region);
}
