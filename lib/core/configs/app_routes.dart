import 'package:flutter/cupertino.dart';
import 'package:monkeytype/features/profile/view/profile_view.dart';
import 'package:monkeytype/features/typing/view/typing_view.dart';
import 'package:monkeytype/features/wrapper/wrapper_view.dart';


class AppRoute {


  static const String initialRoute = TypingView.route;

  static Map<String, Widget Function(BuildContext)> routes = {
    WrapperView.route: (context) => const WrapperView(),
    ProfileView.route: (context) => const ProfileView(),
    TypingView.route:  (context) => const TypingView(),
  };


}