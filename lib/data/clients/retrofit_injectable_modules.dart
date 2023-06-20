import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:iucn_red_list/data/clients/region_client.dart';
import 'package:iucn_red_list/data/env.dart';

@module
abstract class RetrofitInjectableModule {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(baseUrl: BASE_URL));

  @lazySingleton
  RegionClient get regionClient => RegionClient(dio);
}
