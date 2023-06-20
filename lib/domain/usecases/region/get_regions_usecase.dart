import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:iucn_red_list/data/failure.dart';
import 'package:iucn_red_list/domain/entities/region.dart';
import 'package:iucn_red_list/domain/repositories/i_region_repository.dart';

@LazySingleton()
class GetRegionsUsecase {
  final IRegionRepository repository;

  GetRegionsUsecase(this.repository);

  Future<Either<Failure, List<Region>>> execute() => repository.getRegions();
}
