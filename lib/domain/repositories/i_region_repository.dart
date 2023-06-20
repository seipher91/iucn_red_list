import 'package:dartz/dartz.dart';
import 'package:iucn_red_list/data/failure.dart';
import 'package:iucn_red_list/domain/entities/region.dart';

abstract class IRegionRepository {
  Future<Either<Failure, List<Region>>> getRegions();
}
