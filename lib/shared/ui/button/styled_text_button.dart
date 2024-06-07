import 'package:flutter/material.dart';
import 'package:monkeytype/core/themes/colors.dart';


class StyledTextButton extends StatelessWidget {

  const StyledTextButton({
    super.key,
    required this.text,
    this.onPressed
  });

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed?.call();
      },
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.black,
          fontSize: 16
        ),
      ),
    );
  }
}
