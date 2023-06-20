import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iucn_red_list/presentation/modules/species/cubit/species_cubit.dart';

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
                  itemCount: state.species.length,
                  itemBuilder: (context, index) => ListTile(
                      title:
                          Text(state.species.elementAt(index).scientificName)),
                ),
              ),
            );

          default:
            return SizedBox();
        }
      },
    );
  }
}
