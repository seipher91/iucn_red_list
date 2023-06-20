// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/clients/region_client.dart' as _i4;
import '../../data/clients/retrofit_injectable_modules.dart' as _i10;
import '../../data/datasource/region_remote_datasource.dart' as _i5;
import '../../data/repositories/region_repository.dart' as _i7;
import '../../domain/repositories/i_region_repository.dart' as _i6;
import '../../domain/usecases/region/get_regions_usecase.dart' as _i8;
import '../../presentation/modules/home/cubit/region_cubit.dart' as _i9;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final retrofitInjectableModule = _$RetrofitInjectableModule();
  gh.lazySingleton<_i3.Dio>(() => retrofitInjectableModule.dio);
  gh.lazySingleton<_i4.RegionClient>(
      () => retrofitInjectableModule.regionClient);
  gh.lazySingleton<_i5.IRegionRemoteDatasource>(
      () => _i5.RegionRemoteDatasource(gh<_i4.RegionClient>()));
  gh.lazySingleton<_i6.IRegionRepository>(
      () => _i7.RegionRepository(gh<_i5.IRegionRemoteDatasource>()));
  gh.lazySingleton<_i8.GetRegionsUsecase>(
      () => _i8.GetRegionsUsecase(gh<_i6.IRegionRepository>()));
  gh.factory<_i9.RegionCubit>(
      () => _i9.RegionCubit(gh<_i8.GetRegionsUsecase>()));
  return getIt;
}

class _$RetrofitInjectableModule extends _i10.RetrofitInjectableModule {}
