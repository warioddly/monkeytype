import 'package:flutter/material.dart';
import 'package:monkeytype/features/typing/view/typing_view.dart';


class WrapperView extends StatefulWidget {
  const WrapperView({super.key});

  static const String route = '/home';

  @override
  State<WrapperView> createState() => _WrapperViewState();
}

class _WrapperViewState extends State<WrapperView> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [

          TypingView()


        ],
      ),
    );


  }

}
