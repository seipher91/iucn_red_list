import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:iucn_red_list/data/datasource/species_remote_datasource.dart';
import 'package:iucn_red_list/data/failure.dart';
import 'package:iucn_red_list/data/models/species/conservation_measures_model.dart';
import 'package:iucn_red_list/data/models/species/conservation_measures_response_model.dart';
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

  @override
  Future<Either<Failure, Species>> getConservationMeasures(
      Species species, String region) async {
    try {
      ConservationMeasuresResponseModel model = await remoteDatasource
          .getConservationMeasures(region, species.scientificName);
      String measures = "No conservation measures";
      if (model.result.isNotEmpty) {
        measures = model.result.elementAt(0).title;
        for (var i = 1; i < model.result.length; i++) {
          ConservationMeasuresModel cm = model.result.elementAt(i);
          measures = '$measures, ${cm.title}';
        }
      }
      return Right(species.copyWith(conservationMeasures: measures));
    } catch (e) {
      return const Left(ServerFailure('Errore ottenimento specie per regione'));
    }
  }
}
