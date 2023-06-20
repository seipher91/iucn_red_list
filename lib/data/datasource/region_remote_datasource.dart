import 'package:injectable/injectable.dart';
import 'package:iucn_red_list/data/clients/region_client.dart';
import 'package:iucn_red_list/data/models/region/region_response_model.dart';

abstract class IRegionRemoteDatasource {
  Future<RegionResponseModel> getRegions();
}

@LazySingleton(as: IRegionRemoteDatasource)
class RegionRemoteDatasource implements IRegionRemoteDatasource {
  final RegionClient regionClient;

  RegionRemoteDatasource(this.regionClient);

  @override
  Future<RegionResponseModel> getRegions() async {
    return await regionClient.getRegions(
        token:
            '9bb4facb6d23f48efbf424bb05c0c1ef1cf6f468393bc745d42179ac4aca5fee');
  }
}
