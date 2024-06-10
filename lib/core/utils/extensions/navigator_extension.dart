




import 'package:flutter/cupertino.dart';

extension NavigatorExtension on BuildContext {

  void go(String route) {
    Navigator.pushNamed(this, route);
  }

  void goBack() {
    Navigator.maybePop(this);
  }

}