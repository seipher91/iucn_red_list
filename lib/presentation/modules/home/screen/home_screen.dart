import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iucn_red_list/presentation/modules/home/cubit/region_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionCubit, RegionState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case RegionInit:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );

          case RegionLoading:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case RegionError:
            return Scaffold(
              body: Center(
                child: Text((state as RegionError).message),
              ),
            );
          case RegionLoaded:
            return Scaffold(
              body: SafeArea(
                child: ListView.builder(
                  itemCount: state.regions.length,
                  itemBuilder: (context, index) => ListTile(
                      onTap: () => GoRouter.of(context).push("/details",
                          extra: state.regions.elementAt(index).identifier),
                      title: Text(state.regions.elementAt(index).name)),
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
