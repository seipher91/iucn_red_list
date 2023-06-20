import 'package:injectable/injectable.dart';
import 'package:iucn_red_list/data/clients/species_client.dart';
import 'package:iucn_red_list/data/models/species/conservation_measures_response_model.dart';
import 'package:iucn_red_list/data/models/species/species_response_model.dart';

abstract class ISpeciesRemoteDatasource {
  Future<SpeciesResponseModel> getSpeciesPerRegion(String region);
  Future<ConservationMeasuresResponseModel> getConservationMeasures(
      String region, String name);
}

@LazySingleton(as: ISpeciesRemoteDatasource)
class SpeciesRemoteDatasource implements ISpeciesRemoteDatasource {
  final SpeciesClient regionClient;

  SpeciesRemoteDatasource(this.regionClient);

  @override
  Future<SpeciesResponseModel> getSpeciesPerRegion(String region) async {
    return await regionClient.getSpeciesPerRegion(
        token:
            '9bb4facb6d23f48efbf424bb05c0c1ef1cf6f468393bc745d42179ac4aca5fee',
        region: region);
  }

  @override
  Future<ConservationMeasuresResponseModel> getConservationMeasures(
      String region, String name) async {
    return await regionClient.getConservationMeasuresPerName(
        token:
            '9bb4facb6d23f48efbf424bb05c0c1ef1cf6f468393bc745d42179ac4aca5fee',
        region: region,
        name: name);
  }
}
