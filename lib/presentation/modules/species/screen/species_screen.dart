import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iucn_red_list/domain/entities/species.dart';
import 'package:iucn_red_list/presentation/modules/common/dropdown_menu_item.dart';
import 'package:iucn_red_list/presentation/modules/species/cubit/species_cubit.dart';
import 'package:go_router/go_router.dart';

class SpeciesScreen extends StatelessWidget {
  const SpeciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeciesCubit, SpeciesState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case SpeciesInit:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case SpeciesLoading:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case SpeciesError:
            return Scaffold(
              body: Center(
                child: Text((state as SpeciesError).message),
              ),
            );
          case SpeciesLoaded:
            List<Species> currentSpecies = [];
            switch (state.selectedFilter) {
              case 'ALL':
                currentSpecies = state.species;
              case 'MAMMAL':
                currentSpecies =
                    context.read<SpeciesCubit>().getListFilteredForClass();
                print(currentSpecies);

              case 'CR':
                currentSpecies = context.read<SpeciesCubit>().getListFiltered();
            }
            return Scaffold(
              appBar: AppBar(
                title: Text(state.region),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    DropdownButton(
                        value: state.selectedFilter,
                        items: dropdownItems,
                        onChanged: (valueFilter) {
                          context
                              .read<SpeciesCubit>()
                              .changeFilter(valueFilter!);
                        }),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: (currentSpecies.isEmpty)
                          ? const Center(child: Text('No species available'))
                          : ListView.builder(
                              itemCount: currentSpecies.length,
                              itemBuilder: (context, index) {
                                Species item = currentSpecies.elementAt(index);
                                return ListTile(
                                  title: Text(item.scientificName),
                                  subtitle: state.selectedFilter == 'CR'
                                      ? Text(item.conservationMeasures ?? "")
                                      : null,
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
              // floatingActionButton: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     FloatingActionButton.extended(
              //       onPressed: () {
              //         context.read<SpeciesCubit>().changeFilter();
              //       },
              //       label: const Text('Endangered Species'),
              //     ),
              //     FloatingActionButton.extended(
              //       onPressed: () {
              //         context.read<SpeciesCubit>().getListFilteredForClass();
              //       },
              //       label: const Text('Mammal Species'),
              //     ),
              //   ],
              // ),
            );

          default:
            return SizedBox();
        }
      },
    );
  }
}
