import 'package:flutter/cupertino.dart';
import 'package:monkeytype/features/home/view/home_view.dart';


class AppRoute {


  static const String initialRoute = HomeView.route;

  static Map<String, Widget Function(BuildContext)> routes = {
    HomeView.route: (context) => const HomeView(),
  };


}