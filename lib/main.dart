import 'package:flutter/material.dart';
import 'package:iucn_red_list/application/application.dart';
import 'package:iucn_red_list/core/dependency_injection/injection.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Application();
  }
}
