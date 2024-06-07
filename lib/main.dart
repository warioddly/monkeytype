import 'package:flutter/material.dart';
import 'package:monkeytype/core/configs/app_routes.dart';
import 'package:monkeytype/core/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme(),
      initialRoute: AppRoute.initialRoute,
      routes: AppRoute.routes,
    );
  }
}
