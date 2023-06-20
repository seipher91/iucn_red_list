import 'package:flutter/material.dart';
import 'package:iucn_red_list/domain/entities/species.dart';

class ConservationMeasuresPage extends StatefulWidget {
  const ConservationMeasuresPage({super.key, required this.species});
  final Species species;
  static const String routeName = '/conservation_measures';
  @override
  State<ConservationMeasuresPage> createState() =>
      _ConservationMeasuresPageState();
}

class _ConservationMeasuresPageState extends State<ConservationMeasuresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
