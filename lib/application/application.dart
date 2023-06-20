import 'package:flutter/material.dart';
import 'package:iucn_red_list/core/router/app_router.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();

    return MaterialApp.router(
      title: 'IUCN Red List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router(navigatorKey), //Generazione delle rotte
    );
  }
}
