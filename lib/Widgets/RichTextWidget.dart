import 'package:flutter/gestures.dart';
import 'package:task/Utils/allExports.dart';

class RichTextWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String? thirdText;
  final TextStyle? firstStyle;
  final TextStyle? secondStyle;
  final TextStyle? thirdStyle;
  final TextDecoration? decoration;
  final VoidCallback onTap;

  const RichTextWidget({
    Key? key,
    required this.firstText,
    required this.secondText,
    this.thirdText,
    this.firstStyle,
    this.secondStyle,
    this.thirdStyle,
    this.decoration,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: firstStyle,
        children: [
          TextSpan(
            text: firstText,
          ),
          const TextSpan(text: " "), // Adds a space after firstText
          TextSpan(
            text: secondText,
            style: secondStyle,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
          if (thirdText != null) ...[
            const TextSpan(text: " "), // Adds a space before thirdText
            TextSpan(
              text: thirdText,
              style: thirdStyle,
            ),
          ],
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
