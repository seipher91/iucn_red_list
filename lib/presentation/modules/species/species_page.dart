import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:iucn_red_list/presentation/modules/species/cubit/species_cubit.dart';
import 'package:iucn_red_list/presentation/modules/species/screen/species_screen.dart';

class SpeciesPage extends StatefulWidget {
  SpeciesPage({super.key, required this.region});
  final String region;
  static const String routeName = '/species';
  @override
  State<SpeciesPage> createState() => _SpeciesPageState();
}

class _SpeciesPageState extends State<SpeciesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<SpeciesCubit>()..init(widget.region),
      child: const SpeciesScreen(),
    );
  }
}
