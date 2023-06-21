// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:iucn_red_list/data/failure.dart';
import 'package:iucn_red_list/domain/usecases/species/get_conservation_measures_usecase.dart';
import 'package:iucn_red_list/domain/usecases/species/get_species_usecase.dart';
import 'package:iucn_red_list/domain/entities/species.dart';

part 'species_state.dart';

@Injectable()
class SpeciesCubit extends Cubit<SpeciesState> {
  final GetSpeciesUsecase getSpeciesUsecase;
  final GetConservationMeasuresUsecase getConservationMeasuresUsecase;

  SpeciesCubit(
    this.getSpeciesUsecase,
    this.getConservationMeasuresUsecase,
  ) : super(const SpeciesInit());

  void init(String region) async {
    try {
      Either<Failure, List<Species>> result =
          await getSpeciesUsecase.execute(region);
      result.fold((l) => emit(SpeciesError(l.message)),
          (r) => emit(SpeciesLoaded(r, region)));
    } catch (e) {
      emit(SpeciesError(e.toString()));
    }
  }

  void changeFilter(String valueFilter) async {
    List<Species> species = state.species;
    double start = 0;
    double unit = 100 / getListFiltered().length;
    if (valueFilter == 'CR') {
      emit(SpeciesLoading(state.species, state.region, valueFilter));
      for (var i = 0; i < species.length; i++) {
        if ((species.elementAt(i).category == "CR") &&
            (species[i].conservationMeasures == null)) {
          Either<Failure, Species> result = await getConservationMeasuresUsecase
              .execute(species[i], state.region);
          result.fold(
            (l) => emit(SpeciesError("Errore fetch conservation measures",
                species, state.region, valueFilter)),
            (r) {
              species[i] = r;
            },
          );
          start += unit;
          print(
              "Charged {Species name:${species[i].scientificName}, measures:${species[i].conservationMeasures ?? ""}} | status:${start.toStringAsFixed(2)}%");
        }
      }
      emit(SpeciesLoaded(species, state.region, valueFilter));
    } else {
      emit(SpeciesLoaded(state.species, state.region, valueFilter));
    }
  }

  List<Species> getListFiltered() {
    return state.species.where((element) => element.category == 'CR').toList();
  }

  List<Species> getListFilteredForClass() {
    List<Species> speciesFiltered = state.species
        .where(
            (element) => element.className.toLowerCase().contains('mammalia'))
        .toList();
    return speciesFiltered;
  }

  // void goToConservationMeasures(Species specie) async {
  //   if (specie.conservationMeasures == null) {
  //     SpeciesState oldState = state;
  //     try {
  //       Either<Failure, Species> result =
  //           await getConservationMeasuresUsecase.execute(specie, state.region);
  //       result.fold(
  //         (l) => emit(SpeciesError("Errore fetch conservation measures",
  //             oldState.species, oldState.region, oldState.isFiltered)),
  //         (r) {
  //           List<Species> currentSpecies = oldState.species;
  //           currentSpecies[oldState.species
  //               .indexWhere((element) => element == specie)] = r;
  //           emit(SpeciesLoaded(
  //               oldState.species, oldState.region, oldState.isFiltered));
  //         },
  //       );
  //     } catch (e) {
  //       emit(SpeciesError("Errore fetch conservation measures",
  //           oldState.species, oldState.region, oldState.isFiltered));
  //     }
  //   } else {
  //     return;
  //   }
  // }
}
