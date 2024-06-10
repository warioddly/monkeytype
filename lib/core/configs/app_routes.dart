import 'package:flutter/cupertino.dart';
import 'package:monkeytype/features/typing/view/typing_view.dart';


class AppRoute {


  static const String initialRoute = TypingView.route;

  static Map<String, Widget Function(BuildContext)> routes = {
    TypingView.route: (context) => const TypingView(),
  };


}