import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iucn_red_list/domain/entities/species.dart';
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
            return Scaffold(
              body: SafeArea(
                child: ListView.builder(
                  itemCount: state.isFiltered
                      ? context.read<SpeciesCubit>().getListFiltered().length
                      : state.species.length,
                  itemBuilder: (context, index) {
                    Species item = state.isFiltered
                        ? context
                            .read<SpeciesCubit>()
                            .getListFiltered()
                            .elementAt(index)
                        : state.species.elementAt(index);
                    return ListTile(
                      title: Text(item.scientificName),
                      subtitle: state.isFiltered
                          ? Text(item.conservationMeasures ?? "")
                          : null,
                    );
                  },
                ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  context.read<SpeciesCubit>().changeFilter();
                },
                label: const Text('Endangered Species'),
              ),
            );

          default:
            return SizedBox();
        }
      },
    );
  }
}
