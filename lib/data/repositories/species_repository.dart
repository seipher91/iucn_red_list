import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:iucn_red_list/data/datasource/species_remote_datasource.dart';
import 'package:iucn_red_list/data/failure.dart';
import 'package:iucn_red_list/data/models/species/species_response_model.dart';
import 'package:iucn_red_list/domain/entities/species.dart';
import 'package:iucn_red_list/domain/repositories/i_species_repository.dart';

@LazySingleton(as: ISpeciesRepository)
class SpeciesRepository implements ISpeciesRepository {
  final ISpeciesRemoteDatasource remoteDatasource;

  SpeciesRepository(this.remoteDatasource);
  @override
  Future<Either<Failure, List<Species>>> getSpeciesPerRegion(
      String region) async {
    try {
      SpeciesResponseModel model =
          await remoteDatasource.getSpeciesPerRegion(region);
      return Right(model.toEntity());
    } catch (e) {
      return const Left(ServerFailure('Errore ottenimento specie per regione'));
    }
  }
}
