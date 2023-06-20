import 'package:injectable/injectable.dart';
import 'package:iucn_red_list/data/clients/species_client.dart';
import 'package:iucn_red_list/data/models/species/species_response_model.dart';

abstract class ISpeciesRemoteDatasource {
  Future<SpeciesResponseModel> getSpeciesPerRegion(String region);
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
}
