import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:iucn_red_list/data/datasource/region_remote_datasource.dart';
import 'package:iucn_red_list/data/failure.dart';
import 'package:iucn_red_list/data/models/region/region_response_model.dart';
import 'package:iucn_red_list/domain/entities/region.dart';
import 'package:iucn_red_list/domain/repositories/i_region_repository.dart';

@LazySingleton(as: IRegionRepository)
class RegionRepository implements IRegionRepository {
  final IRegionRemoteDatasource remoteDatasource;

  RegionRepository(this.remoteDatasource);
  @override
  Future<Either<Failure, List<Region>>> getRegions() async {
    try {
      RegionResponseModel model = await remoteDatasource.getRegions();
      return Right(model.toEntity());
    } catch (e) {
      return const Left(ServerFailure('Errore ottenimento regione'));
    }
  }
}
