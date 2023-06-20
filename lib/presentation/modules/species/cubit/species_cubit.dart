// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:iucn_red_list/data/failure.dart';
import 'package:iucn_red_list/domain/usecases/species/get_species_usecase.dart';
import 'package:iucn_red_list/domain/entities/species.dart';

part 'species_state.dart';

@Injectable()
class SpeciesCubit extends Cubit<SpeciesState> {
  final GetSpeciesUsecase getSpeciesUsecase;

  SpeciesCubit(
    this.getSpeciesUsecase,
  ) : super(SpeciesInit());

  void init(String region) async {
    try {
      Either<Failure, List<Species>> result =
          await getSpeciesUsecase.execute(region);
      result.fold(
          (l) => emit(SpeciesError(l.message)), (r) => emit(SpeciesLoaded(r)));
    } catch (e) {
      emit(SpeciesError(e.toString()));
    }
  }

  void changeFilter() async {
    emit(SpeciesLoaded(state.species, state.region, !state.isFiltered));
  }

  List<Species> getListFiltered() {
    return state.species.where((element) => element.category == 'EN').toList();
  }
}
