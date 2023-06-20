import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iucn_red_list/presentation/modules/home/cubit/region_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:iucn_red_list/presentation/modules/home/screen/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<RegionCubit>(),
      child: const HomeScreen(),
    );
  }
}
