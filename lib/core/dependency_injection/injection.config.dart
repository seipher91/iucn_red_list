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
import '../../data/clients/retrofit_injectable_modules.dart' as _i17;
import '../../data/clients/species_client.dart' as _i5;
import '../../data/datasource/region_remote_datasource.dart' as _i6;
import '../../data/datasource/species_remote_datasource.dart' as _i9;
import '../../data/repositories/region_repository.dart' as _i8;
import '../../data/repositories/species_repository.dart' as _i11;
import '../../domain/repositories/i_region_repository.dart' as _i7;
import '../../domain/repositories/i_species_repository.dart' as _i10;
import '../../domain/usecases/region/get_regions_usecase.dart' as _i13;
import '../../domain/usecases/species/get_conservation_measures_usecase.dart'
    as _i12;
import '../../domain/usecases/species/get_species_usecase.dart' as _i14;
import '../../presentation/modules/home/cubit/region_cubit.dart' as _i15;
import '../../presentation/modules/species/cubit/species_cubit.dart' as _i16;

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
  gh.lazySingleton<_i5.SpeciesClient>(
      () => retrofitInjectableModule.speciesClient);
  gh.lazySingleton<_i6.IRegionRemoteDatasource>(
      () => _i6.RegionRemoteDatasource(gh<_i4.RegionClient>()));
  gh.lazySingleton<_i7.IRegionRepository>(
      () => _i8.RegionRepository(gh<_i6.IRegionRemoteDatasource>()));
  gh.lazySingleton<_i9.ISpeciesRemoteDatasource>(
      () => _i9.SpeciesRemoteDatasource(gh<_i5.SpeciesClient>()));
  gh.lazySingleton<_i10.ISpeciesRepository>(
      () => _i11.SpeciesRepository(gh<_i9.ISpeciesRemoteDatasource>()));
  gh.lazySingleton<_i12.GetConservationMeasuresUsecase>(
      () => _i12.GetConservationMeasuresUsecase(gh<_i10.ISpeciesRepository>()));
  gh.lazySingleton<_i13.GetRegionsUsecase>(
      () => _i13.GetRegionsUsecase(gh<_i7.IRegionRepository>()));
  gh.lazySingleton<_i14.GetSpeciesUsecase>(
      () => _i14.GetSpeciesUsecase(gh<_i10.ISpeciesRepository>()));
  gh.factory<_i15.RegionCubit>(
      () => _i15.RegionCubit(gh<_i13.GetRegionsUsecase>()));
  gh.factory<_i16.SpeciesCubit>(() => _i16.SpeciesCubit(
        gh<_i14.GetSpeciesUsecase>(),
        gh<_i12.GetConservationMeasuresUsecase>(),
      ));
  return getIt;
}

class _$RetrofitInjectableModule extends _i17.RetrofitInjectableModule {}
