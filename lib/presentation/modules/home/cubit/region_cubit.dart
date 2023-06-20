// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:iucn_red_list/data/failure.dart';
import 'package:iucn_red_list/domain/entities/region.dart';
import 'package:iucn_red_list/domain/usecases/region/get_regions_usecase.dart';

part 'region_state.dart';

@Injectable()
class RegionCubit extends Cubit<RegionState> {
  final GetRegionsUsecase getRegionsUsecase;

  RegionCubit(
    this.getRegionsUsecase,
  ) : super(RegionInit()) {
    init();
  }

  void init() async {
    try {
      Either<Failure, List<Region>> result = await getRegionsUsecase.execute();
      result.fold(
          (l) => emit(RegionError(l.message)), (r) => emit(RegionLoaded(r)));
    } catch (e) {
      emit(RegionError(e.toString()));
    }
  }
}
