import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TyperWidget extends StatefulWidget {
  const TyperWidget({super.key});

  @override
  State<TyperWidget> createState() => _TyperWidgetState();
}

class _TyperWidgetState extends State<TyperWidget> {


  static const String randomText = "lorem ipsum dolor sit amet";

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

              _typedText += event.character ?? "";
              setState(() {});
            }


          },
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: _typedText,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),

                TextSpan(
                  text: _typedText.length < randomText.length ? randomText.substring(_typedText.length) : "",
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
