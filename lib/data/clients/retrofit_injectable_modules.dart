import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:iucn_red_list/data/clients/region_client.dart';
import 'package:iucn_red_list/data/clients/species_client.dart';
import 'package:iucn_red_list/data/env.dart';
import 'package:loggy/loggy.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';

@module
abstract class RetrofitInjectableModule {
  @lazySingleton
  Dio get dio {
    Dio dio = Dio(BaseOptions(baseUrl: BASE_URL));
    Loggy.initLoggy(
      logOptions: const LogOptions(LogLevel.all),
      logPrinter: const PrettyPrinter(),
    );
    dio.interceptors.add(LoggyDioInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        maxWidth: 1000000,
        errorLevel: LogLevel.error,
        requestLevel: LogLevel.info,
        responseLevel: LogLevel.info));
    return dio;
  }

  @lazySingleton
  RegionClient get regionClient => RegionClient(dio);

  @lazySingleton
  SpeciesClient get speciesClient => SpeciesClient(dio);
}
