import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monkeytype/core/themes/colors.dart';

class TyperWidget extends StatefulWidget {
  const TyperWidget({super.key});

  @override
  State<TyperWidget> createState() => _TyperWidgetState();
}

class _TyperWidgetState extends State<TyperWidget> {


  static const String randomText = "Sportsman delighted improving dashwoods instantly happiness six. Ham now amounted absolute not mistaken way pleasant whatever.";

  String _typedText = "";

  final FocusNode _focusNode = FocusNode()..requestFocus();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        if(WidgetsBinding.instance.window.viewInsets.bottom > 0.0)
        {
          SystemChannels.textInput.invokeMethod("TextInput.hide");
          _focusNode.unfocus();
        }
        else
        {
          SystemChannels.textInput.invokeMethod("TextInput.show");
          _focusNode.requestFocus();
        }

      },
      child: KeyboardListener(
          focusNode: _focusNode,
          onKeyEvent: (KeyEvent event) {

            if (event is KeyDownEvent) {
              print(event.logicalKey.keyLabel);


              if (event.logicalKey == LogicalKeyboardKey.backspace) {

                if (_typedText.isNotEmpty) {
                  _typedText = _typedText.substring(0, _typedText.length - 1);
                  setState(() {});
                }
                return;
              }


              if (_typedText.length >= randomText.length + 5) {
                _typedText = "";
                setState(() {});
                return;
              }

              _typedText += event.character ?? "";

              setState(() {});
            }


          },
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: _renderTextContent()
            ),
          ),
      ),
    );
  }



  List<TextSpan> _renderTextContent() {

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


}
