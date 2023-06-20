import 'package:dio/dio.dart';
import 'package:iucn_red_list/data/env.dart';
import 'package:iucn_red_list/data/models/species/conservation_measures_response_model.dart';
import 'package:iucn_red_list/data/models/species/species_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'species_client.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class SpeciesClient {
  factory SpeciesClient(Dio dio) = _SpeciesClient;

  @GET("/species/region/{region}/page/0?token={token}")
  Future<SpeciesResponseModel> getSpeciesPerRegion({
    @Path("token") required String token,
    @Path("region") required String region,
  });

  @GET("/measures/species/name/{name}/region/{region}?token={token}")
  Future<ConservationMeasuresResponseModel> getConservationMeasuresPerName({
    @Path("token") required String token,
    @Path("region") required String region,
    @Path("name") required String name,
  });
}
