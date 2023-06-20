import 'package:dio/dio.dart';
import 'package:iucn_red_list/data/env.dart';
import 'package:iucn_red_list/data/models/region_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'region_client.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class RegionClient {
  factory RegionClient(Dio dio) = _RegionClient;

  @GET("/region/list?token={token}")
  Future<RegionResponseModel> getRegions({
    @Path("token") required String token,
  });
}
