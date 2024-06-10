import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkeytype/core/themes/colors.dart';
import 'package:monkeytype/features/typing/bloc/typing/typing_bloc.dart';

class TypingWidget extends StatefulWidget {
  const TypingWidget({super.key});

  @override
  State<TypingWidget> createState() => _TypingWidgetState();
}

class _TypingWidgetState extends State<TypingWidget> {


  static const String randomText = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";

  final FocusNode _focusNode = FocusNode()..requestFocus();

  late final typingBloc = context.read<TypingBloc>();


  Timer? _timer;

  String _typedText = "";


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        if(WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
          SystemChannels.textInput.invokeMethod("TextInput.hide");
          _focusNode.unfocus();
          typingBloc.add(TypingPause());
        }
        else {
          SystemChannels.textInput.invokeMethod("TextInput.show");
          _focusNode.requestFocus();
        }

      },
      child: KeyboardListener(
        focusNode: _focusNode,
        onKeyEvent: onKeyEvent,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: renderTextContent()
          ),
        ),
      ),
    );
  }


  List<TextSpan> renderTextContent() {

    List<TextSpan> textSpans = [];

    for (int index = 0; index < _typedText.length; index++) {

      if (randomText.length > index && _typedText[index] == randomText[index]) {
        textSpans.add(TextSpan(
          text: _typedText[index],
          style: const TextStyle(
            color: AppColors.white,
          ),
        ));
      }
      else {
        textSpans.add(TextSpan(
          text: randomText.length > index ? randomText[index] : _typedText[index],
          style: const TextStyle(
            color: AppColors.red,
          ),
        ));
      }

    }

    return [
      ...textSpans,
      TextSpan(
        text: _typedText.length < randomText.length ? randomText.substring(_typedText.length) : "",
        style: const TextStyle(
          color: AppColors.grey,
        ),
      ),
    ];

  }


  void onKeyEvent(KeyEvent event) {

    if (event is! KeyDownEvent) {
      return;
    }

    typingBloc.add(TypingStart());

    if (event.logicalKey == LogicalKeyboardKey.backspace) {

      if (_typedText.isNotEmpty) {
        _typedText = _typedText.substring(0, _typedText.length - 1);
        setState(() {});
      }
      return;
    }

    _typedText += event.character ?? "";

    if (_typedText.length >= randomText.length) {
      _typedText = "";
      typingBloc.add(TypingEnd());
    }

    setState(() {});


    _timer?.cancel();

    _timer = Timer(const Duration(milliseconds: 1000), () {
      typingBloc.add(TypingPause());
    });

  }


  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }


}
