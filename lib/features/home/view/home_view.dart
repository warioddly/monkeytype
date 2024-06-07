import 'package:flutter/material.dart';
import 'package:monkeytype/core/configs/environment.dart';
import 'package:monkeytype/features/home/widgets/typer_widget.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const String route = '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Environment.APP_NAME),
          centerTitle: true,
        ),
        body: const Center(
          child: TyperWidget(),
        ),
      ),
    );
  }
}

