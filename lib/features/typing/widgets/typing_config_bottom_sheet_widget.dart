import 'package:flutter/material.dart';


class TypingConfigBottomSheetWidget extends StatefulWidget {
  const TypingConfigBottomSheetWidget({super.key});

  @override
  State<TypingConfigBottomSheetWidget> createState() => _TypingConfigBottomSheetWidgetState();
}

class _TypingConfigBottomSheetWidgetState extends State<TypingConfigBottomSheetWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.greenAccent,
      child: const Column(
        children: [

          Text("Typing Config Bottom Sheet"),




        ],
      )
    );
  }



}
