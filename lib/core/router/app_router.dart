import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iucn_red_list/presentation/modules/home/home_page.dart';
import 'package:iucn_red_list/presentation/modules/species/species_page.dart';

/// Classe per gestione delle rotte di navigazione dell'app che vanno aggiunte in rotes
class AppRouter {
  AppRouter() : super();

  static const String initialRoute = "/";

  static GoRouter router(GlobalKey<NavigatorState> navigatorKey) => GoRouter(
        navigatorKey: navigatorKey,
        initialLocation: initialRoute,
        routes: [
          GoRoute(
            path: HomePage.routeName,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: SpeciesPage.routeName,
            builder: (context, state) =>
                SpeciesPage(region: state.extra as String),
          ),
        ],
      );
}
